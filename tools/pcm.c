#include <stdio.h>
#include <stdnoreturn.h>
#include <stdarg.h>
#include <stdlib.h>
#include <string.h>
#include <stdint.h>
#include "common.h"

#define BASE_SAMPLE_RATE 16384.0

struct Wave
{
    uint16_t format;
    uint16_t num_channels;
    uint32_t sample_rate;
    uint32_t byte_rate;
    uint16_t block_align;
    uint16_t bits_per_sample;
    unsigned char * data;
    size_t size;
};

static int compare_uint(const void *a, const void *b) {
    return (*(const unsigned *)b) - (*(const unsigned *)a);
}

void convert_to_wav(const char * filename) {
    fatal_error("not supported");
}

void convert_to_pcm(const char * filename) {
    unsigned sample_bins[16];
    char magic[4];
    static char outfnamebuffer[1024];
    struct Wave wave = {0xffff};
    uint16_t * params = NULL;
    FILE * in_wav = fopen(filename, "rb");
    if (in_wav == NULL) {
        fatal_error("unable to open file '%s' for reading", filename);
    }
    strcpy(outfnamebuffer, filename);
    strcpy(strrchr(outfnamebuffer, '.'), ".pcm");
    FILE * outfile = fopen(outfnamebuffer, "wb");
    if (outfile == NULL) {
        fclose(in_wav);
        fatal_error("unable to open output file");
    }
    if (fread(magic, 1, 4, in_wav) != 4) {
        fclose(in_wav);
        fclose(outfile);
        fatal_error("error reading file '%s'", filename);
    }
    if (strncmp(magic, "RIFF", 4) != 0) {
        fclose(in_wav);
        fclose(outfile);
        fatal_error("file '%s' is not a valid WAV file", filename);
    }
    uint32_t file_size;
    if (fread(&file_size, 4, 1, in_wav) != 1) {
        fclose(in_wav);
        fclose(outfile);
        fatal_error("error reading file '%s'", filename);
    }
    char * wav_buffer = malloc(file_size);
    if (wav_buffer == NULL) {
        fclose(in_wav);
        fclose(outfile);
        fatal_error("error allocating read buffer for file '%s'", filename);
    }
    if (fread(wav_buffer, 1, file_size, in_wav) != file_size) {
        free(wav_buffer);
        fclose(in_wav);
        fclose(outfile);
        fatal_error("error reading RIFF file '%s'", filename);
    }
    fclose(in_wav);
    if (strncmp(wav_buffer + 0, "WAVE", 4) != 0) {
        free(wav_buffer);
        fclose(outfile);
        fatal_error("file '%s' is not a valid WAV file", filename);
    }
    int filepos = 4;
    char * data_p = NULL;
    size_t data_size = 0;
    for (int chunk_no = 0; chunk_no < 2; chunk_no++)
    {
        uint32_t subchunk_size = *(uint32_t *)(wav_buffer + filepos + 4);
        if (strncmp(wav_buffer + filepos, "fmt ", 4) == 0)
        {
            memcpy(&wave, wav_buffer + filepos + 8, sizeof(wave));
            if (subchunk_size > sizeof(wave))
            {
                params = malloc(subchunk_size - sizeof(wave));
                memcpy(params, wav_buffer + filepos + 8 + sizeof(wave),
                       subchunk_size - sizeof(wave));
            }
            filepos += 8 + subchunk_size;
        } else if (strncmp(wav_buffer + filepos, "data", 4) == 0) {
            if (wave.format == 0xFFFF) {
                free(wav_buffer);
                if (params != NULL)
                    free(params);
                fclose(outfile);
                fatal_error("data chunk before fmt chunk");
            }
            wave.data = (unsigned char *)(wav_buffer + filepos + 8);
            wave.size = subchunk_size;
        } else {
            strncpy(magic, wav_buffer + filepos, 4);
            free(wav_buffer);
            if (params != NULL)
                free(params);
            fclose(outfile);
            fatal_error("unrecognized subchunk: '%c%c%c%c'",
                magic[0], magic[1], magic[2], magic[3]);
        }
    }
    if (wave.data == NULL || wave.format == 0xFFFF) {
        free(wav_buffer);
        if (params != NULL)
            free(params);
        fclose(outfile);
        fatal_error("missing required chunk: '%s", wave.data == NULL ? "data" : "fmt ");
    }

    uint16_t sample_width = wave.bits_per_sample / 8;
    uint16_t num_channels = wave.num_channels;
    uint16_t sample_count = wave.size / (num_channels * sample_width);
    uint16_t sample_rate = wave.sample_rate;

    if (num_channels != 1) {
        unsigned char * in = wave.data + sample_width * num_channels;
        unsigned char * out = wave.data + sample_width;
        for (int i = 1; i < sample_count; i++) {
            memcpy(out, in, sample_width);
            out += sample_width;
            in += sample_width * num_channels;
        }
        wave.size /= num_channels;
    }

    double interval = (double)sample_rate / BASE_SAMPLE_RATE;
    double sample_count_d = (double)sample_count;
    double resample_count = (sample_count_d + interval - 1) / interval;
    size_t nresamples = ((size_t)resample_count + 1) / 2;
    unsigned char * resamples = malloc(nresamples);
    if (resamples == NULL) {
        free(wav_buffer);
        if (params != NULL)
            free(params);
        fclose(outfile);
        fatal_error("unable to allocate resample buffer");
    }
    int i, j;
    double di;
    int out_samples = 0;
    unsigned current_sample = 0;
    for (di = 0.0, j = 0; di < sample_count_d; di += interval, j++)
    {
        memcpy(&current_sample, &wave.data[(int)di], sample_width);
        for (i = 0; i < out_samples; i++)
        {
            if (current_sample == sample_bins[i])
                break;
        }
        if (i == out_samples)
        {
            if (out_samples == 16)
            {
                free(resamples);
                free(wav_buffer);
                if (params)
                    free(params);
                fclose(outfile);
                fatal_error("wave file is too complex to compress");
            }
            sample_bins[out_samples] = current_sample;
            out_samples++;
        }
    }
    qsort(sample_bins, out_samples, sizeof(unsigned), compare_uint);
    for (di = 0.0, j = 0; di < sample_count_d; di += interval, j++)
    {
        memcpy(&current_sample, &wave.data[(int)di], sample_width);
        for (i = 0; i < out_samples - 1; i++) {
            if (sample_bins[i] == current_sample)
                break;
        }
        if (j & 1)
            resamples[j++] |= (i & 0xF) << 4;
        else
            resamples[j] = i & 0xF;
    }
    free(wav_buffer);
    if (params)
        free(params);
    if (fwrite(resamples, 1, nresamples, outfile) != nresamples) {
        free(resamples);
        fclose(outfile);
        fatal_error("error writing output file");
    }
    free(resamples);
    fclose(outfile);
}

int main(int argc, char ** argv) {
    if (argc < 3) {
        fatal_error("incorrect arguments");
        return 1;
    }
    char * mode = argv[1];
    void (*method)(const char * filename);
    if (strcmp(mode, "wav") == 0) {
        method = convert_to_wav;
    } else if (strcmp(mode, "pcm") == 0) {
        method = convert_to_pcm;
    } else {
        fatal_error("unrecognized mode: %s", mode);
    }
    for (int i = 2; i < argc; i++) {
        method(argv[i]);
    }
    return 0;
}
