#!/bin/bash -vex

export LC_ALL=en_US.UTF-8 

pushd ~/omim/tools/python/
time nice ~/.venv/bin/python -m maps_generator --config=$HOME/map_generator.ini --order=maps_generator/var/etc/file_generation_order.txt --production --skip="Routing, RoutingTransit, Coastline" # --countries="Tanzania*" #--continue
popd
