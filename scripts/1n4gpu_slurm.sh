#!/bin/bash
#SBATCH -J roi1n4gpu8bloques_fives        # Nombre del trabajo
#SBATCH -o roi1n4gpu8bloques_output_%j.log   # Archivo para la salida estándar (%j expande al JobID)
#SBATCH -e roi1n4gpu8bloques_error_%j.log    # Archivo para la salida de errores
#SBATCH --nodes=1
#SBATCH --gres=gpu:a100:4        # Solicita 4 GPU A100 por nodo
#SBATCH --ntasks-per-node=1
#SBATCH --cpus-per-task=48                     # 32 núcleos de CPU
#SBATCH --mem=247G                # Memoria total
#SBATCH -p medium
#SBATCH -t 3-00:00:00              # Tiempo máximo de ejecución (2 horas)
# Cargar módulos necesarios
module load cesga/2020
module load python/3.9.9


cd /home/usc/ec/rsm/tfg_codebase_cesga/
source venv/bin/activate
# Ejecutar el script de entrenamiento
srun python3 ./code/training/run_benchmark.py
#srun --gres=gpu:a100:4 -c 48 --mem=48G --time=47:59:00 --pty
