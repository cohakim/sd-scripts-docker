
accelerate launch                                                
  --config_file /services/train/config/accelerate.config         
  --num_cpu_threads_per_process 1                                
  train_network.py                                               
  --pretrained_model_name_or_path=/training_data/pretrained_model.safetensors 
  --dataset_config=/services/train/config/dataset.toml           
  --output_dir="/output"                                         
  --output_name='mylora.safetensors'                             
  --train_batch_size=1                                           
  --max_train_epochs=5                                           
  --optimizer_type=AdamW8bit                                     
  --learning_rate=1e-4                                           
  --network_dim=128                                              
  --network_alpha=128                                            
  --bucket_no_upscale                                            
  --lr_scheduler=cosine_with_restarts                            
  --lr_scheduler_num_cycles=4                                    
  --lr_warmup_steps=500                                          
  --keep_tokens=1                                                
  --shuffle_caption                                              
  --caption_dropout_rate=0.05                                    
  --save_model_as=safetensors                                    
  --clip_skip=2                                                  
  --seed=42                                                      
  --color_aug                                                    
  --mixed_precision=bf16                                         
  --network_module=networks.lora                                 
  --persistent_data_loader_worker                                
  --xformers
