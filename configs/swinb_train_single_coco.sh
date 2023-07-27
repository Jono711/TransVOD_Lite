#!/usr/bin/env bash

set -x
T=`date +%m%d%H%M`

EXP_DIR=exps/exp1
mkdir -r ${EXP_DIR}
PY_ARGS=${@:1}
python -u main.py \
    --backbone swin_b_p4w7 \
    --epochs 100 \
    --lr_drop_epochs 10 20 35 50 75 \
    --lr 1e-4 \
    --num_feature_levels 1 \
    --num_queries 100 \
    --dilation \
    --batch_size 1 \
    --hidden_dim 256 \
    --num_workers 8 \
    --with_box_refine \
    --dataset_file 'coco' \
    --coco_path '/content/drive/MyDrive/YOLOv5 (1)/datasets/Trans_VOD_Lite_Worms/' \
    --output_dir ${EXP_DIR} \
    ${PY_ARGS} 2>&1 | tee ${EXP_DIR}/log.train.$T
