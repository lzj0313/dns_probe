dnsearch 开放DNS探测项目
Requirement：

1.全国IP网段,格式如：1.0.1.0-1.0.3.255

 /cn_ip：实时更新最新全国IP网段

2.Usage of ./dnsearch_new:
  -finishPath string
        文件写入完毕后会移动到此目录下
  -h    【缩写】显示帮助菜单。默认: false
  -in int
        获取DNS服务器信息的并发数量 (default 100)
  -info string
        进一步获取DNS服务器信息, 输出文件名
  -of string
        输出文件名称
  -rate int
        每秒发包速度限制 (default 100000)
  -tf string
        不扫描全球IP，指定CIDR列表
  -v    显示版本
  
例如：nohup ./dnsearch_w -rate 20000 -info dns20231215.json -tf /root/lzj/cn_ip/ipv4.txt -of ip.txt >> a.log 2>&1 &

3.注意发包速率：根据日志发包情况动态调整
配置：2c4g-60Mbps-按流量付费
