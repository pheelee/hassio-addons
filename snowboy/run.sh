#!/usr/bin/env bash
DIR="$( cd "$( dirname "$0" )" && pwd )"
CONFIG_PATH="/data/options.json"

pub_address="$(jq --raw-output '.pub_address' $CONFIG_PATH)"
pull_address="$(jq --raw-output '.pull_address' $CONFIG_PATH)"
model="$(jq --raw-output '.model' $CONFIG_PATH)"
sensitivity="$(jq --raw-output '.sensitivity' $CONFIG_PATH)"
audio_gain="$(jq --raw-output '.audio_gain' $CONFIG_PATH)"

cd "$DIR"
FLASK_APP=app.py flask run --host=0.0.0.0 --port=12102 &
python3 main.py \
        --pub-address "$pub_address" \
        --pull-address "$pull_address" \
        --model "$model" \
        --sensitivity "$sensitivity" \
        --gain "$audio_gain"
