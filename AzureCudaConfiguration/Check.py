import tensorflow as tf
import torch
import os

check = []

if len(tf.config.list_physical_devices('GPU'))!=0:

	check.append("Tensorflow GPU check: True")

else:

	check.append("Tensorflow GPU check: False")


if torch.cuda.is_available():
	
	check.append("PyTorch GPU check: True")

else:

	check.append("PyTorch GPU check: False")

os.system("clear")

print("\n\n \033[0;31m demir.ai - Azure GPU server configuration \033[0m \n")
print(" \033[0;34m")

for i in check:

	print(" ",i, "\n")

print("  nvidia-smi (check)")
os.system("nvidia-smi")

print("\n\n \033[0m \n")