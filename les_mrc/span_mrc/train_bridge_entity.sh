#!/bin/bash
set -ex
DATA_DIR="/home/lq/projects/Research/Reading-Comprehension/les-military-mrc/input/bridge_entity_mrc_dataset_yingzq"
MODEL_DIR="/home/lq/projects/deep_learning/yingzq/pretrained_weights/chinese_wwm_pytorch"
MODEL_COMMENT="bridge_entity_test"

python run_les.py \
    --cuda_devices 1,3 \
    --task_name bridge_entity_mrc \
    --comment ${MODEL_COMMENT} \
    --model_type bert \
    --customer_model_class BertForLes \
    --model_name_or_path ${MODEL_DIR}/pytorch_model.bin \
    --config_name ${MODEL_DIR}/bert_config.json \
    --tokenizer_name ${MODEL_DIR}/vocab.txt \
    --do_train \
    --do_eval \
    --evaluate_during_training \
    --do_lower_case \
    --train_file ${DATA_DIR}/head100.json \
    --predict_file ${DATA_DIR}/head100.json \
    --output_dir bridge_entity_models/${MODEL_COMMENT} \
    --version_2_with_negative \
    --max_seq_length 512 \
    --max_query_length 64 \
    --max_answer_length 20 \
    --train_neg_sample_ratio 0.0 \
    --per_gpu_train_batch_size 8 \
    --per_gpu_eval_batch_size 24 \
    --learning_rate 3e-5 \
    --warmup_steps 5200 \
    --warmup_proportion 0.1 \
    --num_train_epochs 2 \
    --gradient_accumulation_steps 1 \
    --doc_stride 128 \
    --logging_steps 200 \
    --save_steps 8000 \
    --eval_steps 4000 \
    --null_score_diff_threshold 10 \