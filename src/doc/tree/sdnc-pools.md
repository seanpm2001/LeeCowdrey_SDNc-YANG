```
module: sdnc-pools

  augment /c:sdnc:
    +--rw pools {c:sdnc}?
       +--rw pon
       |  +--rw alloc-id
       |  |  +--rw allocs* [instance]
       |  |     +--rw instance    -> /c:sdnc/cnf:xnf/nf/instance
       |  |     +---x destroy
       |  |     +--rw ports* [port]
       |  |        +--rw port         uint8
       |  |        +--rw port-mode    ct:pon-port-mode
       |  |        +---x clear
       |  |        +--rw ids* [identifier]
       |  |        |  +--rw identifier    uint16
       |  |        |  +---x release
       |  |        +--ro tracking
       |  |           +--ro last-issued-identifier?     uint16
       |  |           +--ro last-released-identifier?   uint16
       |  +--rw gemport-id
       |  |  +--rw gemports* [instance]
       |  |     +--rw instance    -> /c:sdnc/cnf:xnf/nf/instance
       |  |     +---x destroy
       |  |     +--rw ports* [port]
       |  |        +--rw port                   uint8
       |  |        +--rw port-mode              ct:pon-port-mode
       |  |        +--rw gemport-type           ct:ip-gemport-type
       |  |        +--rw allocation-strategy    ct:ip-allocation-strategy
       |  |        +---x clear
       |  |        +--rw ids* [identifier]
       |  |        |  +--rw identifier    uint32
       |  |        |  +--rw block-size?   uint8
       |  |        |  +---x release
       |  |        +--ro tracking
       |  |           +--ro p2p-last-issued-identifier?      uint32
       |  |           +--ro p2p-last-issued-block-size?      uint8
       |  |           +--ro p2p-last-released-identifier?    uint32
       |  |           +--ro p2mp-last-issued-identifier?     uint32
       |  |           +--ro p2mp-last-issued-block-size?     uint8
       |  |           +--ro p2mp-last-released-identifier?   uint32
       |  +--rw onu-id
       |  |  +--rw onus* [instance]
       |  |     +--rw instance    -> /c:sdnc/cnf:xnf/nf/instance
       |  |     +---x destroy
       |  |     +--rw ports* [port]
       |  |        +--rw port         uint8
       |  |        +--rw port-mode    ct:pon-port-mode
       |  |        +---x clear
       |  |        +--rw ids* [identifier]
       |  |        |  +--rw identifier    uint32
       |  |        |  +---x release
       |  |        +--ro tracking
       |  |           +--ro last-issued-identifier?     uint32
       |  |           +--ro last-released-identifier?   uint32
       |  +--rw vlan
       |  |  +--rw outer* [instance]
       |  |     +--rw instance    -> /c:sdnc/cnf:xnf/nf/instance
       |  |     +---x destroy
       |  |     +--rw vlans* [identifier]
       |  |     |  +--rw identifier     ct:ip-vlan-id
       |  |     |  +--rw vlan-group     ct:ip-vlan-group
       |  |     |  +--rw taggingmode    ct:ip-vlan-tagmode
       |  |     |  +---x release
       |  |     |  +--rw inner* [identifier]
       |  |     |     +--rw identifier    ct:ip-vlan-id
       |  |     |     +---x clear
       |  |     +--ro tracking
       |  |        +--ro allocated-c-vids* [identifier]
       |  |           +--ro identifier    ct:ip-vlan-id
       |  +--rw collection
       |  |  +--rw traffic-descriptors* [name]
       |  |  |  +--rw name            ct:name
       |  |  |  +--rw profile-name?   -> ../../../profile/traffic-descriptors/name
       |  |  +--rw l2-dhcp4-relays* [name]
       |  |  |  +--rw name            ct:name
       |  |  |  +--rw profile-name?   -> ../../../profile/l2-dhcp4-relays/name
       |  |  +--rw qos-policies* [name]
       |  |  |  +--rw name           ct:name
       |  |  |  +--rw policy-name?   -> ../../../policy/qos/name
       |  |  +--rw qos-classifiers* [name]
       |  |  |  +--rw name               ct:name
       |  |  |  +--rw classifier-name?   -> ../../../classifier/qos/name
       |  |  +--rw remote-endpoints* [name]
       |  |  |  +--rw name             ct:name
       |  |  |  +--rw endpoint-name?   -> ../../../endpoint/remote-endpoints/name
       |  |  +--rw syslog-endpoints* [name]
       |  |     +--rw name             ct:name
       |  |     +--rw endpoint-name?   -> /c:sdnc/cp:pools/ip/syslog-endpoint/syslog-endpoints/name
       |  +--rw endpoint
       |  |  +--rw remote-endpoints* [name]
       |  |     +--rw name                  ct:name
       |  |     +--rw nf-client
       |  |     |  +--rw enabled?       boolean
       |  |     |  +--rw nf-initiate!
       |  |     |     +--rw remote-endpoints
       |  |     |        +--rw remote-endpoint* [name]
       |  |     |           +--rw name                 string
       |  |     |           +--rw type?                ct:pon-nf-type
       |  |     |           +--rw (client-transport)
       |  |     |           |  +--:(grpc)
       |  |     |           |  |  +--rw grpc
       |  |     |           |  |     +--rw local-endpoint-name?      string
       |  |     |           |  |     +--rw grpc-client-parameters
       |  |     |           |  |        +--rw channel
       |  |     |           |  |        |  +--rw ping-interval?   uint32
       |  |     |           |  |        +--rw connection-backoff
       |  |     |           |  |           +--rw initial-backoff?       uint16
       |  |     |           |  |           +--rw min-connect-timeout?   uint16
       |  |     |           |  |           +--rw multiplier?            decimal64
       |  |     |           |  |           +--rw jitter?                decimal64
       |  |     |           |  |           +--rw max-backoff?           uint16
       |  |     |           |  +--:(kafka-agent)
       |  |     |           |     +--rw kafka-agent
       |  |     |           |        +--rw kafka-agent-parameters
       |  |     |           |           +--rw client-id?                string
       |  |     |           |           +--rw publication-parameters
       |  |     |           |           |  +--rw topic* [name]
       |  |     |           |           |     +--rw name         string
       |  |     |           |           |     +--rw purpose?     string
       |  |     |           |           |     +--rw partition?   string
       |  |     |           |           +--rw consumption-parameters
       |  |     |           |              +--rw group-id?   string
       |  |     |           |              +--rw topic* [name]
       |  |     |           |                 +--rw name         string
       |  |     |           |                 +--rw purpose?     string
       |  |     |           |                 +--rw partition?   string
       |  |     |           +--rw access-point* [name]
       |  |     |              +--rw name                 string
       |  |     |              +--rw (message-transport)
       |  |     |                 +--:(grpc)
       |  |     |                 |  +--rw grpc
       |  |     |                 |     +--rw grpc-transport-parameters
       |  |     |                 |        +--rw remote-address    inet:host
       |  |     |                 |        +--rw remote-port?      inet:port-number
       |  |     |                 |        +--rw local-address?    inet:ip-address
       |  |     |                 |        +--rw local-port?       inet:port-number
       |  |     |                 |        +--rw keepalives
       |  |     |                 |           +--rw idle-time         uint16
       |  |     |                 |           +--rw max-probes        uint16
       |  |     |                 |           +--rw probe-interval    uint16
       |  |     |                 +--:(kafka-agent)
       |  |     |                    +--rw kafka-agent
       |  |     |                       +--rw kafka-agent-transport-parameters
       |  |     |                          +--rw remote-address    inet:host
       |  |     |                          +--rw remote-port?      inet:port-number
       |  |     |                          +--rw local-address?    inet:ip-address
       |  |     |                          +--rw local-port?       inet:port-number
       |  |     +--rw nf-server
       |  |     |  +--rw enabled?   boolean
       |  |     |  +--rw listen!
       |  |     |     +--rw idle-timeout?      uint16
       |  |     |     +--rw listen-endpoint* [name]
       |  |     |        +--rw name                string
       |  |     |        +--rw (transport)
       |  |     |        |  +--:(grpc)
       |  |     |        |     +--rw grpc
       |  |     |        |        +--rw grpc-server-parameters
       |  |     |        |           +--rw local-endpoint-name?   string
       |  |     |        |           +--rw remote-address?        inet:host
       |  |     |        |           +--rw remote-port?           inet:port-number
       |  |     |        |           +--rw local-address          inet:ip-address
       |  |     |        |           +--rw local-port?            inet:port-number
       |  |     |        +--rw remote-endpoints
       |  |     |           +--rw remote-endpoint* [name]
       |  |     |              +--rw name    string
       |  |     +--rw nf-endpoint-filter
       |  |        +--rw rule* [name]
       |  |           +--rw name                  ct:string-ascii64
       |  |           +--rw priority              uint16
       |  |           +--rw flexible-match
       |  |           |  +--rw (onu-criterion)?
       |  |           |     +--:(any-onu)
       |  |           |     |  +--rw any-onu?      empty
       |  |           |     +--:(onu-vendor)
       |  |           |        +--rw onu-vendor?   ct:onu-vendor-id
       |  |           +--rw resulting-endpoint?   string
       |  +--rw policy
       |  |  +--rw qos* [name]
       |  |     +--rw name           ct:name
       |  |     +--rw description?   ct:string-ascii64-or-empty
       |  |     +--rw classifiers* [name]
       |  |        +--rw name    -> ../../../../classifier/qos/name
       |  +--rw profile
       |  |  +--rw traffic-descriptors* [name]
       |  |  |  +--rw name                                   ct:name
       |  |  |  +--rw fixed-bandwidth?                       uint64
       |  |  |  +--rw assured-bandwidth?                     uint64
       |  |  |  +--rw maximum-bandwidth                      uint64
       |  |  |  +--rw priority?                              uint8
       |  |  |  +--rw weight?                                uint8
       |  |  |  +--rw additional-bw-eligibility-indicator?   enumeration
       |  |  +--rw l2-dhcp4-relays* [name]
       |  |     +--rw name               ct:name
       |  |     +--rw max-packet-size?   uint16
       |  |     +--rw option82-format
       |  |        +--rw suboptions*                  enumeration
       |  |        +--rw default-circuit-id-syntax?   ct:string-ascii63-or-empty
       |  |        +--rw default-remote-id-syntax?    ct:string-ascii63-or-empty
       |  |        +--rw access-loop-suboptions?      ct:broadband-line-characteristics
       |  |        +--rw start-numbering-from-zero?   boolean
       |  |        +--rw use-leading-zeroes?          boolean
       |  +--rw classifier
       |     +--rw qos* [name]
       |        +--rw name                           ct:name
       |        +--rw description?                   ct:string-ascii64-or-empty
       |        x--rw filter-operation?              enumeration
       |        +--rw (filter-method)?
       |        |  x--:(inline)
       |        |  |  x--rw match-criteria
       |        |  |     +--rw vlan-tag-match-type?   enumeration
       |        |  |     x--rw untagged
       |        |  |     |  x--rw untagged?   empty
       |        |  |     x--rw vlan-tagged
       |        |  |     |  x--rw tag* [index]
       |        |  |     |     x--rw index           uint8
       |        |  |     |     x--rw in-pbit-list?   string
       |        |  |     |     x--rw in-dei?         uint8
       |        |  |     +--rw dscp-range
       |        |  |     |  x--rw dscp-range?   union
       |        |  |     x--rw protocols
       |        |  |        +--rw protocol?       enumeration
       |        |  |        +--rw any-protocol
       |        |  |        |  x--rw any-protocol?   empty
       |        |  |        x--rw one-protocol
       |        |  |           x--rw protocol*   enumeration
       |        |  +--:(all-packets)
       |        |     +--rw all-packets?             empty
       |        +--rw classifier-action-entry-cfg* [action-type]
       |           +--rw action-type                       enumeration
       |           +--rw (action-cfg-params)?
       |              +--:(pbit-marking)
       |              |  +--rw pbit-marking-cfg
       |              |     +--rw pbit-marking-list* [index]
       |              |        +--rw index         uint8
       |              |        +--rw pbit-value?   uint8
       |              +--:(dei-marking)
       |              |  +--rw dei-marking-cfg
       |              |     +--rw pbit-marking-list* [index]
       |              |        +--rw index         uint8
       |              |        +--rw pbit-value?   uint8
       |              +--:(dscp-marking)
       |              |  +--rw dscp-marking-cfg
       |              |     +--rw dscp?   uint8
       |              +--:(scheduling-traffic-class)
       |              |  +--rw scheduling-traffic-class?   uint32
       |              +--:(permit)
       |                 +--rw permit?                     empty
       +--rw ip
          +--rw syslog-endpoint
          |  +--rw syslog-endpoints* [name]
          |     +--rw name         string
          |     +--rw (transport)
          |        +--:(tcp)
          |        |  +--rw tcp
          |        |     +--rw address?   inet:host
          |        |     +--rw port?      inet:port-number
          |        +--:(udp)
          |           +--rw udp
          |              +--rw address?   inet:host
          |              +--rw port?      inet:port-number
          +--rw address
          |  +--rw ipv4
          |  |  +--rw blocks* [block usage]
          |  |  |  +---x deallocate
          |  |  |  +---x request
          |  |  |  |  +---w input
          |  |  |  |  |  +---w instance    -> /c:sdnc/cnf:xnf/nf/instance
          |  |  |  |  +--ro output
          |  |  |  |     +--ro address    -> /c:sdnc/cp:pools/ip/address/ipv4/addresses/address
          |  |  |  +--rw block                 inet:ipv4-address
          |  |  |  +--rw subnet-mask           ct:ipv4-subnet-mask
          |  |  |  +--rw subnet-bits           ct:ipv4-subnet-bits
          |  |  |  +--rw wildcard-mask         ct:ipv4-subnet-mask
          |  |  |  +--rw usage                 ct:ipv4-network-usage
          |  |  |  +--rw network-address       inet:ipv4-address-no-zone
          |  |  |  +--rw first-host-address    inet:ipv4-address-no-zone
          |  |  |  +--rw last-host-address     inet:ipv4-address-no-zone
          |  |  |  +--rw broadcast-address     inet:ipv4-address-no-zone
          |  |  |  +--rw total-usable          uint64
          |  |  |  +--rw total-usable-hosts    uint64
          |  |  |  +--ro tracking
          |  |  |     +--ro last-issued-address?     inet:ipv4-address-no-zone
          |  |  |     +--ro last-released-address?   inet:ipv4-address-no-zone
          |  |  +--rw addresses* [address block]
          |  |     +---x release
          |  |     +--rw address     inet:ipv4-address
          |  |     +--rw instance    -> /c:sdnc/cnf:xnf/nf/instance
          |  |     +--rw block       -> /c:sdnc/cp:pools/ip/address/ipv4/blocks/block
          |  +--rw ipv6
          |     +--rw blocks* [block type]
          |     |  +---x deallocate
          |     |  +---x request
          |     |  |  +---w input
          |     |  |  |  +---w instance    -> /c:sdnc/cnf:xnf/nf/instance
          |     |  |  +--ro output
          |     |  |     +--ro address    -> /c:sdnc/cp:pools/ip/address/ipv6/addresses/address
          |     |  +--rw block                 inet:ipv6-address
          |     |  +--rw type                  ct:ipv6-address-type
          |     |  +--rw prefix                ct:ipv6-prefix
          |     |  +--rw usage                 ct:ipv6-network-usage
          |     |  +--rw network-address       inet:ipv6-address-no-zone
          |     |  +--rw first-host-address    inet:ipv6-address-no-zone
          |     |  +--rw last-host-address     inet:ipv6-address-no-zone
          |     |  +--rw total-usable          union
          |     |  +--rw total-usable-hosts    union
          |     |  +--ro tracking
          |     |     +--ro last-issued-address?     inet:ipv6-address-no-zone
          |     |     +--ro last-released-address?   inet:ipv6-address-no-zone
          |     +--rw addresses* [address block]
          |        +---x release
          |        +--rw address     inet:ipv6-address
          |        +--rw instance    -> /c:sdnc/cnf:xnf/nf/instance
          |        +--rw block       -> /c:sdnc/cp:pools/ip/address/ipv6/blocks/block
          +--rw vrf
          |  +--rw vrfs* [identifier]
          |  |  +---x release
          |  |  +--rw identifier    ct:ip-vrf
          |  |  +--rw type          ct:ip-vrf-type
          |  |  +--rw instance      -> /c:sdnc/cnf:xnf/nf/instance
          |  +--ro tracking
          |     +--ro last-issued-identifier?     ct:ip-vrf
          |     +--ro last-released-identifier?   ct:ip-vrf
          +--rw vlan
          |  +--rw outer* [identifier]
          |  |  +--rw identifier        ct:ip-vlan-id
          |  |  +--rw classification    ct:ip-vlan-classification
          |  |  +--rw type              ct:ip-vlan-type
          |  |  +--rw name?             string
          |  |  +--rw outer-instance    -> /c:sdnc/cnf:xnf/nf/instance
          |  |  +---x destroy
          |  |  +--rw inner* [identifier]
          |  |  |  +---x release
          |  |  |  +--rw identifier        ct:ip-vlan-id
          |  |  |  +--rw classification    ct:ip-vlan-classification
          |  |  |  +--rw type              ct:ip-vlan-type
          |  |  |  +--rw name?             string
          |  |  |  +--rw instance          -> /c:sdnc/cnf:xnf/nf/instance
          |  |  +--ro tracking
          |  |     +--ro last-issued-identifier?     ct:ip-vlan-id
          |  |     +--ro last-released-identifier?   ct:ip-vlan-id
          |  +--ro tracking
          |     +--ro last-issued-identifier?     ct:ip-vlan-id
          |     +--ro last-released-identifier?   ct:ip-vlan-id
          +--rw vxlan
          |  +--rw vxlans* [identifier]
          |  |  +---x release
          |  |  +--rw identifier    ct:ip-vxlan-vni
          |  |  +--rw scope         ct:ip-vxlan-scope
          |  |  +--rw name?         string
          |  |  +--rw instance      -> /c:sdnc/cnf:xnf/nf/instance
          |  +--ro tracking
          |     +--ro last-issued-identifier?     ct:ip-vxlan-vni
          |     +--ro last-released-identifier?   ct:ip-vxlan-vni
          +--rw virtual-router
          |  +--rw virtual-routers* [identifier]
          |  |  +---x release
          |  |  +--rw identifier    ct:ip-vrid
          |  |  +--rw name?         string
          |  |  +--rw instance      -> /c:sdnc/cnf:xnf/nf/instance
          |  +--ro tracking
          |     +--ro last-issued-identifier?     ct:ip-vrid
          |     +--ro last-released-identifier?   ct:ip-vrid
          +--rw route-target
          |  +--rw route-targets* [identifier]
          |     +---x release
          |     +--rw identifier    ct:ip-rt
          |     +--rw type          ct:ip-rt-type
          |     +--rw instance      -> /c:sdnc/cnf:xnf/nf/instance
          +--rw route-distinguisher
          |  +--rw route-distinguishers* [identifier]
          |     +---x release
          |     +--rw identifier    ct:ip-rd
          |     +--rw type          ct:ip-rd-type
          |     +--rw instance      -> /c:sdnc/cnf:xnf/nf/instance
          +--rw autonomous-system
             +--rw autonomous-systems* [identifier]
                +---x release
                +--rw identifier        ct:ip-asn
                +--rw classification    ct:ip-asn-type
                +--rw instance          -> /c:sdnc/cnf:xnf/nf/instance

  rpcs:
    +---x allocid-request {c:sdnc}?
    |  +---w input
    |  |  +---w instance      -> /c:sdnc/cnf:xnf/nf/instance
    |  |  +---w port          uint8
    |  |  +---w port-mode?    ct:pon-port-mode
    |  |  +---w identifier?   uint16
    |  +--ro output
    |     +--ro identifier?   -> /c:sdnc/cp:pools/pon/alloc-id/allocs/ports/ids/identifier
    +---x gemportid-request {c:sdnc}?
    |  +---w input
    |  |  +---w instance               -> /c:sdnc/cnf:xnf/nf/instance
    |  |  +---w port                   uint8
    |  |  +---w port-mode?             ct:pon-port-mode
    |  |  +---w block-size?            uint8
    |  |  +---w gemport-type           ct:ip-gemport-type
    |  |  +---w allocation-strategy    ct:ip-allocation-strategy
    |  |  +---w identifier?            uint32
    |  +--ro output
    |     +--ro ids* [identifier]
    |        +--ro identifier    -> /c:sdnc/cp:pools/pon/gemport-id/gemports/ports/ids/identifier
    +---x gemportid-release {c:sdnc}?
    |  +---w input
    |     +---w instance    -> /c:sdnc/cnf:xnf/nf/instance
    |     +---w port        uint8
    |     +---w ids* [identifier]
    |        +---w identifier    -> /c:sdnc/cp:pools/pon/gemport-id/gemports/ports/ids/identifier
    +---x onuid-request {c:sdnc}?
    |  +---w input
    |  |  +---w instance      -> /c:sdnc/cnf:xnf/nf/instance
    |  |  +---w port          uint8
    |  |  +---w port-mode?    ct:pon-port-mode
    |  |  +---w identifier?   uint32
    |  +--ro output
    |     +--ro identifier?   -> /c:sdnc/cp:pools/pon/onu-id/onus/ports/ids/identifier
    +---x ipv4-block-allocate {c:sdnc}?
    |  +---w input
    |  |  +---w starting-address     inet:ipv4-address-no-zone
    |  |  +---w (allocation)?
    |  |  |  +--:(mask)
    |  |  |  |  +---w subnet-mask?   ct:ipv4-subnet-mask
    |  |  |  +--:(bits)
    |  |  |     +---w subnet-bits?   ct:ipv4-subnet-bits
    |  |  +---w usage?               ct:ipv4-network-usage
    |  +--ro output
    |     +--ro address-block    inet:ipv4-address
    +---x ipv6-block-allocate {c:sdnc}?
    |  +---w input
    |  |  +---w type?               ct:ipv6-address-type
    |  |  +---w prefix?             ct:ipv6-prefix
    |  |  +---w usage?              ct:ipv6-network-usage
    |  |  +---w starting-address?   inet:ipv6-address-no-zone
    |  +--ro output
    |     +--ro address-block    -> /c:sdnc/cp:pools/ip/address/ipv6/blocks/block
    +---x vrf-request {c:sdnc}?
    |  +---w input
    |  |  +---w identifier?   ct:ip-vrf
    |  |  +---w type?         ct:ip-vrf-type
    |  |  +---w instance      -> /c:sdnc/cnf:xnf/nf/instance
    |  +--ro output
    |     +--ro identifier    -> /c:sdnc/cp:pools/ip/vrf/vrfs/identifier
    +---x vlan-outer-request {c:sdnc}?
    |  +---w input
    |  |  +---w identifier?       ct:ip-vlan-id
    |  |  +---w classification?   ct:ip-vlan-classification
    |  |  +---w name?             string
    |  |  +---w type?             ct:ip-vlan-type
    |  |  +---w instance          -> /c:sdnc/cnf:xnf/nf/instance
    |  +--ro output
    |     +--ro identifier    -> /c:sdnc/cp:pools/ip/vlan/outer/identifier
    +---x vlan-request {c:sdnc}?
    |  +---w input
    |  |  +---w outer-identifier?       ct:ip-vlan-id
    |  |  +---w outer-classification?   ct:ip-vlan-classification
    |  |  +---w outer-name?             string
    |  |  +---w outer-type?             ct:ip-vlan-type
    |  |  +---w inner-identifier?       ct:ip-vlan-id
    |  |  +---w inner-classification?   ct:ip-vlan-classification
    |  |  +---w inner-name?             string
    |  |  +---w inner-type?             ct:ip-vlan-type
    |  |  +---w instance                -> /c:sdnc/cnf:xnf/nf/instance
    |  +--ro output
    |     +--ro outer-identifier    -> /c:sdnc/cp:pools/ip/vlan/outer/identifier
    |     +--ro inner-identifier    -> /c:sdnc/cp:pools/ip/vlan/outer/inner/identifier
    +---x svlan-request {c:sdnc}?
    |  +---w input
    |     +---w outer-identifier    ct:ip-vlan-id
    |     +---w inner-identifier?   ct:ip-vlan-id
    |     +---w vlan-group          ct:ip-vlan-group
    |     +---w tagging-mode        ct:ip-vlan-tagmode
    |     +---w instance            -> /c:sdnc/cnf:xnf/nf/instance
    +---x vxlan-request {c:sdnc}?
    |  +---w input
    |  |  +---w identifier?   ct:ip-vxlan-vni
    |  |  +---w scope?        ct:ip-vxlan-scope
    |  |  +---w name?         string
    |  |  +---w instance      -> /c:sdnc/cnf:xnf/nf/instance
    |  +--ro output
    |     +--ro identifier    -> /c:sdnc/cp:pools/ip/vxlan/vxlans/identifier
    +---x virtual-router-request {c:sdnc}?
    |  +---w input
    |  |  +---w identifier?   ct:ip-vrid
    |  |  +---w name?         string
    |  |  +---w instance      -> /c:sdnc/cnf:xnf/nf/instance
    |  +--ro output
    |     +--ro identifier    -> /c:sdnc/cp:pools/ip/virtual-router/virtual-routers/identifier
    +---x route-target-request {c:sdnc}?
    |  +---w input
    |  |  +---w type                     ct:ip-rt-type
    |  |  +---w (variant)?
    |  |  |  +--:(existing)
    |  |  |  |  +---w identifier         ct:ip-rt
    |  |  |  +--:(type-0)
    |  |  |  |  +---w t0-asn             ct:ip-asn
    |  |  |  |  +---w t0-octet           string
    |  |  |  +--:(type-1)
    |  |  |  |  +---w t1-ipv4-address    inet:ipv4-address-no-zone
    |  |  |  |  +---w t1-octet           string
    |  |  |  +--:(type-2)
    |  |  |  |  +---w t2-asn             ct:ip-asn
    |  |  |  |  +---w t2-octet           string
    |  |  |  +--:(type-6)
    |  |  |  |  +---w mac-address        ct:mac-address
    |  |  |  +--:(generic)
    |  |  |  |  +---w generic-octet      string
    |  |  |  +--:(ipv6)
    |  |  |     +---w ipv6-address       inet:ipv6-address
    |  |  +---w instance                 -> /c:sdnc/cnf:xnf/nf/instance
    |  +--ro output
    |     +--ro identifier    -> /c:sdnc/cp:pools/ip/route-target/route-targets/identifier
    +---x route-distinguisher-request {c:sdnc}?
    |  +---w input
    |  |  +---w type                   ct:ip-rd-type
    |  |  +---w (variant)?
    |  |  |  +--:(existing)
    |  |  |  |  +---w identifier       ct:ip-rd
    |  |  |  +--:(type-0)
    |  |  |  |  +---w t0-asn           ct:ip-asn
    |  |  |  |  +---w t0-octet         string
    |  |  |  +--:(type-1)
    |  |  |  |  +---w ipv4-address     inet:ipv4-address-no-zone
    |  |  |  |  +---w t1-octet         string
    |  |  |  +--:(type-2)
    |  |  |  |  +---w t2-asn           ct:ip-asn
    |  |  |  |  +---w t2-octet         string
    |  |  |  +--:(type-6)
    |  |  |  |  +---w mac-address      ct:mac-address
    |  |  |  +--:(generic)
    |  |  |     +---w generic-octet    string
    |  |  +---w instance               -> /c:sdnc/cnf:xnf/nf/instance
    |  +--ro output
    |     +--ro identifier    -> /c:sdnc/cp:pools/ip/route-distinguisher/route-distinguishers/identifier
    +---x autonomous-system-request {c:sdnc}?
       +---w input
       |  +---w identifier?       ct:ip-asn
       |  +---w classification?   ct:ip-asn-type
       |  +---w instance          -> /c:sdnc/cnf:xnf/nf/instance
       +--ro output
          +--ro identifier    -> /c:sdnc/cp:pools/ip/autonomous-system/autonomous-systems/identifier
```

### YANG Dependencies

```
 sdnc sdnc-types sdnc-xnf ietf-inet-types
```
