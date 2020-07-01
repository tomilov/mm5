pushd ~/topography_data
find countries_isolines_out/ -name '*.isolines' -execdir du -s {} '+' | sed -e 's/\.\///' -e 's/\.isolines$//' | sort -k2 -f | awk '{ size = $1 ; $1 = "" ; print $0 "\t" size }' | sed 's/^ //' >~/topography_data.tsv
popd

pushd ~/topography_data.reference
find countries_isolines_out/ -name '*.isolines' -execdir du -s {} '+' | sed -e 's/\.\///' -e 's/\.isolines$//' | sort -k2 -f | awk '{ size = $1 ; $1 = "" ; print $0 "\t" size }' | sed 's/^ //' >~/topography_data.reference.tsv
popd

jq -r '."countryParams"[] | "\(."key")\t\(."value"."profileName")"' ~/countries-to-generate.json | sort -k1 -f >~/topography_data_profiles.tsv
