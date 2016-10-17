#!/usr/bin/python3

import sys
import os
import numpy as np

def get_chain_length(array, x, y):
    best_run = -1
    max_x, max_y = array.shape
    while (array[x + best_run + 1, y + best_run + 1].any()) and (best_run < 32):
        if (x + best_run + 2 >= max_x) or (y + best_run + 2 >= max_y):
            break
        best_run += 1
    return best_run

def _2bpp_to_tz(infile, outfile):
    conts = infile.read()
    orig_size = infile.tell()
    substrings = np.array([[conts[i:(i + 3)] == conts[j:(j + 3)] for i in range(orig_size)] for j in range(orig_size)])
    buffer = [0x0000]
    output = []
    pos = 0
    while pos < orig_size - 3:
        if pos <= 3:
            buffer.append((1, conts[pos]))
            pos += 1
        elif substrings[pos, :pos].any():
            runs = [get_chain_length(substrings, pos, src) for src in range(pos)]
            run = np.inf
            offset = np.inf
            while (run > 0x1f) or (offset > 0x7ff):
                if run in runs:
                    runs[runs.index(run)] = -1
                run = max(runs)
                offset = max([idx for idx, rn in enumerate(runs) if rn == run])
                offset = pos - np.argmax(runs) - 1
            buffer.append((2, (run << 11) | offset))
            sys.stderr.write('{}: {} ({})\n'.format(pos, offset, run))
            sys.stderr.flush()
            buffer[0] |= 0x10000
            pos += run + 3
        else:
            buffer.append((1, conts[pos]))
            print(pos, 'literal')
            pos += 1
        buffer[0] >>= 1
        if len(buffer) == 17:
            buffer[0] = (2, buffer[0])
            output += buffer
            buffer = [0x0000]
    if len(buffer) > 1:
        ct = len(buffer)
        buffer[0] >>= (17 - ct)
        buffer[0] = (2, buffer[0])
        output += buffer
    buffer = b''
    for sz, vl in output:
        buffer += int(vl).to_bytes(sz, 'little')
    compressed_length = len(buffer)
    orig_size_bts = orig_size.to_bytes(2, 'little')
    if compressed_length > orig_size:
        outfile.write(b'\x00' + orig_size_bts + conts)
    else:
        outfile.write(b'\x01' + orig_size_bts + buffer)

def tz_to_2bpp(infile, outfile):
    mode = ord(infile.read(1))
    assert mode < 2, 'Filetype not recognized: ' + infilename
    remaining = int.from_bytes(infile.read(2), 'little')
    orig_size = remaining + 0
    if mode: # chunked
        cur_block_flags = 0
        cur_byte = 1
        while remaining > 0:
            cur_byte -= 1
            if cur_byte == 0:
                cur_block_flags = int.from_bytes(infile.read(2), 'little')
                cur_byte = 16
            duplicate = cur_block_flags & 1
            cur_block_flags >>= 1
            if duplicate:
                offset = int.from_bytes(infile.read(2), 'little')
                num_rev = ((offset >> 11) & 0x1f) + 3
                offset &= 0x7ff
                offset = -offset - 1
                for idx in range(num_rev):
                    src_addr = outfile.tell() + offset
                    dest_addr = outfile.tell()
                    outfile.seek(src_addr)
                    tmp = outfile.read(1)
                    outfile.seek(dest_addr)
                    outfile.write(tmp)
                    remaining -= 1
            else:
                outfile.write(infile.read(1))
                remaining -= 1
    else: # literal
        outfile.write(infile.read(remaining))

if __name__ == '__main__':
    if sys.argv[1] == 'decompress':
        for infilename in sys.argv[2:]:
            outfilename = os.path.splitext(infilename)[0]
            infile = open(infilename, 'rb')
            outfile = open(outfilename, 'w+b')
            tz_to_2bpp(infile, outfile)
            infile.close()
            outfile.close()
    elif sys.argv[1] == 'compress':
        for infilename in sys.argv[2:]:
            outfilename = infilename + '.tz'
            infile = open(infilename, 'rb')
            outfile = open(outfilename, 'w+b')
            _2bpp_to_tz(infile, outfile)
            infile.close()
            outfile.close()
    else:
        raise ValueError('unexpected method')
