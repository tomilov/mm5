#!/bin/bash -vex

OMIM_DIR=$HOME/omim

mkdir -p $HOME/topography_data
pushd $HOME/topography_data

#$OMIM_DIR/data/conf/isolines/countries-to-generate.json

mkdir -p tiles_isolines_out countries_isolines_out
nice ../omim-build-release/topography_generator_tool \
    -profiles_path $OMIM_DIR/data/conf/isolines/isolines-profiles.json \
    -countries_to_generate_path $HOME/countries-to-generate.json \
    -tiles_isolines_out_dir tiles_isolines_out/ \
    -countries_isolines_out_dir countries_isolines_out/ \
    -data_dir $OMIM_DIR/data/ \
    -srtm_path /opt/mapsme/srtm/2000.02.11/ \
    -threads $(( $( nproc ) + 1 )) \
    -whitelist_path $HOME/roads.csv

popd
