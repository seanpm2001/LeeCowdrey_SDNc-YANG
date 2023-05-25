#!/bin/bash
run() {
  local RETVAL=0
  for f in $(find -L ${1}/ -mindepth 1 -maxdepth 1 -type f -name "*.uml"); do
    BASE=$(basename ${f})
    MODEL="${BASE%%.uml}"
    OUTPUT="${MODEL%@*}"
    cat ${1}/${MODEL}.uml | java -DPLANTUML_LIMIT_SIZE=${LIMIT_SIZE} -Djava.awt.headless=true -Xmx${HEAP_SIZE} -jar build/plantuml.jar -tpng -q -pipe >${2}/${OUTPUT}.png &&
      cat ${1}/${MODEL}.uml | java -DPLANTUML_LIMIT_SIZE=${LIMIT_SIZE} -Djava.awt.headless=true -Xmx${HEAP_SIZE} -jar build/plantuml.jar -tsvg -q -pipe >${2}/${OUTPUT}.svg
    RETVAL=$?
  done
  return ${RETVAL}
}
DN=$(dirname $0)
pushd ${DN}/.. &>/dev/null
LIMIT_SIZE=258952
HEAP_SIZE=4096m
[[ ! -d src/doc/img ]] && (mkdir -p src/doc/img)
[[ ! -d src/doc/img/devices ]] && (mkdir -p src/doc/img/devices)
[[ ! -f build/plantuml.jar ]] && (exit 1)
run "src/doc/uml" "src/doc/img"
run "src/doc/uml/devices" "src/doc/img/devices"
popd &>/dev/null
