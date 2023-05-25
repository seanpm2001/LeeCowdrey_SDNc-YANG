```
module: sdnc-snmp

  augment /c:sdnc:
    +--rw snmp {c:sdnc}?
       +--rw security-groups
       |  +--rw security-group* [identifier]
       |     +--rw identifier     yang:uuid
       |     +---x destroy
       |     +--rw version?       ct:snmp-version
       |     +--rw udp-port?      inet:port-number
       |     +--rw timeout?       uint16
       |     +--rw retry?         uint16
       |     +--ro access-type?   ct:snmp-access-type
       |     +--rw v1-v2c
       |     |  +--rw community?   ct:snmp-community-name
       |     +--rw v3
       |        +--rw username?                  ct:snmp-username
       |        +--rw encryption-protocol?       ct:snmp-authentication-encryption-protocol
       |        +--rw authentication-protocol?   ct:snmp-authentication-encryption-protocol
       |        +--rw authentication-password?   ct:snmp-authentication-password
       |        +--rw privacy-password?          ct:snmp-privacy-password
       |        +--rw snmp-transmission-type?    ct:snmp-transmission-type
       +--rw requests
          +--rw request-groups* [identifier]
             +--rw identifier    yang:uuid
             +---x undefine
             +--rw oids* [oid]
                +--rw oid          ct:snmp-object-identifier
                +---x remove
                +--ro oid-name?    ct:snmp-object-identifier-name
                +--rw frequency?   uint32
                +--rw retention?   uint32

  rpcs:
    +---x snmp-security-group-define {c:sdnc}?
    |  +---w input
    |  |  +---w version?       ct:snmp-version
    |  |  +---w udp-port?      inet:port-number
    |  |  +---w timeout?       uint16
    |  |  +---w retry?         uint16
    |  |  +---w access-type?   ct:snmp-access-type
    |  |  +---w v1-v2c
    |  |  |  +---w community?   ct:snmp-community-name
    |  |  +---w v3
    |  |     +---w username?                  ct:snmp-username
    |  |     +---w encryption-protocol?       ct:snmp-authentication-encryption-protocol
    |  |     +---w authentication-protocol?   ct:snmp-authentication-encryption-protocol
    |  |     +---w authentication-password?   ct:snmp-authentication-password
    |  |     +---w privacy-password?          ct:snmp-privacy-password
    |  |     +---w snmp-transmission-type?    ct:snmp-transmission-type
    |  +--ro output
    |     +--ro identifier    -> /c:sdnc/css:snmp/security-groups/security-group/identifier
    +---x snmp-request-define {c:sdnc}?
       +---w input
       |  +---w identifier?   -> /c:sdnc/css:snmp/requests/request-groups/identifier
       |  +---w oids* [oid]
       |  |  +---w oid    ct:snmp-object-identifier
       |  +---w frequency?    uint32
       |  +---w retention?    uint32
       +--ro output
          +--ro identifier    -> /c:sdnc/css:snmp/requests/request-groups/identifier

  notifications:
    +---n snmp-security-group-added {c:sdnc}?
    |  +--ro identifier    -> /c:sdnc/css:snmp/security-groups/security-group/identifier
    +---n snmp-security-group-modified {c:sdnc}?
    |  +--ro identifier    -> /c:sdnc/css:snmp/security-groups/security-group/identifier
    +---n snmp-security-group-deleted {c:sdnc}?
    |  +--ro identifier    -> /c:sdnc/css:snmp/security-groups/security-group/identifier
    +---n snmp-request-oid-added {c:sdnc}?
    |  +--ro identifier    -> /c:sdnc/css:snmp/requests/request-groups/identifier
    |  +--ro oids* [oid]
    |     +--ro oid    ct:snmp-object-identifier
    +---n snmp-request-oid-deleted {c:sdnc}?
       +--ro identifier    -> /c:sdnc/css:snmp/requests/request-groups/identifier
       +--ro oids* [oid]
          +--ro oid    ct:snmp-object-identifier
```

### YANG Dependencies

```
 sdnc sdnc-types ietf-yang-types ietf-inet-types
```
