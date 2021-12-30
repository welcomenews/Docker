## DKR 40: Swarm. Построение постоянного хранилища для кластера на базе GlusterFS


install
```
sudo apt-get update
sudo apt-get install -y software-properties-common
sudo add-apt-repository ppa:gluster/glusterfs-3.10;
sudo apt-get update -y
sudo apt-get install -y glusterfs-server attr
sudo systemctl enable glusterd.service

# Verify the gluster service is enabled
sudo systemctl is-enabled glusterd.service

sudo systemctl start glusterd.service
sudo systemctl status glusterd.service

sudo gluster peer probe node3; sudo gluster peer probe node2; sudo gluster peer probe node1

sudo gluster pool list
```
