```
module: pon-cig-xg99s

  augment /c:sdnc/cnf:xnf/cnf:nf/cnf:configs:
    +--rw config {c:sdnc,cnf:sdnc-xnf}?
       +--rw raw?        string
       +--rw hostname?   inet:host
       +--rw hardware
          +--rw unit-name?        ct:name
          +--rw unit-version?     string
          +--rw unit-timestamp?   yang:date-and-time
          +--rw serial-number?    string
          +--rw vendor?           string
```

### YANG Dependencies

```
 sdnc sdnc-xnf sdnc-groupings sdnc-sku ietf-inet-types
```
