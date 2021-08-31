> https://registry.hub.docker.com/r/starefossen/github-pages
>
> https://github.com/Starefossen/docker-github-pages

## Useage

将 github pages 项目根目录 挂在到 `/usr/src/app` 目录：

```sh
$ docker run -it --rm -v "$PWD":/usr/src/app -p "4000:4000" starefossen/github-pages
```

可以通过 `http://localhost:4000` 访问主页。

