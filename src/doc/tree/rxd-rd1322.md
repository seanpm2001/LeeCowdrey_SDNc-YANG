```
module: rxd-rd1322

  augment /c:sdnc/cnf:xnf/cnf:nf/cnf:configs:
    +--rw config {c:sdnc,cnf:sdnc-xnf,cs:sdnc-sku}?
       +--rw raw?          string
       +--ro cli-header
       +--rw hardware
       |  +--rw unit-name?          ct:name
       |  +--rw unit-version?       string
       |  +--rw unit-timestamp?     yang:date-and-time
       |  +--rw serial-number?      string
       |  +--rw operational-mode?   ct:rxd-operational-mode
       +--rw hostname?     inet:host
       +--rw shelfname?    string
       +--ro cli-footer
```

### YANG Dependencies

```
 sdnc sdnc-types sdnc-sku sdnc-xnf sdnc-groupings ietf-inet-types
```
