> ref: https://hub.docker.com/r/stereolabs/kalibr
> ref: http://wiki.ros.org/docker/Tutorials/GUI

## Build Docker Image

```sh
sudo docker build -t kalibr:kinetic .
```

## Usage
### With PDF report
启动 Docker，使能可视化显示，非安全模式
```sh
xhost +local:root
docker run -it -e "DISPLAY" -e "QT_X11_NO_MITSHM=1" -v "/tmp/.X11-unix:/tmp/.X11-unix:rw" -v "~/foo:/foo" stereolabs/kalibr:kinetic
```
双目相机标定指令：
```sh
kalibr_calibrate_cameras --bag /foo/image.bag --target /foo/april.yaml --models 'pinhole-radtan' 'pinhole-radtan' --topics /cam0/image_raw /cam1/image_raw
```

### Without display
启动 Docker
```sh
docker run -v ~/foo:/foo -it stereolabs/kalibr:kinetic
```
双目标定命令：
```sh
kalibr_calibrate_cameras --bag /foo/sequence.bag --target /foo/april_6x6_80x80cm.yaml --models 'pinhole-radtan' 'pinhole-radtan' --topics /cam0/image_raw /cam1/image_raw --dont-show-report
```
