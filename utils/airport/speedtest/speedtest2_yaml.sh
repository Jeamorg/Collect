#准备好所需文件
wget -O lite-linux-amd64.gz https://github.com/xxf098/LiteSpeedTest/releases/download/v0.15.0/lite-linux-amd64-v0.15.0.gz
gzip -d lite-linux-amd64.gz
wget -O lite_config.json https://raw.githubusercontent.com/Jeamorg/Collect/master/utils/airport/speedtest/lite_config_yaml_airport.json
#运行 LiteSpeedTest
chmod +x ./lite-linux-amd64
sudo nohup ./lite-linux-amd64 --config ./lite_config.json --test https://raw.githubusercontent.com/Jeamorg/Collect/master/sub/airport_merge_yaml.yml > speedtest.log 2>&1 &
