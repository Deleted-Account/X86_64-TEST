#!/bin/bash
#
# Copyright (c) 2019-2020 P3TERX <https://p3terx.com>
#
# This is free software, licensed under the MIT License.
# See /LICENSE for more information.
#
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part2.sh
# Description: OpenWrt DIY script part 2 (After Update feeds)
#

# Modify default IP
sed -i 's/10.10.10.1/192.168.10.1/g' package/base-files/files/bin/config_generate
sed -i 's/192.168.1.1/192.168.10.1/g' package/base-files/files/bin/config_generate


# 修改连接数数
# sed -i 's/net.netfilter.nf_conntrack_max=.*/net.netfilter.nf_conntrack_max=65535/g' package/kernel/linux/files/sysctl-nf-conntrack.conf
# 修正连接数（by ベ七秒鱼ベ）
sed -i '/customized in this file/a net.netfilter.nf_conntrack_max=65535' package/base-files/files/etc/sysctl.conf


# 设置密码为空（安装固件时无需密码登陆，然后自己修改想要的密码）
sed -i 's/$1$WplwC1t5$HBAtVXABp7XbvVjG4193B.:18753:0:99999:7/:0:0:99999:7/g' package/base-files/files/etc/shadow
sed -i 's@.*CYXluq4wUazHjmCDBCqXF*@#&@g' package/lean/default-settings/files/zzz-default-settings


# ServerChan
rm -rf package/luci-app-serverchan
rm -rf package/lean/luci-app-serverchan
rm -rf feeds/luci/applications/luci-app-serverchan

git clone https://github.com/tty228/luci-app-serverchan.git package/luci-app-serverchan


# Smartdns
rm -rf package/luci-app-smartdns
rm -rf package/lean/luci-app-smartdns
rm -rf feeds/luci/applications/luci-app-smartdns
rm -rf package/smartdns
rm -rf package/lean/smartdns
rm -rf feeds/luci/applications/smartdns

git clone https://github.com/pymumu/openwrt-smartdns.git package/smartdns
git clone -b lede https://github.com/pymumu/luci-app-smartdns.git package/luci-app-smartdns


# AList
# svn co https://github.com/sbwml/luci-app-alist/trunk/luci-app-alist package/luci-app-alist
# svn co https://github.com/sbwml/luci-app-alist/trunk/alist package/alist


# Add theme(s)
# git clone https://github.com/gngpp/luci-theme-design.git package/luci-theme-design


# Passwall
# rm -rf package/luci-app-passwall
# rm -rf package/lean/luci-app-passwall
# rm -rf feeds/luci/applications/luci-app-passwall

# svn co https://github.com/xiaorouji/openwrt-passwall/branches/luci/luci-app-passwall package/luci-app-passwall
# svn co https://github.com/xiaorouji/openwrt-passwall/trunk/shadowsocksr-libev package/shadowsocksr-libev
# svn co https://github.com/xiaorouji/openwrt-passwall/trunk/simple-obfs package/simple-obfs
# svn co https://github.com/xiaorouji/openwrt-passwall/trunk/tcping package/tcping

# svn co https://github.com/xiaorouji/openwrt-passwall/trunk/luci-app-passwall package/luci-app-passwall
# svn co https://github.com/xiaorouji/openwrt-passwall-packages/trunk/shadowsocksr-libev package/shadowsocksr-libev
# svn co https://github.com/xiaorouji/openwrt-passwall-packages/trunk/simple-obfs package/simple-obfs
# svn co https://github.com/xiaorouji/openwrt-passwall-packages/trunk/tcping package/tcping

# PassWall  
git clone --depth 1 https://github.com/xiaorouji/openwrt-passwall-packages.git passwall_packages
git clone --depth 1 https://github.com/xiaorouji/openwrt-passwall.git luci-passwall

# PassWall2
git clone --depth 1 https://github.com/xiaorouji/openwrt-passwall2.git luci-passwall2
