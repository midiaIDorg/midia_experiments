# ASSUMPTIONS:
# WE ARE ON UBUNTU 22.04 Jelly Something...
# THIS VM HAS A PUBLIC SSH KEY RECOGNIZED BY US ON GITHUB
# THERE ARE TEST DATA IN ~/data/G_8027.d ~/data/G_8045.d


# GENERAL REQUIREMENTS
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

sudo apt install tree

sudo apt install python3.9-venv
sudo apt install python3.10-venv
sudo apt install python3.11-venv
sudo apt install python3.12-venv
# sudo apt install python3.11 -y
# sudo apt install python3.12 -y

# PIPELINE ITSELF
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

rm -rf venv_midia_tester
python3.9 -m venv venv_midia_tester
venv_midia_tester/bin/python -m pip install --upgrade pip
venv_midia_tester/bin/pip install ./midia_tester

# GOOD PRACTICE: RUN AN INITIAL PIPELINE ON 5P TEST DATA WITH THE CODE BELOW
cd pipelines
../venv_midia_tester/bin/midia_setup.py -o 2023_11_16_fishy -c ../midia_experiments/matteo_devel/2024_07_01_november_rain_paper.toml -f
# BY NOW YOU SHOULD HAVE ONE COMLETE ANALYSIS DONE

../venv_midia_tester/bin/midia_setup.py -o 2023_11 november_rain_paper  -c ../midia_experiments/matteo_devel/2024_07_01_november_rain_paper.toml -r regression_2

# cd matteo_devel/2023_11_08_mz_recalibrations
# source venv_2023_11_08_mz_recalibrations/bin/activate
# cd midia_pipe



# sudo apt install python3.11 -y
# sudo apt install python3.12 -y

# ../venv_midia_tester/bin/midia_setup.py -o 2023_11_16_fishy -r all5P -f