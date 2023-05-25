```
module: netconf-generic

  augment /c:sdnc/cnf:xnf/cnf:nf/cnf:configs:
    +--rw config {c:sdnc,cnf:sdnc-xnf}?
       +--rw raw?        string
       +--rw hostname?   inet:host
```

### YANG Dependencies

```
 sdnc sdnc-xnf sdnc-sku ietf-inet-types
```
