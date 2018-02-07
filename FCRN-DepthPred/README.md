# FCRN-DepthPrediction docker
This docker image is running a Tensorflow implementation of FCRN-DepthPrediction
from this fork: https://github.com/DavidGillsjo/FCRN-DepthPrediction.git

of the original repo:

https://github.com/iro-cp/FCRN-DepthPrediction.git.

It can be pulled from dockerhub or build locally.
Building locally enables you to clone your host machine user properly.

## Dependencies
The image is built to run on a GPU and requires [docker](https://docs.docker.com/get-started/)
and [nvidia-docker](https://github.com/NVIDIA/nvidia-docker).

## Build
Simply run `./build.sh`.

This will setup a cloned user in the image.
If you need to use `sudo` to run docker, run this to clone your user `<myusername>`:
```
sudo DUSER=<myusername> ./build.sh
```

## Run locally
After building, run the image with:
- `./run_local.sh` for jupyter notebook
- `./run_local.sh bash` for interactive bash prompt

There are two optional arguments here:
- `DATA=<datadir>` allows you to mount a data directory which you access from within the container.
- `DHOME=<homedir>` allows you to mount a home directory which you access from within the container, defaults to `$HOME`.
- `DUSER=<myuser>` allows you to run the container as another user than the user executing the script

For example, mounting the data directory `/home/$USER/data` on the host and running as root:
```
DATA=/home/$USER/data DUSER=root ./run_local.sh bash
```

Or if you need to use `sudo` to run docker but want to run the container as your user `<myusername>`:
```
sudo DUSER=<myusername> ./run_local.sh bash
```

## Pull from dockerhub and run
Fastest way to get started, simply run `./run_dockerhub.sh`.
Same options as above.

## Run the net
Example:
```
cd fcrn/tensorflow
python predict.py NYU_FCRN.ckpt "<datapath>/*.JPG" -o <output_folder> -f mat,img
```
See `python predict.py --help` for more info.