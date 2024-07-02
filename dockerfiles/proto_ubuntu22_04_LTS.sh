sudo apt update -y
sudo apt upgrade -y
sudo apt install python3.10-dev python3.11-dev virtualenvwrapper pybind11-dev cmake g++ gcc clang -y graphviz cmake
sudo apt install software-properties-common -y
sudo add-apt-repository ppa:deadsnakes/ppa -y
sudo apt install python3.9 -y
sudo apt install python3.12 -y
sudo apt install python3.12-dev -y
sudo apt install python3-virtualenv -y
sudo apt install python3.9-distutils python3.10-distutils python3.11-distutils python3.12-distutils

mkdir -p MIDIA/pipelines/git_cache

cd MIDIA

rm -rf midia_tester
git clone git@github.com:midiaIDorg/midia_tester
cd midia_tester
git pull
cd ..

rm -rf midia_experiments
git clone git@github.com:midiaIDorg/midia_experiments
cd midia_experiments
git pull
cd ..
5
rm -rf venv_midia_tester
virtualenv venv_midia_tester -p $(which python3.9)
venv_midia_tester/bin/pip install ./midia_tester

