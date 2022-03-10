# Makefile

EXE=d2q9-bgk
NEW=d2q9-bgknew


#CC=gcc
#CFLAGS= -std=c99 -Wall -Ofast -march="native" -g -fopenmp

CC=icc
CFLAGS= -std=c99 -Wall -Ofast -xHost -restrict -qopenmp -no-prec-sqrt -no-prec-div -ipo -simd
LIBS = -lm

FINAL_STATE_FILE=./final_state.dat
AV_VELS_FILE=./av_vels.dat
REF_FINAL_STATE_FILE=check/128x128.final_state.dat
# REF_FINAL_STATE_FILE=check/256x256.final_state.dat
 #REF_FINAL_STATE_FILE=check/1024x1024.final_state.dat
REF_AV_VELS_FILE=check/128x128.av_vels.dat
# REF_AV_VELS_FILE=check/256x256.av_vels.dat
 #REF_AV_VELS_FILE=check/1024x1024.av_vels.dat

all: $(EXE)

$(EXE): $(EXE).c
	$(CC) $(CFLAGS) $^ $(LIBS) -o $@

check:
	python check/check.py --ref-av-vels-file=$(REF_AV_VELS_FILE) --ref-final-state-file=$(REF_FINAL_STATE_FILE) --av-vels-file=$(AV_VELS_FILE) --final-state-file=$(FINAL_STATE_FILE)

.PHONY: all check clean

clean:
	rm -f $(EXE)
