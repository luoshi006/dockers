## mirror setup

> ref: http://mirrors.ustc.edu.cn/help/dockerhub.html

- 创建配置文件 `sudo vi /etc/docker/daemon.json`

- 配置 USTC 镜像源

```dockerfile
{
  "registry-mirrors": ["https://docker.mirrors.ustc.edu.cn/"]
}
```

- 重新启动 docker

```sh
sudo systemctl restart docker
```

