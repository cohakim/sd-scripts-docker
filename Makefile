ASSET_DIR := ~/assets
SD_DIR    := ~/sd

.PHONY: prepare
prepare:
	cp -n $(ASSET_DIR)/training_data/pretrained_models/*.safetensors training_data/pretrained_models/

.PHONY: train
train:
	docker compose run --rm -e DATASET train DATASET=$(DATASET)

.PHONY: batch
batch:
	/bin/bash batch.sh

.PHONY: send
send:
	sudo cp -n output/*.safetensors $(SD_DIR)/models/Lora/
