#!/bin/bash
DN=$(dirname $0)
pushd ${DN}/.. &>/dev/null
[[ ! -d src/doc/jstree ]] && (mkdir -p src/doc/jstree)
pyang -Wnone -p src/main/yang/dependencies -p src/main/yang -p src/main/yang/devices --format=jstree src/main/yang/*.yang src/main/yang/devices/*.yang -o src/doc/jstree/sdnc_global.html
popd &>/dev/null
