proxy-my-vagrants
=================

Proxy(squid) vagrant box for caching other vagrant boxes

Works with vagrant plugin [vagrant-proxy](https://github.com/clintoncwolfe/vagrant-proxy)

Some configurations based on http://itkia.com/using-squid-to-cache-apt-updates-for-debian-and-ubuntu/

## Usage
Configure `Vagrantfile` with your favorite vm.box (default precise32updated)

```shell
#install vagrant-proxy
vagrant plugin install vagrant-proxy

#start proxy-my-vagrants box
vagrant up
```

Start your own boxes and enjoy.

Proxy will be forwarded to host on port 8123 and vagrant-proxy will configure other boxes with iptables using the default host IP (10.0.2.2).
You can check it with `sudo iptables -t nat -L -n`

## Related plugins and projects

* [vagrant-proxy](https://github.com/clintoncwolfe/vagrant-proxy). Required to automatically configure boxes to use the proxy
* [vagrant-cachier](https://github.com/fgrehm/vagrant-cachier). Optional but recommended to directly cache several files. 
* [squid-box](https://github.com/sinegar/squid-box). Replacement for this box?
