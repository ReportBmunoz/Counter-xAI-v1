#!/bin/bash
#---------------Script SBATCH - NLHPC ----------------
#SBATCH -J JupyterServer
#SBATCH -p v100
#SBATCH --gres=gpu:1
#SBATCH -t 10-0:0:0
#SBATCH -n 1
#SBATCH -c 1
#SBATCH --mem-per-cpu=10024
#SBATCH --mail-user=branndon.munoz@sansano.usm.cl
#SBATCH --mail-type=ALL 
#SBATCH -o out_JupyterServer_%j.out
#SBATCH -e err_JupyterServer_%j.err

ml miniconda3/24.3.0-zen4-h

eval "$(conda shell.bash hook)"
conda activate test_env

python /home/bmunoz/proyectos/Style-CheXplain/code/train.py "/home/bmunoz/proyectos/Style-CheXplain/dataset/" --arch "StyleEx" --batch 16 --output_path "/home/bmunoz/proyectos/Style-CheXplain/classifiers/pcam/"  --classifier_ckpt "/home/bmunoz/proyectos/Style-CheXplain/classifiers/model_pcam_v3.pth" --filter_label "1" --compare_to_healthy
