#!/bin/bash
PATH=/bin:/sbin:/usr/bin:/usr/sbin:/usr/local/bin:/usr/local/sbin:~/bin
export PATH
LANG=en_US.UTF-8

echo "OneIndex 安装脚本，By TheZihanGu"
echo "OneIndex 将安装在 /var/www/html"
echo "此脚本仅适用于Ubuntu和Debian系统。"
echo "将会自动安装Apache2和PHP7.2运行环境，请保证系统无安装其他Web服务端。"
echo "[警告]将会清空/var/www/html文件夹!"
echo "[必须]请使用root用户执行此脚本."
echo "项目页面：https://github.com/donwa/oneindex"
echo "Feedback：请到Issues反馈。"
echo "请按任意键开始安装，或者Ctrl+C来取消安装."
read
echo "开始安装..."
ln -sf bash /bin/sh
apt-get update -y
apt-get upgrade -y
apt-get install apache2 -y
apt-get install git -y
apt-get install unzip -y
apt-get install php7.2 -y
apt-get install php7.2-fpm php7.2-curl php7.2-json php7.2-mbstring php7.2-xml  php7.2-intl -y
cd /var/www/
git clone https://github.com/donwa/oneindex.git
rm -rf /var/www/html/
mv oneindex html
service restart apache2
echo "安装完成。请前往 http://[IP]/ 进行程序初始化。"