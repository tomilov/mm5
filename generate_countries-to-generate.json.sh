C="$( jq -r ."countryParams"[]."key" omim/data/conf/isolines/countries-to-generate.json | sort )"
pushd omim/data/borders/
U="$( ls -1 *.poly | sed "s/\.poly//" | sort )"
popd
comm -23 <( echo "$U" ) <( echo "$C" ) | jq -R '{"countryParams": [{"key": inputs, "value": {"profileName": "small", "tileCoordsSubset": [], "tilesAreBanned": false}}]}' | jq -s '{"countryParams": (.[0]."countryParams" + .[1]."countryParams")}' omim/data/conf/isolines/countries-to-generate.json - >countries-to-generate.json
