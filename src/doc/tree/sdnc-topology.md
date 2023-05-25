```
module: sdnc-topology

  augment /c:sdnc:
    +--rw topology {c:sdnc}?
       +--rw link
          +--rw links* [link-id]
             +--rw link-id                   yang:uuid
             +---x undefine
             |  +---w input
             |     +---w cascade?   boolean
             +--rw topology-base-class       ct:topology-base-class-type
             +--rw leader-link-id?           -> /c:sdnc/ctop:topology/link/links/link-id
             +--rw topology-service-class    ct:topology-service-class-type
             +--rw source
             |  +--rw instance             -> /c:sdnc/cnf:xnf/nf/instance
             |  +--rw termination-point?   inet:uri
             +--rw destination
                +--rw instance             -> /c:sdnc/cnf:xnf/nf/instance
                +--rw termination-point?   inet:uri

  rpcs:
    +---x is-known
    |  +---w input
    |  |  +---w link-id?   -> /c:sdnc/ctop:topology/link/links/link-id
    |  +--ro output
    |     +--ro exists?   boolean
    +---x define-link
       +---w input
       |  +---w source
       |  |  +---w instance             -> /c:sdnc/cnf:xnf/nf/instance
       |  |  +---w termination-point?   inet:uri
       |  +---w destination
       |  |  +---w instance             -> /c:sdnc/cnf:xnf/nf/instance
       |  |  +---w termination-point?   inet:uri
       |  +---w topology-base-class?      ct:topology-base-class-type
       |  +---w leader-link-id?           -> /c:sdnc/ctop:topology/link/links/link-id
       |  +---w topology-service-class?   ct:topology-service-class-type
       +--ro output
          +--ro link-id?   yang:uuid
```

### YANG Dependencies

```
 sdnc sdnc-types sdnc-xnf ietf-yang-types ietf-inet-types
```
