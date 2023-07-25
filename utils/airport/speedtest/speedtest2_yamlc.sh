# Clash
wget -O clash.gz https://github.com/Dreamacro/clash/releases/download/v1.11.8/clash-linux-amd64-v1.11.8.gz
gunzip clash.gz
wget -O lite-linux-amd64.gz https://github.com/xxf098/LiteSpeedTest/releases/download/v0.14.1/lite-linux-amd64-v0.14.1.gz
gzip -d lite-linux-amd64.gz
wget -O clash_config.yml https://c.jeam.cc/utils/speedtest/clash_config_eu.yml
wget -O proxychains.conf https://c.jeam.cc/utils/speedtest/proxychains.conf
wget -O lite_config.json https://c.jeam.cc/utils/airport/speedtest/lite_config_yaml_airport.json
#初始化 Clash
chmod +x ./clash && ./clash &
#安装并配置 proxychains
sudo apt-get install proxychains
sudo chmod 777 ../../../../../../etc/proxychains.conf
mv -f proxychains.conf ../../../../../../etc/proxychains.conf
#开始运行 Clash
sudo pkill -f clash
./clash -f clash_config.yml &
#运行 LiteSpeedTest
sleep 5
chmod +x ./lite-linux-amd64
sudo nohup proxychains ./lite-linux-amd64 --config ./lite_config.json --test https://c.jeam.cc/sub/airport_merge_yaml.yml > speedtest.log 2>&1 &
