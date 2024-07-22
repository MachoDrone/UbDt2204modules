date +"%a %d%b%g %H:%M:%S"
bash <(wget -qO- https://nosana.io/testgrid.sh)
date +"%a %d%b%g %H:%M:%S"
echo -------------------------------------------
echo 10 sec pause for ctrl-c option
echo -------------------------------------------
sleep 10
./startnode.sh
