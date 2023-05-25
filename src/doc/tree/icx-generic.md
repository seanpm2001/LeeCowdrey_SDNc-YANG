```
module: icx-generic

  augment /c:sdnc/cnf:xnf/cnf:nf/cnf:configs:
    +--rw config {c:sdnc,cnf:sdnc-xnf,cs:sdnc-sku}?
       +--rw raw?          string
       +--ro cli-header
       +--rw hardware
       |  +--rw unit-name?                   ct:name
       |  +--rw unit-version?                string
       |  +--rw unit-timestamp?              yang:date-and-time
       |  +--rw serial-number?               string
       |  +--rw operational-mode?            ct:l2-operational-mode
       |  +--rw stackable-capable?           boolean
       |  +--rw legacy-license-identifier?   string
       +--rw hostname?     inet:host
       +--rw interfaces
       |  +--rw ethernet
       |  |  +--rw ports* [port-id]
       |  |     +--rw port-id    string
       |  +--rw group-ve
       |  +--rw loopback
       |  +--rw management
       |  +--rw tunnel
       |  +--rw ve
       |     +--rw virtual-ethernet* [vif]
       |        +--rw vif    -> ../../../../vlan/vlans/vlan-id
       +--rw ip
       |  +--rw mtu
       |     +--rw mtu?   uint16
       +--rw vlan
       |  +--rw vlans* [vlan-id]
       |     +--rw outer?                ct:ip-vlan-id
       |     +--rw vlan-id               -> /c:sdnc/cp:pools/ip/vlan/outer[cp:identifier=current()/../icx:outer]/cp:inner/identifier
       |     +--rw vlan-name?            string
       |     +--rw vlan-type?            -> /c:sdnc/cp:pools/ip/vlan/outer[cp:identifier=current()/../icx:outer]/cp:inner[cp:identifier=current()/../icx:vlan-id]/cp:type
       |     +--rw by-type?              enumeration
       |     +--rw protocol-name
       |     |  +--rw (protocol)?
       |     |     +--:(appletalk)
       |     |     |  +--rw atalk-name?          string
       |     |     +--:(decnet)
       |     |     |  +--rw decnet-proto-name?   string
       |     |     +--:(ip)
       |     |     |  +--rw ipv4-proto-name?     string
       |     |     |  +--rw ipv6-proto-name?     string
       |     |     +--:(ipx)
       |     |     |  +--rw ipx-name?            string
       |     |     +--:(netbios)
       |     |     |  +--rw netbios-name?        string
       |     |     +--:(other)
       |     |        +--rw other-name?          string
       |     +--rw ethernet
       |     |  +--rw loopbacks* [port-id]
       |     |     +--rw port-id    -> ../../../../../interfaces/ethernet/ports/port-id
       |     +--rw ip-subnet
       |     |  +--rw ip-address?   union
       |     +--rw ipx-network
       |     |  +--rw network?   string
       |     +--rw loop-detection
       |     |  +--rw enabled?   empty
       |     +--rw metro
       |     |  +--rw ring* [ring-id]
       |     |  |  +--rw ring-id               uint16
       |     |  |  +--rw enabled?              empty
       |     |  |  +--rw hello-time?           uint16
       |     |  |  +--rw master?               empty
       |     |  |  +--rw ring-label?           string
       |     |  |  +--rw preforwarding-time?   uint16
       |     |  |  +--rw ring-interface* [port-id]
       |     |  |     +--rw port-id    -> ../../../../../../interfaces/ethernet/ports/port-id
       |     |  +--rw rings* [ring-id]
       |     |     +--rw ring-id    uint16
       |     +--rw monitoring
       |     |  +--rw monitors* [port-id]
       |     |     +--rw port-id    -> ../../../../../interfaces/ethernet/ports/port-id
       |     +--rw multicast
       |     |  +--rw active?                empty
       |     |  +--rw disable-igmp-snoop?    empty
       |     |  +--rw disable-pimsm-snoop?   empty
       |     |  +--rw fast-convergence?      empty
       |     |  +--rw fast-leave-v2?         empty
       |     |  +--rw passive?               empty
       |     |  +--rw pimsm-snooping
       |     |  |  +--rw prune-wait?   uint16
       |     |  +--rw port-version?          enumeration
       |     |  +--rw proxy-off?             empty
       |     |  +--rw router-port
       |     |  |  +--rw port-id?   -> ../../../../../interfaces/ethernet/ports/port-id
       |     |  +--rw static-group
       |     |     +--rw groups* [ip-address]
       |     |        +--rw ip-address    inet:ipv4-address-no-zone
       |     |        +--rw count
       |     |        |  +--rw contiguous-groups?   uint16
       |     |        |  +--rw drop?                empty
       |     |        |  +--rw ethernet
       |     |        |     +--rw ports* [port-id]
       |     |        |        +--rw port-id    empty
       |     |        +--rw ethernet
       |     |           +--rw ports* [port-id]
       |     |              +--rw port-id    -> ../../../../../../../../interfaces/ethernet/ports/port-id
       |     +--rw multicast6
       |     |  +--rw active?                empty
       |     |  +--rw disable-mld-snoop?     empty
       |     |  +--rw disable-pimsm-snoop?   empty
       |     |  +--rw fast-convergence?      empty
       |     |  +--rw fast-leave-v1?         empty
       |     |  +--rw passive?               empty
       |     |  +--rw pimsm-snooping
       |     |  |  +--rw prune-wait?   uint16
       |     |  +--rw port-version?          enumeration
       |     |  +--rw proxy-off?             empty
       |     |  +--rw router-port
       |     |  |  +--rw port-id?   -> ../../../../../interfaces/ethernet/ports/port-id
       |     |  +--rw static-group
       |     |  |  +--rw groups* [ip-address]
       |     |  |     +--rw ip-address    inet:ipv6-address-no-zone
       |     |  |     +--rw count
       |     |  |     |  +--rw contiguous-groups?   uint16
       |     |  |     |  +--rw drop?                empty
       |     |  |     |  +--rw ethernet
       |     |  |     |     +--rw ports* [port-id]
       |     |  |     |        +--rw port-id    empty
       |     |  |     +--rw ethernet
       |     |  |        +--rw ports* [port-id]
       |     |  |           +--rw port-id    -> ../../../../../../../../interfaces/ethernet/ports/port-id
       |     |  +--rw tracking?              empty
       |     |  +--rw version?               enumeration
       |     +--rw pvlan
       |     +--rw router-interface
       |     |  +--rw vif?   -> ../../../../interfaces/ve/virtual-ethernet/vif
       |     +--rw spanning-tree
       |     +--rw static-mac-address
       |     +--rw tagged
       |     |  +--rw ethernet
       |     |     +--rw ports* [port-id]
       |     |        +--rw port-id    -> ../../../../../../interfaces/ethernet/ports/port-id
       |     +--rw untagged
       |     |  +--rw ethernet
       |     |     +--rw ports* [port-id]
       |     |        +--rw port-id    -> ../../../../../../interfaces/ethernet/ports/port-id
       |     +--rw uplink-switch
       |     |  +--rw ethernet
       |     |     +--rw ports* [port-id]
       |     |        +--rw port-id    -> ../../../../../../interfaces/ethernet/ports/port-id
       |     +--rw vsrp
       |     |  +--rw (auth-type)?
       |     |  |  +--:(simple)
       |     |  |  |  +--rw simple-text-auth?   string
       |     |  |  +--:(none)
       |     |  |     +--rw no-auth?            empty
       |     |  +--rw vrid?                     -> /c:sdnc/cp:pools/ip/virtual-router/virtual-routers/identifier
       |     +--rw vsrp-aware
       |     |  +--rw vrid?   -> /c:sdnc/cp:pools/ip/virtual-router/virtual-routers/identifier
       |     +--rw webauth
       |        +--rw enabled?   empty
       +--ro cli-footer
```

### YANG Dependencies

```
 sdnc sdnc-types sdnc-sku sdnc-pools sdnc-xnf sdnc-groupings ietf-inet-types
```
