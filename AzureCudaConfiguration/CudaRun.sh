clear
echo "\n\n \033[0;31m demir.ai - Azure GPU server configuration \033[0m \n"
echo " \033[0;34m Ubuntu required installations are being loaded and installed ... \033[0m"
sleep 3

echo 'Y' | sudo apt-get update
echo 'Y' | sudo apt-get upgrade
echo 'Y' | sudo apt install build-essential
echo 'Y' | sudo apt-get install manpages-dev

clear
echo "\n\n \033[0;31m demir.ai - Azure GPU server configuration \033[0m \n"
echo " \033[0;32m Ubuntu required installs have been loaded and installed. ✓\033[0m"
sleep 3


clear
echo "\n\n \033[0;31m demir.ai - Azure GPU server configuration \033[0m \n"
echo " \033[0;32m Ubuntu required installs have been loaded and installed. ✓\033[0m"
echo " \033[0;34m Installing NVIDIA CUDA 11.0 ...\033[0m"
sleep 3

wget https://developer.download.nvidia.com/compute/cuda/repos/ubuntu1804/x86_64/cuda-ubuntu1804.pin
echo 'Y' | sudo mv cuda-ubuntu1804.pin /etc/apt/preferences.d/cuda-repository-pin-600
echo 'Y' | sudo apt-key adv --fetch-keys https://developer.download.nvidia.com/compute/cuda/repos/ubuntu1804/x86_64/7fa2af80.pub
echo 'Y' | sudo add-apt-repository "deb https://developer.download.nvidia.com/compute/cuda/repos/ubuntu1804/x86_64/ /"
echo 'Y' | sudo apt-get update
wget http://developer.download.nvidia.com/compute/machine-learning/repos/ubuntu1804/x86_64/nvidia-machine-learning-repo-ubuntu1804_1.0.0-1_amd64.deb
echo 'Y' | sudo apt install ./nvidia-machine-learning-repo-ubuntu1804_1.0.0-1_amd64.deb
echo 'Y' | sudo apt-get update
wget https://developer.download.nvidia.com/compute/machine-learning/repos/ubuntu1804/x86_64/libnvinfer7_7.1.3-1+cuda11.0_amd64.deb
echo 'Y' | sudo apt install ./libnvinfer7_7.1.3-1+cuda11.0_amd64.deb
echo 'Y' | sudo apt-get update
echo 'Y' | sudo apt-get install --no-install-recommends cuda-11-0 libcudnn8=8.0.4.30-1+cuda11.0 libcudnn8-dev=8.0.4.30-1+cuda11.0
echo 'Y' | sudo apt-get install -y --no-install-recommends libnvinfer7=7.1.3-1+cuda11.0 libnvinfer-dev=7.1.3-1+cuda11.0 libnvinfer-plugin7=7.1.3-1+cuda11.0 


clear
echo "\n\n \033[0;31m demir.ai - Azure GPU server configuration \033[0m \n"
echo " \033[0;32m Ubuntu required installs have been loaded and installed. ✓\033[0m"
echo " \033[0;32m NVIDIA CUDA 11.0 Installed. ✓\033[0m"
sleep 3

clear
echo "\n\n \033[0;31m demir.ai - Azure GPU server configuration \033[0m \n"
echo " \033[0;32m Ubuntu required installs have been loaded and installed. ✓\033[0m"
echo " \033[0;32m NVIDIA CUDA 11.0 Installed. ✓\033[0m"
echo " \033[0;32m The required PATHs are set. ✓\033[0m"
sleep 3
echo "export LD_LIBRARY_PATH=/usr/local/cuda/lib64" >> ~/.bashrc
echo "export PATH=$PATH:/usr/local/cuda/bin" >> ~/.bashrc
source ~/.bashrc

clear
echo "\n\n \033[0;31m demir.ai - Azure GPU server configuration \033[0m \n"
echo " \033[0;32m Ubuntu required installs have been loaded and installed. ✓\033[0m"
echo " \033[0;32m NVIDIA CUDA 11.0 Installed. ✓\033[0m"
echo " \033[0;32m The required PATHs are set. ✓\033[0m"
echo " \033[0;34m Installing python3-dev and python3-pip ...\033[0m"
sleep 3

echo 'Y' | sudo apt-get install python3-dev
echo 'Y' | sudo apt-get install python3-pip
echo 'Y' | sudo apt install python3-testresources

clear
echo "\n\n \033[0;31m demir.ai - Azure GPU server configuration \033[0m \n"
echo " \033[0;32m Ubuntu required installs have been loaded and installed. ✓\033[0m"
echo " \033[0;32m NVIDIA CUDA 11.0 Installed. ✓\033[0m"
echo " \033[0;32m The required PATHs are set. ✓\033[0m"
echo " \033[0;32m Python3-dev and python3-pip Installed. ✓\033[0m"
sleep 3

clear
echo "\n\n \033[0;31m demir.ai - Azure GPU server configuration \033[0m \n"
echo " \033[0;32m Ubuntu required installs have been loaded and installed. ✓\033[0m"
echo " \033[0;32m NVIDIA CUDA 11.0 Installed. ✓\033[0m"
echo " \033[0;32m The required PATHs are set. ✓\033[0m"
echo " \033[0;32m Python3-dev and python3-pip Installed. ✓\033[0m"
echo " \033[0;34m Tensorflow-gpu 2 and pytorch gpu setup ...\033[0m"
sleep 3

echo 'Y' | pip3 install tensorflow-gpu==2.4.1
echo 'Y' | pip3 install keras
echo 'Y' | pip3 install torch torchvision torchaudio

clear
echo "\n\n \033[0;31m demir.ai - Azure GPU server configuration \033[0m \n"
echo " \033[0;32m Ubuntu required installs have been loaded and installed. ✓\033[0m"
echo " \033[0;32m NVIDIA CUDA 11.0 Installed. ✓\033[0m"
echo " \033[0;32m The required PATHs are set. ✓\033[0m"
echo " \033[0;32m Python3-dev and python3-pip Installed. ✓\033[0m"
echo " \033[0;32m Tensorflow-gpu 2 and pytorch gpu installed. ✓\033[0m"
source ~/.bashrc
sleep 3

sudo rm cuda-ubuntu1804.pin
sudo rm libnvinfer7_7.1.3-1+cuda11.0_amd64.deb
sudo rm nvidia-machine-learning-repo-ubuntu1804_1.0.0-1_amd64.deb

clear
python3 Check.py
