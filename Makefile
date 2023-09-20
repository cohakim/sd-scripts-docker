ASSET_DIR := ~/assets
SD_DIR    := ~/sd
DATASET   := DATASET

.PHONY: prepare
prepare:
	cp -n $(ASSET_DIR)/training_data/pretrained_models/*.safetensors training_data/pretrained_models/

.PHONY: up
up:
ifndef DATASET
	docker compose run --rm train DATASET=$(DATASET)
else
	@echo 'The "DATASET" variable is not set. Defaulting to a zundamon_v0.1.'
	DATASET=zundamon_v0.1 docker compose run --rm train
endif

.PHONY: batch
batch:
	/bin/bash batch.sh

.PHONY: send
send:
	sudo cp -n output/*.safetensors $(SD_DIR)/models/Lora/
