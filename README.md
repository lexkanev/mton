# mton
#Docker TONCOIN GPU miner (https://github.com/tontechio/pow-miner-gpu).

# Install
docker build -t mton https://github.com/lexkanev/mton.git#main

# Start
docker run -d --name tonminer --gpus all mton /opt/tonlib-cuda-cli -v 3 -C /opt/global.config.json -e 'pminer start GIVER_ADDRESS YOUR_TON_WALLET 0 32' -l /opt/pminer.log

# Logging
docker exec -i -t tonminer bash

tail -f /opt/pminer.log
