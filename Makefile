PYTHON := python
PYTHON3 := python3
MD5 := md5sum -c --quiet

.SUFFIXES:
.PHONY: all clean power speed
.SECONDEXPANSION:
.PRECIOUS: %.2bpp %.1bpp

gfx       := $(PYTHON) gfx.py
includes  := $(PYTHON) scan_includes.py
tzcomp    := $(PYTHON3) tz.py

telefang_obj := \
wram.o \
sram.o \
main.o \
gfx.o

telepower_obj := $(telefang_obj:.o=_power.o)
telespeed_obj := $(telefang_obj:.o=_speed.o)

roms := telepower.gbc telespeed.gbc

all: $(roms)
power: telepower.gbc
speed: telespeed.gbc

clean:
	rm -f $(roms) $(telepower_obj) $(telespeed_obj) $(roms:.gbc=.map) $(roms:.gbc=.sym)

compare: $(roms)
	@$(MD5) roms.md5

%.asm: ;

%_speed.o: deb = $(shell $(includes) $(@D)/$*.asm)
%_speed.o: %.asm $$(dep)
	rgbasm -D SPEED -o $@ $<

%_power.o: deb = $(shell $(includes) $(@D)/$*.asm)
%_power.o: %.asm $$(dep)
	rgbasm -D POWER -o $@ $<

%.o: dep = $(shell $(includes) $(@D)/$*.asm)
%.o: %.asm $$(dep)
	rgbasm -o $@ $<

telepower.gbc: $(telepower_obj)
	rgblink -n telepower.sym -m telepower.map -o $@ $^
	rgbfix -cv -i BXTJ -k 2N -l 0x33 -m 0x10 -p 0 -r 3 -t "TELEFANG PW" $@

telespeed.gbc: $(telespeed_obj)
	rgblink -n telespeed.sym -m telespeed.map -o $@ $^
	rgbfix -cv -i BTZJ -k 2N -l 0x33 -m 0x10 -p 0 -r 3 -t "TELEFANG SP" $@

%.png: ;
%.2bpp: %.png ; $(gfx) 2bpp $<
%.1bpp: %.png ; $(gfx) 1bpp $<
%.tz: ; # %.2bpp; $(tzcomp) compress $<

%.pal: %.2bpp ;
gfx/pics/%/normal.pal gfx/pics/%/bitmask.asm gfx/pics/%/frames.asm: gfx/pics/%/front.2bpp ;
%.bin: ;
%.blk: ;
%.tilemap: ;
