#!/usr/bin/bash
#SBATCH --partition=queue
#SBATCH --time=14-00:00:00
#SBATCH -N 1 # Nodes
#SBATCH -n 1 # Tasks
#SBATCH --cpus-per-task=20
#SBATCH --mem 300G
#SBATCH --error=phylophlan.%J.err
#SBATCH --output=phylophlan.%J.out
#SBATCH --mail-user=kaw97@case.edu
#SBATCH --mail-type=ALL



source activate phylophlan

cd /media/bigdrive1/kyle/janthino/phylophlan

#phylophlan -i input_genomes2 -o janthino_phylophlan -d phylophlan --diversity medium -f oxalobacteraceae/proteobacteria_config.cfg


#phylophlan_get_reference \
#    -g f__Oxalobacteraceae\
#    -n -200 \
#    -o input_genomes2 \
#    --verbose 2>&1 | tee phylophlan_get_reference.log

#phylophlan -i input_genomes2 -o janthino_phylophlan -d phylophlan --diversity medium -f oxalobacteraceae/proteobacteria_config.cfg

for i in Spirochaetes Chlamydiae Planctomycetes Candidatus_Omintrophica Lentisphaerae Verrucomicrobia; do
    phylophlan_get_reference \
        -g p__${i} \
        -n 1 \
        -o input_genomes2 \
        --verbose 2>&1 | tee logs/phylophlan_get_reference_${i}.log
done;

phylophlan_write_config_file  \
    -d a \
    -o oxalobacteraceae/proteobacteria_config.cfg \
    --db_aa diamond \
    --map_dna diamond \
    --map_aa diamond \
    --msa mafft \
    --trim trimal \
    --tree1 fasttree \
    --tree2 raxml \


#phylophlan \
#    -i input_genomes2 \
#    -d phylophlan \
#    --diversity medium \
#    --accurate \
#    -f oxalobacteraceae/proteobacteria_config.cfg \
#    -o output_oxalobacteraceae \
#    --output_folder oxalobacteraceae \
#    --nproc 20 \
#    -t a \
#    --verbose 2>&1 | tee phylophlan_run.log
