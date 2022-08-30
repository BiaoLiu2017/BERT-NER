#!/usr/bin/env bash

  python BERT_NER.py\
    --task_name="NER"  \
    --do_lower_case=False \
    --crf=True \
    --do_train=True   \
    --do_eval=False   \
    --do_predict=True \
    --data_dir=train_dev_test_data_features   \
    --vocab_file=uncased_L-12_H-768_A-12/vocab.txt  \
    --bert_config_file=uncased_L-12_H-768_A-12/bert_config.json \
    --init_checkpoint=uncased_L-12_H-768_A-12/bert_model.ckpt   \
    --save_checkpoints_steps=100 \
    --max_seq_length=64   \
    --train_batch_size=64   \
    --eval_batch_size=64  \
    --predict_batch_size=256  \
    --learning_rate=2e-5   \
    --num_train_epochs=1.0   \
    --output_dir=./output/run_dir_features_retrain   \
    --middle_output=middle_data_features



perl conlleval.pl -d '\t' < ./output/run_dir_features_retrain/label_test.txt
