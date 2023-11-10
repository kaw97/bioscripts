#!/bin/bash

#given a multifasta and a list of contig names, extracts those contigs into a new fasta file

awk 'FNR==NR{a[$0];next} /^>/{val=$0;sub(/^>/,"",val);flag=val in a?1:0} flag' ids.txt contigs.fasta > NODE_1306_length_40374_cov_7.480096.fasta

