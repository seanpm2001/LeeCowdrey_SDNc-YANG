#!/bin/bash
if [ -d ~/lighty-halo ] ; then
  pushd ~/lighty-halo &> /dev/null && \
  git pull && \
  git subtree pull --prefix submodules/halo git@github.com:cowdrey-net/sdnc-yang.git main --squash && \
  git push origin main && \
  popd &> /dev/null && \
  ( [[ $? -eq 0 ]] && echo "[yhpull]ok" || echo "[yhpull]|fail" )
fi
