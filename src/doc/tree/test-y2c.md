```
module: test-y2c

  augment /c:sdnc/cnf:xnf/cnf:nf/cnf:configs:
    +--rw config {c:sdnc,cnf:sdnc-xnf,cs:sdnc-sku}?
       +--rw raw?                                string
       +--ro cli-header
       +--rw hardware
       |  +--rw unit-name?        ct:name
       |  +--rw unit-version?     string
       |  +--rw unit-timestamp?   yang:date-and-time
       |  +--rw serial-number?    string
       +--rw hostname?                           inet:host
       +--rw list-wth-child-values
       |  +--rw acl* [sequence]
       |     +--rw sequence    uint16
       |     +--rw outer?      enumeration
       |     +--rw inner?      string
       +--rw types
       |  +--rw type1?    uint8
       |  +--rw type2?    decimal64
       |  +--rw type3?    boolean
       |  +--rw type4?    enumeration
       |  +--rw type5?    string
       |  +--rw type6?    identityref
       |  +--rw type7?    -> ../../hostname
       |  +--rw type8?    empty
       |  +--rw type9?    binary
       |  +--rw type10?   bits
       +--rw def-with-mixed-child-values
       |  +--rw mandatory-value?   uint8
       |  +--rw optional-value?    uint8
       +--rw block-within-list-begin-end-only
       |  +--rw bwlbeo* [name]
       |     +--rw name    string
       |     +--rw text?   string
       +--rw list-with-begin-end-child
       |  +--rw lwbec* [name]
       |     +--rw name     string
       |     +--rw child?   uint8
       +--rw simple-leaf
       |  +--rw simple-leaf-enable-modify-disable?   string
       |  +--rw simple-leaf-enable-disable-only?     string
       +--rw multi-optionals
       |  +--rw index?     uint8
       |  +--rw option1?   uint8
       |  +--rw option2?   uint8
       |  +--rw option3?   uint8
       +--rw things
       |  +--rw variant?   uint8
       |  +--rw level1
       |     +--rw things* [name]
       |        +--rw name       string
       |        +--rw comment?   string
       |        +--rw variant    -> ../../../variant
       |        +--rw level2
       |           +--rw things* [name]
       |              +--rw name       string
       |              +--rw comment?   string
       |              +--rw variant    -> ../../../variant
       |              +--rw level3
       |                 +--rw identity-of?   identityref
       +--rw clobs
       |  +--rw xml?   <anyxml>
       +--ro cli-footer
```

### YANG Dependencies

```
 sdnc sdnc-sku sdnc-xnf sdnc-groupings ietf-inet-types
```
