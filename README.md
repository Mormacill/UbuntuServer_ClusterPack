# UbuntuServer_ClusterPack

1. Master:      `docker swarm init`
2. Master:      `docker network create -d overlay --attachable ${my-attachable-overlay}`
3. Master:      `execute dependencies_MasterHost.sh`
4. Master:      `modprobe nfs && modprobe nfsd`
5. Master:      `docker run -itd -p 33:22/tcp -p 5900:5900/tcp --network=clusternetwork --ip=10.0.1.100 --add-host=str00:172.18.0.1  --add-host=node1:10.0.1.101 --add-host=node2:10.0.1.102 --add-host=node3:10.0.1.103 --privileged --hostname master --name UbuntuOFClusterMaster ubuntuxfceofmaster:20.04`
6. Nodes:       `execute dependencies_NodesHost.sh`
7. Nodes:       `docker swarm join ... `(link by swarm init)
8. Nodes:       `docker run -it -p 5900:5900/tcp --network=${my-attachable-overlay} --ip=... --add-host=hostname:ipaddress --privileged --hostname ${NODEHOSTNAME} --name ${containername}`



--network host --> https://docs.docker.com/network/overlay/ <br>
--hostname str00

Based on: https://www-users.cs.york.ac.uk/~mjf/pi_cluster/src/Building_a_simple_Beowulf_cluster.html
