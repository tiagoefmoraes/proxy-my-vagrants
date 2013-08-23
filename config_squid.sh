sudo iptables -t nat -F
sudo aptitude update
sudo aptitude -y install squid3
sudo stop squid3
sudo sed -i 's/^http_access deny all$/http_access allow all/g' /etc/squid3/squid.conf
sudo sed -i 's/^http_port 3128$/http_port 3128 transparent/g' /etc/squid3/squid.conf
sudo sed -i 's/^#cache_dir ufs \/var\/spool\/squid3 100 16 256$/cache_dir ufs \/var\/spool\/squid3 100 16 256/g' /etc/squid3/squid.conf

#http://itkia.com/using-squid-to-cache-apt-updates-for-debian-and-ubuntu/
sudo sed -i 's/^# maximum_object_size 4096 KB$/maximum_object_size 100 MB/g' /etc/squid3/squid.conf
sudo sed -i 's/^# cache_replacement_policy lru$/cache_replacement_policy heap LFUDA/g' /etc/squid3/squid.conf
sudo sed -i 's/^refresh_pattern .		0	20%	4320$/refresh_pattern .		0	20%	4320  refresh_ims/g' /etc/squid3/squid.conf

sudo rm -r  /var/spool/squid3
sudo mkdir -p /vagrant/cache
sudo ln -s /vagrant/cache /var/spool/squid3

sudo start squid3

