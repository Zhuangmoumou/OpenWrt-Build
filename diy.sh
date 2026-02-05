#!/bin/bash

# 1. 创建 files 目录结构
mkdir -p files/etc/uci-defaults

# 2. 编写初始化配置脚本
cat << 'EOF' > files/etc/uci-defaults/99-custom-settings
#!/bin/sh

# --- 主题设置 ---
uci set luci.main.mediaurlbase='/luci-static/argon'

# --- 网络设置 (旁路由模式) ---
# 1. 设置 LAN IP
uci set network.lan.ipaddr='192.168.1.5'
uci set network.lan.netmask='255.255.255.0'

# 2. 设置网关 (假设你的主路由 IP 是 192.168.1.1)
uci set network.lan.gateway='192.168.1.1'

# 3. 设置 DNS (使用主路由 IP 和公共 DNS)
uci del network.lan.dns
uci add_list network.lan.dns='192.168.1.1'
uci add_list network.lan.dns='223.5.5.5'

# 4. 禁用 IPv6 分配 (旁路由常用操作)
uci delete network.lan.ip6assign

# --- DHCP 设置 (旁路由必须关闭 DHCP 服务) ---
# 忽略 LAN 口的 DHCP 请求
uci set dhcp.lan.ignore='1'

# --- 禁用防火墙的一些干扰项 (可选) ---
# 旁路由有时需要开启 IP 动态伪装 (Masquerading)
# uci set firewall.@zone[0].masq='1'

# 提交配置
uci commit
exit 0
EOF

# 3. 赋予脚本执行权限
chmod +x files/etc/uci-defaults/99-custom-settings

