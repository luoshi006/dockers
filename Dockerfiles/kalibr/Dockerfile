FROM stereolabs/kalibr:kinetic

# support https
RUN rm /etc/apt/sources.list.d/ros* -f
RUN apt-get update && apt-get install apt-transport-https -y

# 更新apt源
ADD sources.list_1604 /etc/apt/sources.list
RUN  apt-key adv --keyserver 'hkp://keyserver.ubuntu.com:80' --recv-key C1CF6E31E6BADE8868B172B4F42ED6FBAB17C654

RUN echo 'debconf debconf/frontend select Noninteractive' | debconf-set-selections
RUN apt-get update && apt-get install -y -q apt-utils dialog whiptail
RUN apt-get update && apt-get install -y -q git vim mlocate
RUN updatedb
