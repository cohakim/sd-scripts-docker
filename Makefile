TARGET           := TARGET_NAME
ASSETS_PATH      := ~/assets
PRETRAINED_MODEL := anylora.safetensors

.PHONY: copy-training-data
copy-training-data:
	mkdir -p training_data/dataset/teaching_data
	cp -n $(ASSETS_PATH)/training_data/dataset/$(TARGET)/teaching_data/* training_data/dataset/teaching_data
	cp -n $(ASSETS_PATH)/training_data/pretrained_models/$(PRETRAINED_MODEL) training_data/pretrained_model.safetensors

.PHONY: clean-training-data
clean-training-data:
	cd training_data/dataset/teaching_data && rm -f *.jpg *.jpeg *.png *.webp *.bmp
	cd training_data/dataset && rm -f retrained_model.safetensors

.PHONY: send-trained-model
send-trained-model:
	sudo cp output/mylora.safetensors.safetensors ~/sd/models/Lora/$(TARGET).safetensors
