# Create new chain
iptables -t nat -N DNSCRYPTPROXY

# MiniLight's whitelist
iptables -t nat -A DNSCRYPTPROXY -m string --hex-string "|05|baidu|03|com" --algo bm -j RETURN
iptables -t nat -A DNSCRYPTPROXY -m string --hex-string "|06|taobao|03|com" --algo bm -j RETURN
iptables -t nat -A DNSCRYPTPROXY -m string --hex-string "|08|bilibili|03|com" --algo bm -j RETURN
iptables -t nat -A DNSCRYPTPROXY -m string --hex-string "|05|hdslb|03|net" --algo bm -j RETURN
iptables -t nat -A DNSCRYPTPROXY -m string --hex-string "|05|hdslb|03|com" --algo bm -j RETURN
iptables -t nat -A DNSCRYPTPROXY -m string --hex-string "|05|iqiyi|03|com" --algo bm -j RETURN
iptables -t nat -A DNSCRYPTPROXY -m string --hex-string "|02|qq|03|com" --algo bm -j RETURN
iptables -t nat -A DNSCRYPTPROXY -m string --hex-string "|04|sina|03|com" --algo bm -j RETURN
iptables -t nat -A DNSCRYPTPROXY -m string --hex-string "|06|wechat|03|com" --algo bm -j RETURN
iptables -t nat -A DNSCRYPTPROXY -m string --hex-string "|05|weibo|03|com" --algo bm -j RETURN
iptables -t nat -A DNSCRYPTPROXY -m string --hex-string "|03|163|03|com" --algo bm -j RETURN
iptables -t nat -A DNSCRYPTPROXY -m string --hex-string "|07|tencent|03|com" --algo bm -j RETURN
iptables -t nat -A DNSCRYPTPROXY -m string --hex-string "|06|alipay|03|com" --algo bm -j RETURN
iptables -t nat -A DNSCRYPTPROXY -m string --hex-string "|06|alicdn|03|com" --algo bm -j RETURN

# redirected DNS packet to dnscrypt-proxy
iptables -t nat -A DNSCRYPTPROXY -p tcp --dport 53 -j DNAT --to-destination 127.0.0.1:5353
iptables -t nat -A DNSCRYPTPROXY -p udp --dport 53 -j DNAT --to-destination 127.0.0.1:5353

# redirected DNS packet to DNSCRYPTPROXY chain
iptables -t nat -A OUTPUT -p tcp --dport 53 -j DNSCRYPTPROXY
iptables -t nat -A OUTPUT -p udp --dport 53 -j DNSCRYPTPROXY
