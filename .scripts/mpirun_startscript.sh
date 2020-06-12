#!/bin/bash
echo "Name des Hostfiles"
read HOSTFILE
echo ""
#echo "Anzahl der Prozesse"
#read NUMBEROFCORES
#echo ""
echo "Welcher Solver soll verwendet werden? (e.g simpleFoam, pimpleFoam...)"
read EXECUTABLE
echo ""

NUMBEROFCORES=$(grep -w "numberOfSubdomains" system/decomposeParDict | grep -o '[0-9]*')

touch log
tilix --geometry=125x30 --window-style=disable-csd-hide-toolbar -t 'log output of current simulation' -e 'watch -n 0.2 tail -n 30 log' & mpirun --hostfile $HOSTFILE --mca btl_tcp_if_include 10.0.1.0/24 -np $NUMBEROFCORES /opt/openfoam7/platforms/linux64GccDPInt32Opt/bin/$EXECUTABLE -parallel > log
