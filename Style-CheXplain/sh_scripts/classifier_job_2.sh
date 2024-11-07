#!/bin/bash
#---------------Script SBATCH - NLHPC ----------------
#SBATCH -J JupyterServer
#SBATCH -p v100
#SBATCH --gres=gpu:1
#SBATCH -t 1:00:00
#SBATCH -n 1
#SBATCH -c 1
#SBATCH --mem-per-cpu=10024
#SBATCH --mail-user=branndon.munoz@sansano.usm.cl
#SBATCH --mail-type=ALL 
#SBATCH -o out_JupyterServer_%j.out
#SBATCH -e err_JupyterServer_%j.err

ml GCC/13.2.0
ml miniconda3/24.3.0-zen4-h
ml CUDA/11.4.0

eval "$(conda shell.bash hook)"
conda activate test_env

python /home/bmunoz/proyectos/Style-CheXplain/code/train.py /home/bmunoz/proyectos/Style-CheXplain/dataset/ --arch StyleEx --batch 16 --output_path /home/bmunoz/proyectos/Style-CheXplain/classifiers/stylex/  --classifier_ckpt /home/bmunoz/proyectos/Style-CheXplain/classifiers/model.pth --wandb --filter_label Cardiomegaly --compare_to_healthy

