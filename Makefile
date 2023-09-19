TARGET           := TARGET_NAME
ASSETS_PATH      := ~/assets
PRETRAINED_MODEL := anylora.safetensors

.PHONY: copy-training-data
copy-training-data:
	mkdir -p training_data/dataset
	cp -Rn $(ASSETS_PATH)/training_data/dataset/$(TARGET) training_data/dataset
	cp -n $(ASSETS_PATH)/training_data/pretrained_models/$(PRETRAINED_MODEL) training_data/pretrained_model.safetensors

.PHONY: clean-training-data
clean-training-data:
	rm -rf training_data/dataset
	cd training_data/dataset && rm -f pretrained_model.safetensors

.PHONY: train
train:
	docker compose run --rm train

.PHONY: send-trained-model
send-trained-model:
	sudo cp output/mylora.safetensors ~/sd/models/Lora/$(TARGET).safetensors
