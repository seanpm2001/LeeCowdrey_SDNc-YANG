#!/bin/bash
run() {
  local RETVAL=0
  for f in $(find -L ${1}/ -mindepth 1 -maxdepth 1 -type f -name "*.yang"); do
    BASE=$(basename ${f})
    MODEL="${BASE%%.yang}"
    OUTPUT="${MODEL%@*}"
    pyang -Wnone -p src/main/yang/dependencies -p src/main/yang -p src/main/yang/devices --format=tree ${f} -o ${2}/${OUTPUT}.tree
    TREESIZE=0
    if [ -f ${2}/${OUTPUT}.tree ]; then
      TREESIZE=$(stat -c%s ${2}/${OUTPUT}.tree)
      if [ ${TREESIZE} -gt 0 ]; then
        echo '```' >${2}/${OUTPUT}.md &&
          cat ${2}/${OUTPUT}.tree >>${2}/${OUTPUT}.md &&
          echo '```' >>${2}/${OUTPUT}.md &&
          YANG_DEP=$(pyang -Wnone -p src/main/yang/dependencies -p src/main/yang -p src/main/yang/devices --format=depend ${f} | cut -d":" -f2)
        echo -e "\n### YANG Dependencies\n" >>${2}/${OUTPUT}.md
        echo '```' >>${2}/${OUTPUT}.md
        [[ -n "${YANG_DEP}" ]] && echo "${YANG_DEP}" >>${2}/${OUTPUT}.md || echo "N/A" >>${2}/${OUTPUT}.md
        echo '```' >>${2}/${OUTPUT}.md
        rm -f ${2}/${OUTPUT}.tree &>/dev/null
      else
        rm -f ${2}/${OUTPUT}.tree &>/dev/null
      fi
    fi
  done
  return ${RETVAL}
}
DN=$(dirname $0)
pushd ${DN}/.. &>/dev/null
[[ ! -d src/doc/tree ]] && (mkdir -p src/doc/tree)
[[ ! -d src/doc/tree/devices ]] && (mkdir -p src/doc/tree/devices)
run "src/main/yang" "src/doc/tree" &&
  [[ -f src/main/yang/devices/*.yang ]] && run "src/main/yang/devices" "src/doc/tree/devices" &&
  pyang -Wnone -p src/main/src/dependencies -p src/main/yang -p src/main/yang/devices --format=tree src/main/yang/*.yang src/main/yang/devices/*.yang -o src/doc/tree/sdnc_global.tree &&
  echo '```' >src/doc/tree/sdnc_global.md &&
  cat src/doc/tree/sdnc_global.tree >>src/doc/tree/sdnc_global.md &&
  echo '```' >>src/doc/tree/sdnc_global.md &&
  rm -f src/doc/tree/sdnc_global.tree &>/dev/null
popd &>/dev/null
