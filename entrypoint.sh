# /bin/bash

set -e

poetry run accelerate launch \
  --config_file accelerate.config \
  --num_cpu_threads_per_process 1 \
  train_network.py \
  --config_file=/config/config.toml \
  --dataset_config=/config/dataset.toml
