#!/bin/bash
echo "Name des Hostfiles"
read HOSTFILE
echo ""
echo "Anzahl der Prozesse"
read NUMBEROFCORES
echo ""
echo "Welcher Solver soll verwendet werden? (e.g simpleFoam, pimpleFoam...)"
read EXECUTABLE
echo ""
touch log
tilix -e 'watch -n 0.2 tail log' & mpirun --hostfile $HOSTFILE --mca btl_tcp_if_include 10.0.1.0/24 -np $NUMBEROFCORES /opt/openfoam7/platforms/linux64GccDPInt32Opt/bin/$EXECUTABLE -parallel > log 
