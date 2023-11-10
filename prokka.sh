#!/bin/bash
#SBATCH --partition=queue
#SBATCH --time=14-00:00:00
#SBATCH -N 1 # Nodes
#SBATCH -n 1 # Tasks
#SBATCH --cpus-per-task=10
#SBATCH --error=prokka.%J.err
#SBATCH --output=prokka.%J.out
#SBATCH --mail-user=kawolf1991@gmail.com
#SBATCH --mail-type=ALL

source activate prokka
cd /media/bigdrive1/kyle/geodiamolide_mapping/g_barretti_microbial_assembly/g_barretti_spades_750gb

for genome in contigs.fasta
do
        prokka \
        --outdir prokka_annotation --locustag ${genome/.fasta/''} --force --prefix ${genome/.fasta/''} ${genome} --compliant\

done


