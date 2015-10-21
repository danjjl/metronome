#include "metronome.h"

void Metronome::makeBeat(const qint16 &tempo){

    FILE * infile = fopen("metronome/b.wav","rb");		// Open wave file in read mode
	fpos_t endheader;
	FILE * outfile = fopen("/home/phablet/.local/share/metronome.danjjl/beat.wav","wb");		// Create output ( wave format) file in write mode

	short int buff16;				// short int used for 16 bit as input data format is 16 bit PCM audio
	header_p meta = (header_p)malloc(sizeof(header));	// header_p points to a header struct that contains the wave file metadata fields
	if (infile && outfile){
		fread(meta, 1, sizeof(header), infile);
		fgetpos(infile, &endheader);

		int initialSamples = meta->subchunk2_size;
		float silence = 60.0/float(tempo) - float(meta->subchunk2_size)/float((meta->bits_per_sample/8) * meta->sample_rate * meta->num_channels);
		int samplesSilence = meta->num_channels * meta->sample_rate * silence; // calculate silence period
		meta->subchunk2_size += (samplesSilence*2)*2 + initialSamples; // 2 full periods

		fwrite(meta,1, sizeof(*meta), outfile);

		for(unsigned short int period=0; period<2; period++){
			fsetpos(infile, &endheader);

			for(int i=0; i < initialSamples/(meta->bits_per_sample/8); i++){
				fread(&buff16,2,1,infile);		// Copy beat
				fwrite(&buff16,2,1,outfile);
			}

		buff16 = 0;
		for(int i=0; i < samplesSilence; i++)
			fwrite(&buff16,2,1,outfile);//Silence
		}

		fclose(infile);
		fclose(outfile);
	}	
}
