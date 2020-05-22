# UbuntuServer_ClusterPack

1. Master:    `docker swarm init`
2. Master:    `docker network create -d overlay --attachable ${my-attachable-overlay}`
3. Master:    `docker run -it -p 33:22/tcp -p 5900:5900/tcp --network=${my-attachable-overlay} --hostname ${MASTERHOSTNAME} --name ${containername}`
4. Nodes:     `docker swarm join ... (link by swarm init)`
5. Nodes:     `docker run -it -p 5900:5900/tcp --network=${my-attachable-overlay} --hostname ${NODEHOSTNAME} --name ${containername}`



--network host --> https://docs.docker.com/network/overlay/ <br>
--hostname str00

Based on: https://www-users.cs.york.ac.uk/~mjf/pi_cluster/src/Building_a_simple_Beowulf_cluster.html
