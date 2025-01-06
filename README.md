# freetz-legacy
Easy to use Dockerfile for compiling old freetz images

## Install

```bash
apt install docker.io
git clone https://github.com/suuhm/freetz-legacy
cd freetz-legacy

# Build docker 
docker build -t freetz-builder .

```

## Run
```bash
# Check Docker images
#docker rmi <IMAGE_ID>
#docker images

# Docker kill ps
#docker ps -a
#docker rm -f <CONTAINER_ID>

docker run -it --name freetz-build1 freetz-builder /bin/bash
```

## Run with mounted images folder (optional)
```bash
mkdir -p $HOME/images_build
docker run -it --name freetz-build1 -v $HOME/images_build:/home/freetzuser/freetz/images freetz-builder /bin/bash
```

## Share the builded images
```bash
cd $HOME/images_build
python3 -m http.server 7777
```

### Now open the your browser on <YOUR_SERVER_IP>:7777 and download the file
![grafik](https://github.com/user-attachments/assets/f02b6f03-a156-43dd-b9e0-af1784b76d5c)


## Should also work on windows as well
If you have any questions, write an issue
