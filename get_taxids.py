#!/usr/bin/env python

#this script accepts a list of accession numbers, then searches prot.accession2taxid and outputs a tsv of paired accessions and taxids

from pathlib import Path
data_folder="/media/bigdrive1/kyle/"

db_path = data_folder + "prot.accession2taxid"
accession_path = data_folder + "at_accessions.txt"
output_path = data_folder + "paired_accessions_at2.txt"

accession_list = []
with open(accession_path, 'r') as file:
    for line in file:
        accession = line.strip()
        accession_list.append(accession)

accession_to_taxid = {}

# Open the accession2taxid file and process it line by line
with open(db_path, 'r') as file:
	for line in file:
        # Split each line into columns
		columns = line.strip().split('\t')
		if len(columns) >= 4:
			accession, accession_version, taxid, gi = columns
			if accession_version in accession_list:
				accession_to_taxid[accession_version] = taxid
				accession_list.remove(accession_version)
				with open(output_path, 'a') as outfile:
					outfile.write(f'{accession_version}\t{taxid}\n')
