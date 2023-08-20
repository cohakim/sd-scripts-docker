#!/usr/bin/env bash

set -Eeuo pipefail

# TODO: maybe just use the .gitignore file to create all of these
mkdir -vp /cache \
          /cache/openai/clip-vit-large-patch14 \
          /cache/wd-v1-4-convnext-tagger-v2

echo "Downloading, this might take a while..."

cd /cache
git clone https://huggingface.co/openai/clip-vit-large-patch14 openai/clip-vit-large-patch14
git clone https://huggingface.co/SmilingWolf/wd-v1-4-convnext-tagger-v2 wd-v1-4-convnext-tagger-v2


