# NXP i.MX8 Yocto Docker Enviroment

NXP i.MX6/7/8 yocto build docker environment. More please refer to my blog:
[Docker之嵌入式开发之应用](https://ahnniu.github.io/2018/12/04/getting-started-with-docker/)

## How-to

```bash
$ cd /path/to/docker-yocto-imx
# build image
$ docker build -t yocto-imx .
# Run a new container
$ docker run -p 2222:22 -it --name yocto yocto-imx bash
# Then you can run a new process like this:
$ docker exec -it yocto bash
# You can also manage this container to start / stop / restart
$ docker start yocto
```

### Enable SSH

Login into the container:

```bash
$ sudo apt-get update
$ sudo apt-get install openssh-server
# sudo service ssh status / start /stop / restart
$ sudo service ssh start
# 开机自动启动
$ sudo systemctl enable ssh
# 如有需要, 可以编辑ssh的配置文件, 比如支持root用户, 注意, 需要设置用户的密码用于ssh登录
# $ sudo passwd user
$ sudo nano /etc/ssh/sshd_config
$ sudo service ssh restart
```
### How to edit source files on container

I sugguest to use SFTP. If you use Sublime Text, the [SFTP](https://wbond.net/sublime_packages/sftp) plugin is recommanded.


