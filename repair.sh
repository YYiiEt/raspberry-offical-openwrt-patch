#!/bin/sh

wget https://raw.githubusercontent.com/YYiiEt/raspberry-offical-openwrt-patch/master/model.tar.gz
tar -zxvf model.tar.gz
if [ -d "model/" ];then
	cd model
	rm -f /usr/libexec/rpcd/luci && cp luci /usr/libexec/rpcd/
	/etc/init.d/rpcd restart
	rm -f /usr/share/rpcd/acl.d/luci-base.json && cp luci-base.json /usr/share/rpcd/acl.d/
	/etc/init.d/rpcd restart
	rm -f /www/luci-static/resources/view/status/include/10_system.js && cp 10_system.js /www/luci-static/resources/view/status/include/
	/etc/init.d/rpcd restart
	cd .. && rm -rf model model.tar.gz repair.sh
	echo "ok"
fi
