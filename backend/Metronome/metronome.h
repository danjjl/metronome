#ifndef METRONOME_H
#define METRONOME_H

#include <stdio.h>
#include <stdlib.h>

#include <QObject>

// WAVE PCM soundfile format
typedef struct header_file{
	char chunk_id[4];
	int chunk_size;
	char format[4];
	char subchunk1_id[4];
	int subchunk1_size;
	short int audio_format;
	short int num_channels;
	int sample_rate;
	int byte_rate;
	short int block_align;
	short int bits_per_sample;
	char subchunk2_id[4];
	int subchunk2_size;			// subchunk2_size denotes the number of samples.
} header;

typedef struct header_file* header_p;


class Metronome : public QObject{
	Q_OBJECT

public:
	Q_INVOKABLE void makeBeat(const qint16 &tempo);
};

#endif