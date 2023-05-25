#!/bin/bash
DN=$(dirname $0)
BUILD=$(date +%s)
pushd ${DN}/.. &>/dev/null &&
    ${DN}/ystrict.sh && ( [[ $? -eq 0 ]] && echo "[ystrict]ok" || echo "[ystrict]|fail" ) &&  
    ${DN}/ylint.sh && ([[ $? -eq 0 ]] && echo "[ylint]ok" || echo "[ylint]|fail") &&
    ${DN}/ytree.sh && ([[ $? -eq 0 ]] && echo "[ytree]ok" || echo "[ytree]|fail") &&
    ${DN}/yuml.sh && ([[ $? -eq 0 ]] && echo "[yuml]ok" || echo "[yuml]|fail") &&
    ${DN}/yjstree.sh && ([[ $? -eq 0 ]] && echo "[yjstree]ok" || echo "[yjstree]|fail") &&
    ${DN}/yimg.sh && ([[ $? -eq 0 ]] && echo "[yimg]ok" || echo "[yimg]|fail") &&
    ${DN}/ymd.sh src/doc/README.mdpp README.md && ([[ $? -eq 0 ]] && echo "[ymd]ok" || echo "[ymd]|fail")
RETVAL=$?
popd &>/dev/null
exit ${RETVAL}
