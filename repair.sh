#!/bin/sh

wget https://raw.githubusercontent.com/YYiiEt/raspberry-offical-openwrt-patch/master/model.tar
tar -xvf model.tar && cd model
rm -f /usr/libexec/rpcd/luci && cp luci /usr/libexec/rpcd/
rm -f /usr/share/rpcd/acl.d/luci-base.json && cp luci-base.json /usr/share/rpcd/acl.d/
rm -f /www/luci-static/resources/view/status/include/10_system.js && cp 10_system.js /www/luci-static/resources/view/status/include/
/etc/init.d/rpcd restart
rm -rf model model.tar

