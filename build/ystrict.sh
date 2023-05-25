#!/bin/bash
individual() {
  local RETVAL=0
  local BASE=$(basename ${1})
  pyang -p src/main/yang/dependencies -p src/main/yang -p src/main/yang/devices --strict ${1}
  RETVAL=$?
  echo -n "${BASE}: "
  if [ ${RETVAL} -gt 0 ]; then
    echo "fail"
  else
    echo "ok"
  fi
  return ${RETVAL}
}
single() {
  local RETVAL=0
  for f in $(find -L ${1}/ -mindepth 1 -maxdepth 1 -type f -name "*.yang"); do
    BASE=$(basename ${f})
    MODEL="${BASE%%.yang}"
    pyang -p src/main/yang/dependencies -p src/main/yang -p src/main/yang/devices --strict ${f}
    RETVAL=$?
    echo -n "${BASE}: "
    if [ ${RETVAL} -gt 0 ]; then
      echo "fail"
      exit ${RETVAL}
    else
      echo "ok"
    fi
  done
  return ${RETVAL}
}
all() {
  local RETVAL=0
  if [ ${RETVAL} ]; then
    pyang -p src/main/yang/dependencies -p src/main/yang -p src/main/yang/devices --strict src/main/yang/*.yang
    RETVAL=$?
    echo -n "*.yang: "
    [[ ${RETVAL} -gt 0 ]] && echo "fail" || echo "ok"
  fi
  return ${RETVAL}
}
DN=$(dirname $0)
pushd ${DN}/.. &>/dev/null
if [ $# -eq 0 ]; then
  single "src/main/yang" &&
    single "src/main/yang/devices" &&
    all
  RETVAL=$?
else
  [[ -f "${1}" ]] && (
    individual "${1}"
    RETVAL=$?
  ) || RETVAL=1
fi
popd &>/dev/null
exit ${RETVAL}
