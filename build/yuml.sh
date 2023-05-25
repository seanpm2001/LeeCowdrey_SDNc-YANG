#!/bin/bash
run() {
  local RETVAL=0
  for f in $(find -L ${1}/ -mindepth 1 -maxdepth 1 -type f -name "*.yang"); do
    BASE=$(basename ${f})
    MODEL="${BASE%%.yang}"
    OUTPUT="${MODEL%@*}"
    pyang -Wnone -p src/main/yang/dependencies -p src/main/yang -p src/main/yang/devices --format=uml --uml-max-enums=25 --uml-truncate=leafref --uml-footer="${UML_FOOTER}" ${UML_OPTS} ${f} -o ${2}/${OUTPUT}.uml
  done
  return ${RETVAL}
}
DN=$(dirname $0)
pushd ${DN}/.. &>/dev/null
UML_FOOTER="Cowdrey Consulting UK"
UML_OPTS=""
[[ ! -d src/doc/uml ]] && (mkdir -p src/doc/uml)
[[ ! -d src/doc/uml/devices ]] && (mkdir -p src/doc/uml/devices)
run "src/main/yang" "src/doc/uml" &&
  run "src/main/yang/devices" "src/doc/uml/devices" &&
  pyang -Wnone -p src/main/yang/dependencies -p src/main/yang -p src/main/yang/devices --format=uml --uml-max-enums=25 --uml-truncate=leafref --uml-footer="${UML_FOOTER}" src/main/yang/*.yang src/main/yang/devices/*.yang -o src/doc/uml/sdnc_global.uml
popd &>/dev/null
