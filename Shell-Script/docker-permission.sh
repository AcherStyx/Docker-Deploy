#!/bin/bash
sudo groupadd docker
sudo usermod -aG docker ${USER}
sudo systemctl restart docker