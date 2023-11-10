#!/usr/bin/bash
#SBATCH --partition=queue
#SBATCH --time=14-00:00:00
#SBATCH -N 1 # Nodes
#SBATCH -n 1 # Tasks
#SBATCH --cpus-per-task=24
#SBATCH --error=unicycler.%J.err
#SBATCH --output=unicycler.%J.out
#SBATCH --mail-user=kaw97@case.edu.com
#SBATCH --mail-type=ALL

cd /home/kyle/Janthino

unicycler -1 Alaskan_both_1P.fastq -2 Alaskan_both_2P.fastq -l TWS1_filtered_subreads.fastq.gz --mode bold -o Janthino_unicycler_bold
