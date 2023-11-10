#!/bin/bash
#SBATCH --partition=queue
#SBATCH --time=14-00:00:00
#SBATCH -N 1 # Nodes
#SBATCH -n 1 # Tasks
#SBATCH --cpus-per-task=16
#SBATCH --error=bakta.%J.err
#SBATCH --output=bakta.%J.out
#SBATCH --mail-user=kaw97@case.edu
#SBATCH --mail-type=ALL

source activate bakta
cd /media/bigdrive1/kyle/janthino/input_genomes2/test_download/input_genomes

for genome in *fa*; 
do
#	mkdir $genome
        bakta $genome --db /home/kyle/bakta_db/db -o output

done
#bakta bin_0003.fna --db /home/kyle/bakta_db/db -o bin_0003_output
