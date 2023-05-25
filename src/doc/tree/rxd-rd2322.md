```
module: rxd-rd2322

  augment /c:sdnc/cnf:xnf/cnf:nf/cnf:configs:
    +--rw config {c:sdnc,cnf:sdnc-xnf,cs:sdnc-sku}?
       +--rw raw?                string
       +--ro cli-header
       +--rw hardware
       |  +--rw unit-name?          ct:name
       |  +--rw unit-version?       string
       |  +--rw unit-timestamp?     yang:date-and-time
       |  +--rw serial-number?      string
       |  +--rw operational-mode?   ct:rxd-operational-mode
       +--rw hostname?           inet:host
       +--rw shelfname?          string
       +--rw aging
       |  +--rw idle-mac?    uint32
       |  +--rw stale-mac?   uint32
       +--rw acl
       |  +--rw acl* [sequence]
       |     +--rw sequence          uint16
       |     +--rw classification?   enumeration
       |     +--rw definition?       string
       +--rw arp
       |  +--rw gratuitous-interval?   uint16
       |  +--rw timeout?               uint16
       |  +--rw state
       |     +--rw searching
       |     |  +--rw rate-limit?        uint16
       |     |  +--rw max-number?        uint16
       |     |  +--rw global-max-rate?   uint16
       |     |  +--rw cable
       |     |     +--rw unicast?     uint16
       |     |     +--rw broadcast?   empty
       |     +--rw not-present
       |        +--rw rate-limit?   uint16
       |        +--rw max-number?   uint16
       |        +--rw max-time?     uint8
       |        +--rw min-time?     uint8
       +--rw authentication
       |  +--rw level?   enumeration
       |  +--rw type?    enumeration
       +--rw authorization
       |  +--rw level?   enumeration
       |  +--rw type?    enumeration
       +--rw banner
       |  +--rw banner* [type]
       |  |  +--rw type       enumeration
       |  |  +--rw message?   string
       |  +--rw mode?     enumeration
       +--rw cable
       |  +--rw proxy-tftp?           empty
       |  +--rw cm-status?            enumeration
       |  +--rw helper-address?       inet:ip-address-no-zone
       |  +--rw dhcp-giaddr?          ct:ip-dhcp-priority
       |  +--rw adminision-control
       |  |  +--rw multicast
       |  |     +--rw enable?    empty
       |  |     +--rw allowed?   uint16
       |  +--rw enable-trap
       |  |  +--rw cmonoff-notification?          empty
       |  |  +--rw cminit-ranging-notification?   empty
       |  |  +--rw cminit-ip-notification?        empty
       |  |  +--rw cminit-reg-notification?       empty
       |  |  +--rw cmflap-notification?           empty
       |  +--rw fibre-node
       |  |  +--rw rpds* [identifier]
       |  |  |  +--rw identifier        ct:name
       |  |  |  +--rw rpd-identifier?   -> ../../../../interface/rpd/rpds/identifier
       |  |  |  +--rw ds-conn?          -> ../../../../interface/rpd/rpds/ds-conn/instance
       |  |  |  +--rw us-conn?          -> ../../../../interface/rpd/rpds/us-conn/instance
       |  |  +--rw nodes* [identifier]
       |  |     +--rw identifier    ct:name
       |  |     +--rw init?         empty
       |  |     +--rw downstream* [interface]
       |  |     |  +--rw interface    string
       |  |     +--rw upstream* [interface]
       |  |        +--rw interface    string
       |  +--rw flap-list
       |  |  +--rw power-adjust
       |  |  |  +--rw threshold?   uint16
       |  |  +--rw insertion-time?   uint8
       |  +--rw host
       |  |  +--rw authorization?   enumeration
       |  +--rw global
       |  |  +--rw annex?                       ct:docsis-annex-type
       |  |  +--rw additional-ds-sc-qams?       empty
       |  |  +--rw allow-cmsg-ambig-override?   empty
       |  |  +--rw cm-cfg-reg-req-time?         uint8
       |  |  +--rw cm-init-dsx-bonding?         empty
       |  |  +--rw cm-status-ack?               empty
       |  |  +--rw default-max-l2pdu-length?    empty
       |  |  +--rw delayed-cpe-learning-bpi?    empty
       |  |  +--rw ds-random-detect
       |  |  |  +--rw low?      uint16
       |  |  |  +--rw medium?   uint16
       |  |  |  +--rw high?     uint16
       |  |  +--rw ds-token-bucket?             empty
       |  |  +--rw ds-tos-overwrite?            enumeration
       |  |  +--rw dsa-rsp-sid-tlv-override?    empty
       |  |  +--rw freq-ds-min?                 uint8
       |  |  +--rw freq-ds-max?                 uint8
       |  |  +--rw freq-us-min?                 uint8
       |  |  +--rw freq-us-max?                 uint8
       |  |  +--rw load-interval?               uint8
       |  |  +--rw mac-move-allowed-on-dhcp?    empty
       |  |  +--rw max-qos-active-timeout?      uint8
       |  |  +--rw max-qos-admitted-timeout?    uint8
       |  |  +--rw max-traf-burst-docsis11?     uint32
       |  |  +--rw max-ucd-burst-len?           uint8
       |  |  +--rw modify-primary-DS-RCC?       empty
       |  |  +--rw mtcm-conditional-override?   empty
       |  |  +--rw peak-tr-rate-upstream?       empty
       |  |  +--rw percentAddtlDSBandwidth?     uint8
       |  |  +--rw ranging-timing-offset?       uint8
       |  |  +--rw recover-US-impaired-ack?     empty
       |  |  +--rw RtpsPiggybackEnable?         empty
       |  |  +--rw tcc-refid-in-first-only?     empty
       |  |  +--rw unicast-np-us-acquisition?   empty
       |  |  +--rw us-dmac-check-disable?       empty
       |  |  +--rw unicast-polling
       |  |     +--rw pri?           uint8
       |  |     +--rw slow-intvl?    uint8
       |  |     +--rw fast-intvl?    uint8
       |  |     +--rw fast-period?   uint8
       |  +--rw load-balance
       |  |  +--rw enabled?                       empty
       |  |  +--rw macdomain-check?               uint8
       |  |  +--rw downstream-start-threshold?    uint8
       |  |  +--rw upstream-start-threshold?      uint8
       |  |  +--rw utilization-modems-to-check?   uint8
       |  |  +--rw failed-list
       |  |  |  +--rw timeout?         uint8
       |  |  |  +--rw exclude-count?   uint8
       |  |  +--rw general-group-defaults
       |  |  |  +--rw enabled?          empty
       |  |  |  +--rw init-technique?   ct:enable-disable
       |  |  +--rw rcs-load-balance?              ct:enable-disable
       |  |  +--rw tcs-load-balance?              ct:enable-disable
       |  |  +--rw rcs-move-ds-primary?           ct:enable-disable
       |  |  +--rw rcs-move-us-primary?           ct:enable-disable
       |  |  +--rw tcs-move-us-primary?           ct:enable-disable
       |  |  +--rw dbc-move-us-primary?           ct:enable-disable
       |  |  +--rw dbc-move-ds-primary?           ct:enable-disable
       |  +--rw metering
       |  |  +--rw enabled?     empty
       |  |  +--rw collector
       |  |  |  +--rw collectors* [instance]
       |  |  |     +--rw instance    uint8
       |  |  |     +--rw host?       inet:host
       |  |  |     +--rw port?       inet:port-number
       |  |  +--rw query
       |  |     +--rw query-port?                inet:port-number
       |  |     +--rw streaming-port?            inet:port-number
       |  |     +--rw keep-alive-interval?       uint16
       |  |     +--rw connect-mode?              enumeration
       |  |     +--rw initiate-retry-interval?   uint8
       |  +--rw modem
       |  |  +--rw remote-query
       |  |  |  +--rw enabled?            empty
       |  |  |  +--rw source-interface?   string
       |  |  +--rw format
       |  |  |  +--rw formats* [type]
       |  |  |     +--rw type           enumeration
       |  |  |     +--rw identifier?    enumeration
       |  |  |     +--rw aggregation?   enumeration
       |  |  |     +--rw hfc-mac?       enumeration
       |  |  |     +--rw qos?           enumeration
       |  |  |     +--rw cpe?           enumeration
       |  |  |     +--rw cable-mac?     enumeration
       |  |  |     +--rw cable-ip?      enumeration
       |  |  +--rw energy-mgmt
       |  |  |  +--rw battery-mode1x?   enumeration
       |  |  +--rw vendor
       |  |     +--rw vendors* [vendor]
       |  |        +--rw oui-prefix?   ct:oui-prefix
       |  |        +--rw vendor        ct:name
       |  +--rw multicast
       |  |  +--rw group-qos
       |  |  |  +--rw group-qos* [instance]
       |  |  |     +--rw instance    uint16
       |  |  |     +--rw scn?        enumeration
       |  |  +--rw modulation-profile
       |  |  |  +--rw modulation-profiles* [instance]
       |  |  |     +--rw instance           uint8
       |  |  |     +--rw modulation?        ct:docsis-modulation-profile
       |  |  |     +--rw pre-len?           uint16
       |  |  |     +--rw diff?              boolean
       |  |  |     +--rw fec-tbytes?        uint16
       |  |  |     +--rw seed?              uint16
       |  |  |     +--rw burst-len?         uint16
       |  |  |     +--rw guard-time-size?   uint16
       |  |  |     +--rw last-cw?           boolean
       |  |  |     +--rw scramber?          boolean
       |  |  |     +--rw docsis-mode?       ct:docsis-modulation-type
       |  |  +--rw qos
       |  |     +--rw qos* [instance]
       |  |        +--rw instance         uint16
       |  |        +--rw group-qos?       -> ../../../group-qos/group-qos/instance
       |  |        +--rw priority?        uint8
       |  |        +--rw session-range
       |  |           +--rw range?    inet:ip-prefix
       |  |           +--rw source?   inet:ip-prefix
       |  +--rw privacy
       |  |  +--rw ca-bad-cert-drop?                      empty
       |  |  +--rw chk-manufacturer-ca-validity-period?   enumeration
       |  |  +--rw kek
       |  |  |  +--rw life-time?   uint32
       |  |  +--rw tek
       |  |  |  +--rw life-time?   uint32
       |  |  +--rw default-cert-trust?                    enumeration
       |  |  +--rw chk-validity-perio?                    enumeration
       |  |  +--rw mandatory?                             empty
       |  |  +--rw eae-policy?                            empty
       |  |  +--rw aes-128?                               empty
       |  +--rw proto-throttle
       |  |  +--rw proto-throttles* [protocol]
       |  |     +--rw protocol    enumeration
       |  |     +--rw rate?       uint16
       |  +--rw relay-agent-option
       |  |  +--rw circuit-id?         enumeration
       |  |  +--rw qos-sc-name?        ct:name
       |  |  +--rw fanout?             enumeration
       |  |  +--rw mso-defined-text?   ct:name
       |  +--rw spectrum-group
       |  |  +--rw enable-trap?   empty
       |  +--rw shared-secret
       |  |  +--rw primary?     string
       |  |  +--rw secondary?   string
       |  +--rw source-verify
       |  |  +--rw enabled?       empty
       |  |  +--rw lease-query
       |  |     +--rw message-type?   uint8
       |  |     +--rw version?        enumeration
       |  +--rw submgmt
       |     +--rw default
       |        +--rw max-cpe?        uint32
       |        +--rw v6-max-cpe?     uint32
       |        +--rw active?         empty
       |        +--rw learnable?      empty
       |        +--rw filter-group
       |           +--rw cm
       |           |  +--rw downstream?   empty
       |           |  +--rw upstream?     empty
       |           +--rw host
       |              +--rw downstream?   empty
       |              +--rw upstream?     empty
       +--rw privilege
       |  +--rw privileges* [privilege]
       |     +--rw privilege             uint8
       |     +--rw enabled?              empty
       |     +--rw encrypted-password?   string
       +--rw users
       |  +--rw user* [username]
       |     +--rw username           ct:name
       |     +--rw privilege?         uint8
       |     +--rw salted-password?   string
       +--rw console
       |  +--rw enabled?   empty
       +--rw counts
       |  +--rw collection
       |     +--rw rate?   uint16
       +--rw clock
       |  +--rw timezone?   ct:iana-timezones
       |  +--rw mode?       enumeration
       +--rw crypto
       |  +--rw privacy
       |     +--rw certificates* [name]
       |        +--rw name         ct:name
       |        +--rw type?        enumeration
       |        +--rw index?       uint16
       |        +--rw hex-block?   string
       +--rw dot1x
       |  +--rw enabled?   empty
       +--rw lacp
       |  +--rw system-priority?   uint16
       +--rw lldp
       |  +--rw enabled?    empty
       |  +--rw disabled?   empty
       +--rw license
       |  +--rw entitlement* [entitlement]
       |     +--rw entitlement    ct:docsis-license-entitlement
       |     +--rw key?           string
       |     +--rw quota?         uint64
       +--rw line
       |  +--rw console
       |  |  +--rw instances* [instance]
       |  |     +--rw instance           uint8
       |  |     +--rw session-timeout?   uint16
       |  |     +--rw idle-timeout?      uint16
       |  |     +--rw width?             uint8
       |  |     +--rw length?            uint16
       |  |     +--rw password?          string
       |  |     +--rw authentication
       |  |     |  +--rw authentications* [level]
       |  |     |     +--rw level    enumeration
       |  |     |     +--rw type?    enumeration
       |  |     +--rw authorization
       |  |        +--rw authorizations* [level]
       |  |           +--rw level    enumeration
       |  |           +--rw type?    enumeration
       |  +--rw vty
       |     +--rw instances* [instance]
       |        +--rw instance           uint8
       |        +--rw session-timeout?   uint8
       |        +--rw idle-timeout?      uint16
       |        +--rw width?             uint8
       |        +--rw length?            uint16
       |        +--rw password?          string
       |        +--rw authentication
       |        |  +--rw authentications* [level]
       |        |     +--rw level    enumeration
       |        |     +--rw type?    enumeration
       |        +--rw authorization
       |           +--rw authorizations* [level]
       |              +--rw level    enumeration
       |              +--rw type?    enumeration
       +--rw logging
       |  +--rw proprietary?   empty
       |  +--rw size
       |  |  +--rw history?              uint32
       |  |  +--rw local-volatile?       uint32
       |  |  +--rw local-non-volatile?   uint32
       |  +--rw throttle
       |  |  +--rw enabled?     empty
       |  |  +--rw threshold?   uint16
       |  |  +--rw interval?    uint16
       |  +--rw mapping
       |  |  +--rw map* [component]
       |  |  |  +--rw unit?        enumeration
       |  |  |  +--rw component    enumeration
       |  |  |  +--rw level?       uint8
       |  |  |  +--rw disabled?    enumeration
       |  |  +--rw priority* [component]
       |  |  |  +--rw component    enumeration
       |  |  |  +--rw facility?    uint8
       |  |  |  +--rw level?       uint8
       |  |  +--rw rpd* [component]
       |  |     +--rw component    enumeration
       |  |     +--rw level?       uint8
       |  |     +--rw disabled?    enumeration
       |  +--rw trap
       |  |  +--rw enabled?   empty
       |  |  +--rw traps* [type]
       |  |     +--rw type        enumeration
       |  |     +--rw disabled?   empty
       |  +--rw override
       |  |  +--rw events* [event]
       |  |     +--rw event      uint32
       |  |     +--rw enabled?   empty
       |  +--rw hosts* [host]
       |     +--rw host        inet:host
       |     +--rw facility?   enumeration
       +--rw ip
       |  +--rw unreachables?          empty
       |  +--rw domain-lookup
       |  |  +--rw enabled?            empty
       |  |  +--rw source-interface?   string
       |  +--rw fqdn-cache
       |  |  +--rw enable?          empty
       |  |  +--rw poll-interval?   uint16
       |  +--rw multicast
       |  |  +--rw default-group-service-class?   string
       |  +--rw multicast-routing
       |  |  +--rw vrf?   -> ../../../vrf/vrfs/identifier
       |  +--rw proto-throttle-rate
       |  |  +--rw protocol-rates* [rate]
       |  |     +--rw rate        uint8
       |  |     +--rw protocol?   enumeration
       |  +--rw route
       |  |  +--rw routes* [source]
       |  |     +--rw source     -> /c:sdnc/cp:pools/ip/address/ipv4/addresses/address
       |  |     +--rw range?     ct:ipv4-subnet-mask
       |  |     +--rw gateway?   -> /c:sdnc/cp:pools/ip/address/ipv4/addresses/address
       |  |     +--rw metric?    ct:ip-metric
       |  +--rw static
       |  |  +--rw vrf
       |  |     +--rw default
       |  |        +--rw distance?   ct:ip-ttl
       |  +--rw ssh
       |     +--rw password-auth-req?     enumeration
       |     +--rw public-key-auth-req?   enumeration
       +--rw ipv6
       |  +--rw icmp
       |  |  +--rw unreachables?    empty
       |  |  +--rw too-big?         empty
       |  |  +--rw param-problem?   empty
       |  |  +--rw time-exceeded?   enumeration
       |  +--rw proto-throttle-rate
       |  |  +--rw protocol-rates* [rate]
       |  |     +--rw rate        uint8
       |  |     +--rw protocol?   enumeration
       |  +--rw dhcp
       |  |  +--rw relay
       |  |     +--rw source-interface?   enumeration
       |  |     +--rw use-link-address?   enumeration
       |  +--rw mld
       |  |  +--rw query-robustness-variable?   empty
       |  +--rw nd
       |  |  +--rw timeout?       uint16
       |  |  +--rw searching
       |  |  |  +--rw rate-limit?   uint16
       |  |  |  +--rw max-number?   uint16
       |  |  |  +--rw cable
       |  |  |     +--rw unicast?     uint16
       |  |  |     +--rw multicast?   empty
       |  |  +--rw not-present
       |  |     +--rw rate-limit?   uint16
       |  |     +--rw max-number?   uint16
       |  |     +--rw max-time?     uint8
       |  |     +--rw min-time?     uint8
       |  +--rw route
       |  |  +--rw routes* [source]
       |  |     +--rw source     union
       |  |     +--rw vrf?       string
       |  |     +--rw range?     inet:ipv6-prefix
       |  |     +--rw gateway?   -> /c:sdnc/cp:pools/ip/address/ipv6/addresses/address
       |  |     +--rw metric?    ct:ip-metric
       |  +--rw router
       |  |  +--rw pd
       |  |     +--rw distance?   ct:ip-ttl
       |  +--rw static
       |  |  +--rw vrf
       |  |     +--rw default
       |  |        +--rw distance?   ct:ip-ttl
       |  +--rw prefix-stability?      empty
       |  +--rw pd-route-injection?    empty
       +--rw ip-video
       |  +--rw attribute-encoding?   string
       |  +--rw dbc-delay-timer?      uint16
       |  +--rw monitoring
       |     +--rw vod-setup-threshold?      uint16
       |     +--rw linear-setup-threshold?   uint16
       +--rw interface
       |  +--rw cable-streams
       |  |  +--rw interfaces* [interface]
       |  |     +--rw interface               string
       |  |     +--rw cable-direction?        ct:docsis-cable-direction
       |  |     +--rw administrative-state?   enumeration
       |  +--rw cable-mac
       |  |  +--rw instances* [instance]
       |  |     +--rw instance                uint8
       |  |     +--rw enabled?                empty
       |  |     +--rw description?            string
       |  |     +--rw authorization-module?   enumeration
       |  |     +--rw cable
       |  |        +--rw bundle?                      enumeration
       |  |        +--rw freq-ds-min?                 uint16
       |  |        +--rw freq-ds-max?                 uint16
       |  |        +--rw freq-us-min?                 uint16
       |  |        +--rw freq-us-max?                 uint16
       |  |        +--rw us-freq-range?               enumeration
       |  |        +--rw insertion-interval?          uint16
       |  |        +--rw invited-ranging-attempts?    uint16
       |  |        +--rw range-cycle-interval?        uint16
       |  |        +--rw ranging-interval?            uint16
       |  |        +--rw sync-interval?               uint16
       |  |        +--rw ucd-interval?                uint16
       |  |        +--rw cm-tcs-max-size?             union
       |  |        +--rw tftp-enforce?                enumeration
       |  |        +--rw dynamic-secret?              enumeration
       |  |        +--rw cm-ip-prov-mode?             enumeration
       |  |        +--rw cm-dynamic-multi-tuner?      enumeration
       |  |        +--rw upstream-drop-classifiers?   enumeration
       |  |        +--rw mcast-fwd-by-dsid?           empty
       |  |        +--rw mdd-interval?                uint16
       |  |        +--rw verbose-cm-rcp?              enumeration
       |  |        +--rw reg-rsp-timer-t6?            uint16
       |  |        +--rw dynamic-rcc?                 empty
       |  |        +--rw downstream-bonding-group
       |  |        |  +--rw dynamic?              enumeration
       |  |        |  +--rw reseq-wait-time?      uint8
       |  |        |  +--rw reseq-warning-time?   uint8
       |  |        +--rw uptream-bonding-group
       |  |        |  +--rw dynamic?              enumeration
       |  |        |  +--rw reseq-wait-time?      uint8
       |  |        |  +--rw reseq-warning-time?   uint8
       |  |        +--rw mult-rx-chl-mode?            empty
       |  |        +--rw mult-tx-chl-mode?            empty
       |  |        +--rw dsg
       |  |        |  +--rw mode?   enumeration
       |  |        +--rw qos-sc
       |  |        |  +--rw enforce-rules?   enumeration
       |  |        +--rw upstream
       |  |        |  +--rw ext-power?                enumeration
       |  |        |  +--rw graceful-tcs-reduction?   enumeration
       |  |        |  +--rw ranging-poll?             enumeration
       |  |        +--rw energy-mgmt
       |  |        |  +--rw low-power-1x1?   enumeration
       |  |        +--rw cm-status
       |  |        |  +--rw enabled?      empty
       |  |        |  +--rw event-type
       |  |        |     +--rw all
       |  |        |        +--rw enabled?             empty
       |  |        |        +--rw max-event-holdoff?   enumeration
       |  |        |        +--rw max-num-reports?     uint16
       |  |        +--rw privacy
       |  |        |  +--rw default-cert-trust?    enumeration
       |  |        |  +--rw chk-validity-period?   enumeration
       |  |        |  +--rw mandatory?             enumeration
       |  |        |  +--rw eae-policy?            enumeration
       |  |        |  +--rw kek
       |  |        |  |  +--rw life-time?   uint32
       |  |        |  +--rw tek
       |  |        |     +--rw life-time?   uint32
       |  |        +--rw ofdm
       |  |           +--rw docsis-mode?            ct:docsis-version
       |  |           +--rw profile-guard-time?     uint16
       |  |           +--rw preeq-probe-interval?   uint16
       |  +--rw cable-mac-sub
       |  |  +--rw sub-instances* [instance]
       |  |     +--rw instance                -> ../../../cable-mac/instances/instance
       |  |     +--rw sub-instance?           uint8
       |  |     +--rw description?            string
       |  |     +--rw proxy-arp?              empty
       |  |     +--rw restricted-proxy-arp?   empty
       |  |     +--rw ip
       |  |        +--rw ipv4
       |  |        |  +--rw directed-broadcast?   enumeration
       |  |        |  +--rw unreachables?         empty
       |  |        |  +--rw addresses* [address]
       |  |        |     +--rw address        union
       |  |        |     +--rw subnet-mask?   ct:ipv4-subnet-mask
       |  |        |     +--rw scope?         enumeration
       |  |        +--rw ipv6
       |  |        |  +--rw enable?      empty
       |  |        |  +--rw addresses* [address]
       |  |        |     +--rw address            union
       |  |        |     +--rw generate-method?   enumeration
       |  |        |     +--rw scope?             ct:ipv6-network-scope
       |  |        +--rw vrf
       |  |           +--rw forwarding?   enumeration
       |  +--rw ethernet
       |  |  +--rw instances* [instance]
       |  |     +--rw instance          string
       |  |     +--rw enabled?          empty
       |  |     +--rw description?      string
       |  |     +--rw gratuitous-arp?   empty
       |  |     +--rw pre-shared-key?   string
       |  |     +--rw encapsulation
       |  |     |  +--rw outer?      ct:ip-vlan-id
       |  |     |  +--rw vlan-id?    -> /c:sdnc/cp:pools/ip/vlan/outer[cp:identifier=current()/../rd2322:outer]/cp:inner/identifier
       |  |     |  +--rw mode?       -> /c:sdnc/cp:pools/ip/vlan/outer[cp:identifier=current()/../rd2322:outer]/cp:inner[cp:identifier=current()/../rd2322:vlan-id]/cp:type
       |  |     |  +--rw priority?   uint16
       |  |     +--rw macsec
       |  |     |  +--rw mode?   ct:ip-macsec-mode
       |  |     +--rw ip
       |  |     |  +--rw unreachables?         empty
       |  |     |  +--rw directed-broadcast?   empty
       |  |     |  +--rw address
       |  |     |  |  +--rw address?       union
       |  |     |  |  +--rw subnet-mask?   ct:ipv4-subnet-mask
       |  |     |  |  +--rw scope?         enumeration
       |  |     |  +--rw vrf
       |  |     |  |  +--rw forwarding?   -> ../../../../../../vrf/vrfs/identifier
       |  |     |  +--rw mtu?                  uint16
       |  |     +--rw ipv6
       |  |        +--rw enabled?   empty
       |  |        +--rw address
       |  |        |  +--rw address?           union
       |  |        |  +--rw generate-method?   enumeration
       |  |        |  +--rw scope?             ct:ipv6-network-scope
       |  |        +--rw icmp
       |  |        |  +--rw unreachables?    empty
       |  |        |  +--rw too-big?         empty
       |  |        |  +--rw param-problem?   empty
       |  |        |  +--rw time-exceeded?   enumeration
       |  |        +--rw nd
       |  |        |  +--rw managed-config?   empty
       |  |        |  +--rw other-config?     empty
       |  |        |  +--rw ns-interval?      uint16
       |  |        |  +--rw reachable-time?   uint32
       |  |        |  +--rw dad
       |  |        |  |  +--rw attempts?   uint16
       |  |        |  +--rw ra
       |  |        |     +--rw interval
       |  |        |     |  +--rw begin?   uint16
       |  |        |     |  +--rw end?     uint16
       |  |        |     +--rw suppress?   empty
       |  |        +--rw mtu?       uint16
       |  +--rw loopback
       |  |  +--rw instances* [instance]
       |  |     +--rw instance       uint8
       |  |     +--rw enabled?       empty
       |  |     +--rw description?   string
       |  |     +--rw ip
       |  |     |  +--rw address
       |  |     |  |  +--rw address?       union
       |  |     |  |  +--rw subnet-mask?   ct:ipv4-subnet-mask
       |  |     |  |  +--rw scope?         ct:ip-dhcp-priority
       |  |     |  +--rw vrf
       |  |     |     +--rw forwarding?   -> ../../../../../../vrf/vrfs/identifier
       |  |     +--rw ipv6
       |  |        +--rw enabled?   empty
       |  |        +--rw address
       |  |           +--rw address?           union
       |  |           +--rw generate-method?   enumeration
       |  |           +--rw scope?             ct:ipv6-network-scope
       |  +--rw null
       |  |  +--rw instances* [instance]
       |  |     +--rw instance       uint8
       |  |     +--rw description?   string
       |  |     +--rw ip
       |  |     +--rw ipv6
       |  |        +--rw icmp
       |  |           +--rw unreachables?    empty
       |  |           +--rw too-big?         empty
       |  |           +--rw param-problem?   empty
       |  |           +--rw time-exceeded?   enumeration
       |  +--rw mgmt
       |  |  +--rw ns
       |  |     +--rw instances* [instance]
       |  |     |  +--rw instance       uint8
       |  |     |  +--rw description?   string
       |  |     |  +--rw enabled?       empty
       |  |     +--rw encapsulation
       |  |     |  +--rw method?    -> /c:sdnc/cp:pools/ip/vlan/outer[cp:identifier=current()/../rd2322:outer]/cp:inner[cp:identifier=current()/../rd2322:vlan-id]/cp:type
       |  |     |  +--rw outer?     ct:ip-vlan-id
       |  |     |  +--rw vlan-id?   -> /c:sdnc/cp:pools/ip/vlan/outer[cp:identifier=current()/../rd2322:outer]/cp:inner/identifier
       |  |     +--rw sub-instances* [instance]
       |  |        +--rw instance        -> ../../../ns/instances/instance
       |  |        +--rw sub-instance?   uint8
       |  |        +--rw description?    string
       |  |        +--rw ip
       |  |           +--rw ipv4
       |  |           |  +--rw addresses* [address]
       |  |           |     +--rw address         union
       |  |           |     +--rw subnet-mask?    ct:ipv4-subnet-mask
       |  |           |     +--rw scope?          enumeration
       |  |           |     +--rw dhcp-options
       |  |           |        +--rw wait-time?   uint16
       |  |           +--rw ipv6
       |  |              +--rw enable?      empty
       |  |              +--rw addresses* [address]
       |  |                 +--rw address            union
       |  |                 +--rw generate-method?   enumeration
       |  |                 +--rw scope?             enumeration
       |  |                 +--rw dhcp-options
       |  |                    +--rw wait-time?   uint16
       |  +--rw rpd
       |     +--rw rpds* [identifier]
       |        +--rw identifier     ct:name
       |        +--rw description?   string
       |        +--rw ds-conn* [instance]
       |        |  +--rw instance              uint8
       |        |  +--rw ds-group?             string
       |        |  +--rw power-level?          uint16
       |        |  +--rw tilt-power-adjust?    uint16
       |        |  +--rw tilt-max-frequency?   uint64
       |        +--rw us-conn* [instance]
       |           +--rw instance             uint8
       |           +--rw base-target-power?   uint16
       +--rw l2vpn
       |  +--rw forwarding?          enumeration
       |  +--rw cm
       |  |  +--rw capability
       |  |     +--rw esafe-ident?   enumeration
       |  |     +--rw dut-filter?    enumeration
       |  +--rw network-interface
       |     +--rw type?        enumeration
       |     +--rw ethertype?   string
       +--rw operation
       |  +--rw modes* [mode]
       |     +--rw mode       enumeration
       |     +--rw enabled?   enumeration
       +--rw packetcable
       |  +--rw pepid-hostname?   inet:host
       |  +--rw dqos
       |  |  +--rw enabled?   empty
       |  |  +--rw timer
       |  |     +--rw t0?   uint8
       |  |     +--rw t1?   uint8
       |  +--rw eventmsg
       |  |  +--rw element-id?       string
       |  |  +--rw batch-size?       uint16
       |  |  +--rw billing-events?   uint16
       |  |  +--rw max-age?          uint16
       |  |  +--rw retry
       |  |     +--rw timer?   uint16
       |  |     +--rw limit?   uint16
       |  +--rw gate
       |  |  +--rw send-subscriber-id?   empty
       |  +--rw pcmm
       |  |  +--rw enabled?         empty
       |  |  +--rw subscriber-id?   enumeration
       |  |  +--rw version?         ct:docsis-packetcable-pcmm-version
       |  |  +--rw timer
       |  |     +--rw t0?   uint8
       |  |     +--rw t1?   uint8
       |  +--rw throttle
       |  |  +--rw normal-threshold?   uint16
       |  |  +--rw red-threshold?      uint16
       |  |  +--rw yellow-threshold?   uint16
       |  +--rw voice-limit
       |     +--rw voice-limits* [direction]
       |        +--rw direction             enumeration
       |        +--rw allowed-total?        uint16
       |        +--rw allowed-normal?       uint16
       |        +--rw allowed-emergency?    uint16
       |        +--rw reserved-normal?      uint16
       |        +--rw reserved-emergency?   uint16
       +--rw ntp
       |  +--rw version?          ct:ntp-version
       |  +--rw authentication?   empty
       |  +--rw minpoll?          uint8
       |  +--rw maxpoll?          uint8
       +--rw tod
       |  +--rw servers* [server]
       |     +--rw server      inet:ip-address-no-zone
       |     +--rw protocol?   ct:ip-protocol-type
       |     +--rw not-use?    enumeration
       +--rw overlay
       |  +--rw downstream
       |  |  +--rw enabled?       empty
       |  |  +--rw attenuator?    uint16
       |  |  +--rw hysteresis?    uint8
       |  |  +--rw optical-agc
       |  |     +--rw enabled?                 empty
       |  |     +--rw attenuator-reference?    uint16
       |  |     +--rw input-power-reference?   uint16
       |  +--rw upstream
       |     +--rw enabled?   empty
       +--rw overload-control
       |  +--rw sensitivity?   uint8
       |  +--rw threshold?     uint8
       +--rw ofdm
       |  +--rw global
       |  |  +--rw plc-dpd-ocd-interval?       uint8
       |  |  +--rw profile0-dpd-interval?      uint8
       |  |  +--rw enable-short-codewords?     empty
       |  |  +--rw iuc-short-term-threshold?   uint8
       |  |  +--rw iuc13-impair-enable?        empty
       |  +--rw modulation-profile
       |  |  +--rw modulation-profiles* [instance]
       |  |     +--rw instance             uint16
       |  |     +--rw name?                ct:name
       |  |     +--rw description?         string
       |  |     +--rw cyclic-prefix?       uint8
       |  |     +--rw rolloff-period?      uint8
       |  |     +--rw symbols-per-frame?   uint8
       |  |     +--rw iuc
       |  |     |  +--rw instance?        uint16
       |  |     |  +--rw modulation?      ct:docsis-modulation-profile
       |  |     |  +--rw pilot-pattern?   uint8
       |  |     +--rw initial-ranging
       |  |     |  +--rw frequency-width?         uint16
       |  |     |  +--rw preamble-length?         uint8
       |  |     |  +--rw tutal-guard-band-size?   uint8
       |  |     +--rw fine-ranging
       |  |        +--rw frequency-width?   uint16
       |  |        +--rw preamble-length?   uint8
       |  +--rw profile-mgmt
       |     +--rw threshold?            uint8
       |     +--rw retry-interval?       uint8
       |     +--rw guard-time?           uint16
       |     +--rw max-retries?          uint8
       |     +--rw modulation-profile
       |        +--rw modulation-margins* [modulation]
       |           +--rw modulation    ct:docsis-modulation-profile
       |           +--rw mer-adjust?   uint8
       +--rw qos-sc
       |  +--rw qos-scs* [name]
       |     +--rw name                         ct:name
       |     +--rw priority?                    uint16
       |     +--rw max-tr-rate?                 uint16
       |     +--rw max-tr-burst?                uint16
       |     +--rw min-res-rate?                uint16
       |     +--rw min-res-pkt?                 uint16
       |     +--rw max-burst?                   uint16
       |     +--rw poll-int?                    uint16
       |     +--rw poll-jitter?                 uint16
       |     +--rw grant-size?                  uint16
       |     +--rw grant-int?                   uint16
       |     +--rw grant-jitter?                uint16
       |     +--rw grants-per-int?              uint16
       |     +--rw active-tmout?                uint16
       |     +--rw adm-tmout?                   uint16
       |     +--rw type?                        uint16
       |     +--rw req-policy?                  string
       |     +--rw and-mask?                    string
       |     +--rw or-mask?                     string
       |     +--rw dir?                         uint16
       |     +--rw required-attr-mask-value?    string
       |     +--rw forbidden-attr-mask-value?   string
       |     +--rw attr-aggr-rule-mask-value?   string
       |     +--rw peak-tr-rate?                uint16
       +--rw vrf
       |  +--rw vrfs* [identifier]
       |     +--rw identifier            -> /c:sdnc/cp:pools/ip/vrf/vrfs/identifier
       |     +--rw auto-import?          empty
       |     +--rw icmp-time-exceeded?   empty
       +--rw rpd
       |  +--rw global
       |     +--rw l2tp
       |     |  +--rw version?           ct:ip-l2tp-version
       |     |  +--rw hello-interval?    ct:yes-no
       |     |  +--rw retries?           ct:yes-no
       |     |  +--rw setup-wait-time?   uint16
       |     +--rw gcp
       |     |  +--rw keepalive-interval?   uint16
       |     |  +--rw keepalive-timeout?    uint16
       |     +--rw max-mtu?                   uint16
       |     +--rw status-refresh-interval?   uint16
       |     +--rw mcast-session-id
       |     |  +--rw min?   string
       |     |  +--rw max?   string
       |     +--rw multicast-interface
       |     |  +--rw enabled?   empty
       |     |  +--rw mode?      enumeration
       |     +--rw cin-if-timeout?            uint8
       +--rw snmp-server
       |  +--rw contact?         ct:email-address
       |  +--rw location?        string
       |  +--rw context?         string
       |  +--rw enable
       |  |  +--rw traps
       |  |     +--rw snmp?   empty
       |  +--rw data
       |  |  +--rw snmp-agent
       |  |  |  +--rw max-read-ahead?   uint16
       |  |  |  +--rw refresh-time?     uint16
       |  |  +--rw max-read-ahead?   uint16
       |  |  +--rw refresh-time?     uint16
       |  +--rw community
       |  |  +--rw communities* [community]
       |  |     +--rw community       ct:snmp-community-name
       |  |     +--rw access?         ct:snmp-access-type
       |  |     +--rw index?          ct:name
       |  |     +--rw ttag?           string
       |  |     +--rw transmsssion?   ct:snmp-transmission-type
       |  +--rw host
       |  |  +--rw hosts* [host]
       |  |     +--rw host              inet:host
       |  |     +--rw name?             ct:name
       |  |     +--rw udp-port?         inet:port-number
       |  |     +--rw version?          ct:snmp-version
       |  |     +--rw inform-taglist?   string
       |  |     +--rw tparam?           string
       |  |     +--rw timeout?          uint16
       |  |     +--rw retry?            uint16
       |  |     +--rw notify-filter?    string
       |  |     +--rw mms?              uint16
       |  +--rw notify-filter
       |  |  +--rw profiles* [profile]
       |  |     +--rw profile    ct:name
       |  |     +--rw subtree?   string
       |  |     +--rw type?      ct:snmp-notify-filter-type
       |  +--rw port-trap-inh
       |  |  +--rw interfaces* [interface identifier]
       |  |     +--rw interface     enumeration
       |  |     +--rw identifier    string
       |  |     +--rw hex?          string
       |  +--rw user
       |  |  +--rw users* [username]
       |  |     +--rw username    ct:name
       |  |     +--rw password?   string
       |  |     +--rw version?    ct:snmp-version
       |  +--rw group
       |  |  +--rw groups* [name version]
       |  |     +--rw name       ct:name
       |  |     +--rw version    ct:snmp-version
       |  |     +--rw read?      ct:name
       |  |     +--rw write?     ct:name
       |  |     +--rw notify?    ct:name
       |  +--rw view
       |     +--rw views* [name]
       |        +--rw name       ct:name
       |        +--rw subtree?   string
       |        +--rw type?      ct:snmp-notify-filter-type
       +--ro cli-footer
```

### YANG Dependencies

```
 sdnc sdnc-types sdnc-sku sdnc-pools sdnc-xnf sdnc-groupings ietf-inet-types
```
