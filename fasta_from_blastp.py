#!/usr/bin/env python3

#the following is a script to extract the aligned sequence from a tabular blast output. 

import pandas as pd
import numpy as np
import io

input = "/media/bigdrive1/kyle/hemiasterlin_phylogeny/out_hemiasterlin_a_domains.fa.tab"
fasta = "/media/bigdrive1/kyle/hemiasterlin_phylogeny/hemiasterlin_a_domain_hits.fa"
headers = ['qseqid', 'stitle', 'pident', 'evalue', 'qlen', 'slen', 'full_qseq', 'sseq']

#load blast results in tab format (outfmt 6), make sure your output has the same column order
blast_df = pd.read_table(input,names=headers)
#dereplicate duplicate hits
df_derep = blast_df.drop_duplicates(subset = 'stitle')
#write to fasta
with io.open(fasta, 'w') as f:
	query_written = False

	for i, row in df_derep.iterrows():
		f.write('>' + str(row['stitle']) + '\n' + str(row['sseq']) + '\n')
		
		if not query_written:
			f.write('>' + str(row['qseqid']) + '\n' + str(row['qseq']) + '\n')
			query_written=True

