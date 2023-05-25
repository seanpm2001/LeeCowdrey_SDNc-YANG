#!/bin/bash
individual() {
  local RETVAL=0
  local BASE=$(basename ${1})
  local YDIR=$(dirname ${1})
  local MODEL="${BASE%%.yang}"
  pyang -Wnone -p src/main/yang/dependencies -p src/main/yang -p src/main/yang/devices --format=yang ${1} -o ${YDIR}/${MODEL}.out && cat ${YDIR}/${MODEL}.out >${1}
  [[ -f ${YDIR}/${MODEL}.out ]] && rm -f ${YDIR}/${MODEL}.out &>/dev/null
  return ${RETVAL}
}
run() {
  local RETVAL=0
  for f in $(find -L ${1}/ -mindepth 1 -maxdepth 1 -type f -name "*.yang"); do
    BASE=$(basename ${f})
    MODEL="${BASE%%.yang}"
    pyang -Wnone -p src/main/yang/dependencies -p src/main/yang -p src/main/yang/devices --format=yang ${f} -o ${1}/${MODEL}.out && cat ${1}/${MODEL}.out >${f}
    [[ -f ${1}/${MODEL}.out ]] && rm -f ${1}/${MODEL}.out &>/dev/null
  done
  return ${RETVAL}
}
RETVAL=0
DN=$(dirname $0)
pushd ${DN}/.. &>/dev/null
if [ $# -eq 0 ]; then
  run "src/main/yang" &&
    run "src/main/yang/devices"
  RETVAL=$?
else
  [[ -f "${1}" ]] && (
    individual "${1}"
    RETVAL=$?
  ) || RETVAL=1
fi
popd &>/dev/null
exit ${RETVAL}
