# /bin/bash

set -e

DATASET=zundamon_v0.1 docker compose run --rm -e DATASET train
