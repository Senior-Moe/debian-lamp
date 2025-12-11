

# update repo and system
echo "update repo and system"

dnf update -y 

echo "install apache2"
sleep 3

dnf install -y httpd

echo "enable apache2"
sleep 2

systemctl enable --now httpd


echo "enable ports firewall-cmd"

#firewall-cmd --permanent --add-port=80/tcp

#firewall-cmd --permanent --add-port=443/tcp

#firewall-cmd --reload

echo "install mariadb"
sleep 2

dnf install mariadb-server mariadb -y

systemctl enable --now mariadb

mariadb-secure-installation 

dnf module enable php:8.2

dnf install php php-cli php-gd php-curl php-zip php-mbstring php-mysqlnd -y


