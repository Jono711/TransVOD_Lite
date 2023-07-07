#!/usr/bin/env bash

set -x
T=`date +%m%d%H%M`

EXP_DIR=exps/singlebaseline_swin_384_level1024/swin_e30_ld56_nf1_dim256_wbox_dc5_bs2_numquery_100
mkdir ${EXP_DIR}
PY_ARGS=${@:1}
python -u main.py \
    --backbone swin_b_p4w7 \
    --epochs 30 \
    --lr_drop_epochs 5 6 \
    --num_feature_levels 1\
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
