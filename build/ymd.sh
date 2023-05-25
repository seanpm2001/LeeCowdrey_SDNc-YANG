#!/bin/bash
md_pp() {
  local RETVAL=0
  if [ -f "${1}" ]; then
    local MD_LINE=""
    if [ ${#LIST_OF_PARAMETERS[@]} -gt 0 ]; then
      while IFS= read -r MD_LINE; do
        local PARAMETER_FOUND=1
        for ((P = 0; P < ${#LIST_OF_PARAMETERS[@]}; ++P)); do
          if [[ ${MD_LINE} =~ "<<${LIST_OF_PARAMETERS[$P]}>>" ]]; then
            local MD_INC=${LIST_OF_PARAMETERS[$P]}
            PARAMETER_FOUND=0
            if [ -f ${MD_INC} ]; then
              cat ${MD_INC} >>${2}
            else
              echo '```none```' >>${2}
            fi
            break
          fi
        done
        [[ ${PARAMETER_FOUND} -eq 1 ]] && echo "${MD_LINE}" >>${2}
      done <${1}
    fi
  else
    RETVAL=1
  fi
  return ${REVTAL}
}

DN=$(dirname $0)
YMD_CLI="${0##*/}"
RETVAL=0
pushd ${DN}/.. &>/dev/null

declare -a LIST_OF_PARAMETERS
[[ -f "${2}" ]] && rm -f ${2} &>/dev/null
if [ -f "${1}" ]; then
  readarray -t LIST_OF_PARAMETERS < <(grep -oP '(?<=<<).*?(?=>>)' ${1})
  if [ ${#LIST_OF_PARAMETERS[@]} -gt 0 ]; then
    md_pp "${1}" "${2}"
    RETVAL=$?
  else
    RETVAL=0
  fi
else
  RETVAL=1
fi
unset LIST_OF_PARAMETERS

popd &>/dev/null
exit ${RETVAL}
