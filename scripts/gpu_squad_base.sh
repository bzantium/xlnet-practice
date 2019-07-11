#!/bin/bash

#### local path
SQUAD_DIR=data/squad
INIT_CKPT_DIR=xlnet_model
PROC_DATA_DIR=proc_data/squad
MODEL_DIR=experiment/squad

#### Use 3 GPUs, each with 8 seqlen-512 samples

python run_squad.py \
  --use_tpu=False \
  --num_hosts=1 \
  --num_core_per_host=2 \
  --model_config_path=${INIT_CKPT_DIR}/config.json \
  --spiece_model_file=mecab50_spiece.model \
  --output_dir=${PROC_DATA_DIR} \
  --init_checkpoint=${INIT_CKPT_DIR}/model.ckpt \
  --model_dir=${MODEL_DIR} \
  --train_file=${SQUAD_DIR}/train-v1.0.json \
  --predict_file=${SQUAD_DIR}/dev-v1.0.json \
  --uncased=False \
  --max_seq_length=512 \
  --do_train=True \
  --train_batch_size=8 \
  --do_predict=True \
  --predict_batch_size=32 \
  --learning_rate=2e-5 \
  --adam_epsilon=1e-6 \
  --iterations=1000 \
  --save_steps=1000 \
  --train_steps=12000 \
  --warmup_steps=1000 \
  $@
