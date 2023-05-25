```
module: sdnc-xnf

  augment /c:sdnc:
    +--rw xnf {c:sdnc,cs:sdnc-sku}?
       +--rw nf* [instance]
          +--rw instance           yang:uuid
          +---x undefine
          +---x upgrade
          |  +---w input
          |     +---w model-namespace    -> /c:sdnc/cs:sku/models/model-namespace
          |     +---w model-revision?    -> /c:sdnc/cs:sku/models[cs:model-namespace=current()/../cnf:model-namespace]/cs:versions/model-revision
          +---x downgrade
          |  +---w input
          |     +---w model-namespace    -> /c:sdnc/cs:sku/models/model-namespace
          |     +---w model-revision?    -> /c:sdnc/cs:sku/models[cs:model-namespace=current()/../cnf:model-namespace]/cs:versions/model-revision
          +--rw model-namespace?   -> /c:sdnc/cs:sku/models/model-namespace
          +--rw model-revision?    -> /c:sdnc/cs:sku/models[cs:model-namespace=current()/../cnf:model-namespace]/cs:versions/model-revision
          +--rw parent-instance?   -> /c:sdnc/cnf:xnf/nf/instance
          +--rw management
          |  +--rw host?                                    inet:host
          |  +--rw port?                                    inet:port-number
          |  +--rw node-id?                                 -> /nt:network-topology/topology/node/node-id
          |  +--rw data-model                               ct:model-construct
          |  +--rw protocol                                 ct:management-protocol
          |  +--rw identifier?                              ct:nf-identifier
          |  +--rw name                                     string
          |  +--rw description?                             string
          |  +--rw incarnation                              ct:xnf-incarnation
          |  +--rw state                                    ct:xnf-state
          |  +--rw asset-id?                                string
          |  +--rw username                                 string
          |  +--rw password                                 string
          |  +--rw (protocol-transport)?
          |  |  +--:(cli-ssh)
          |  |  |  +--rw enable-username?                   string
          |  |  |  +--rw enable-password?                   string
          |  |  +--:(netconf)
          |  |     +--rw tcp-only?                          boolean
          |  |     +--rw connection-timeout-millis?         uint32
          |  |     +--rw default-request-timeout-millis?    uint32
          |  |     +--rw between-attempts-timeout-millis?   uint16
          |  |     +--rw sleep-factor?                      decimal64
          |  |     +--rw keepalive-delay?                   uint32
          |  |     +--rw hello-message-capabilities
          |  |     |  +--rw capability*   inet:uri
          |  |     +--rw schema-cache-directory?            string
          |  |     +--rw concurrent-rpc-limit?              uint16
          |  |     +--rw max-connection-attempts?           uint32
          |  |     +--rw reconnect-on-changed-schema?       boolean
          |  |     +--rw authentication-method?             enumeration
          |  |     +--rw capability-override
          |  |     |  +--rw override?     boolean
          |  |     |  +--rw capability*   string
          |  |     +--rw call-home
          |  |        +--rw unique-id?        string
          |  |        +---x revoke
          |  |        +--rw (protocol)?
          |  |        |  +--:(ssh)
          |  |        |  |  +--rw host-key?   string
          |  |        |  +--:(tls)
          |  |        |     +--rw chain* [certificate-id]
          |  |        |        +--rw certificate-id    -> /c:sdnc/cch:call-home/tls/certificates/id
          |  |        |        +--rw key-id?           -> /c:sdnc/cch:call-home/tls/certificates/id
          |  |        +--rw username?         string
          |  |        +--rw password?         string
          |  +--rw firmware
          |     +--rw revisions* [name]
          |        +--rw name       string
          |        +--rw version?   ct:firmware-version-type
          +--rw snmp
          |  +--rw security-group-identifier?   -> /c:sdnc/css:snmp/security-groups/security-group/identifier
          |  +--rw request-group-identifier?    -> /c:sdnc/css:snmp/requests/request-groups/identifier
          +--rw location
          |  +--rw decimal-degrees?         ct:location-decimal-degrees-type
          |  +--rw geographic-coordinate
          |  |  +--rw latitude?    ct:location-latitude
          |  |  +--rw longitude?   ct:location-longitude
          |  +--rw postal-address
          |     +--rw room?                      string
          |     +--rw floor?                     uint8
          |     +--rw building-name-or-number?   string
          |     +--rw street-name?               string
          |     +--rw district?                  string
          |     +--rw city?                      string
          |     +--rw state?                     string
          |     +--rw postal-code?               string
          |     +--rw country?                   ct:location-iso3166-1-alpha-3
          +--rw configs
             +--rw config-histories-to-keep?   uint8
             +--rw config-slices-to-keep?      uint8
             +--rw config-history* [timestamp]
             |  +--rw timestamp         yang:date-and-time
             |  +--rw model-revision?   -> /c:sdnc/cs:sku/models[cs:model-namespace=current()/../../../cnf:model-namespace]/cs:versions/model-revision
             |  +--rw raw?              string
             +--rw config-slices* [instance-slice]
                +--rw instance-slice          yang:uuid
                +--rw raw?                    string
                +--rw validate-only?          empty
                +--rw generation-timestamp?   yang:date-and-time
                +--rw delivery-timestamp?     yang:date-and-time
                +--rw delivery-result?        ct:nf-config-delivery-result
                +--rw delivery-response?      string
  augment /nt:network-topology/nt:topology/nt:node:
    +--rw sdnc! {c:sdnc,cnf:sdnc-xnf}?
       +--rw instance?   -> /c:sdnc/cnf:xnf/nf/instance {c:sdnc,cnf:sdnc-xnf}?

  rpcs:
    +---x list-all-instances {c:sdnc,cnf:sdnc-xnf,cs:sdnc-sku}?
    |  +--ro output
    |     +--ro instances* [instance]
    |        +--ro instance           -> /c:sdnc/cnf:xnf/nf/instance
    |        +--ro management-name?   string
    |        +--ro model-namespace    -> /c:sdnc/cs:sku/models/model-namespace
    |        +--ro model-revision     -> /c:sdnc/cs:sku/models/versions/model-revision
    +---x list-all-instances-by-namespace {c:sdnc,cnf:sdnc-xnf,cs:sdnc-sku}?
    |  +---w input
    |  |  +---w model-namespace    -> /c:sdnc/cs:sku/models/model-namespace
    |  +--ro output
    |     +--ro instances* [instance]
    |        +--ro instance           -> /c:sdnc/cnf:xnf/nf/instance
    |        +--ro management-name?   string
    |        +--ro model-revision     ct:module-revision
    +---x list-all-instances-by-namespace-revision {c:sdnc,cnf:sdnc-xnf,cs:sdnc-sku}?
    |  +---w input
    |  |  +---w model-namespace    -> /c:sdnc/cs:sku/models/model-namespace
    |  |  +---w model-revision     -> /c:sdnc/cs:sku/models[cs:model-namespace=current()/../cnf:model-namespace]/cs:versions/model-revision
    |  +--ro output
    |     +--ro instances* [instance]
    |        +--ro instance           -> /c:sdnc/cnf:xnf/nf/instance
    |        +--ro management-name?   string
    +---x list-all-dependants {c:sdnc,cnf:sdnc-xnf,cs:sdnc-sku}?
    |  +---w input
    |  |  +---w instance    -> /c:sdnc/cnf:xnf/nf/instance
    |  +--ro output
    |     +--ro instances* [instance]
    |        +--ro instance           -> /c:sdnc/cnf:xnf/nf/instance
    |        +--ro management-name?   string
    |        +--ro model-namespace    -> /c:sdnc/cs:sku/models/model-namespace
    |        +--ro model-revision     -> /c:sdnc/cs:sku/models/versions/model-revision
    +---x list-all-dependants-by-model {c:sdnc,cnf:sdnc-xnf,cs:sdnc-sku}?
    |  +---w input
    |  |  +---w instance           -> /c:sdnc/cnf:xnf/nf/instance
    |  |  +---w model-namespace    -> /c:sdnc/cs:sku/models/model-namespace
    |  +--ro output
    |     +--ro instances* [instance]
    |        +--ro instance           -> /c:sdnc/cnf:xnf/nf/instance
    |        +--ro management-name?   string
    |        +--ro model-revision     ct:module-revision
    +---x list-all-dependants-by-model-revision {c:sdnc,cnf:sdnc-xnf,cs:sdnc-sku}?
    |  +---w input
    |  |  +---w instance           -> /c:sdnc/cnf:xnf/nf/instance
    |  |  +---w model-namespace    -> /c:sdnc/cs:sku/models/model-namespace
    |  |  +---w model-revision     -> /c:sdnc/cs:sku/models[cs:model-namespace=current()/../cnf:model-namespace]/cs:versions/model-revision
    |  +--ro output
    |     +--ro instances* [instance]
    |        +--ro instance           -> /c:sdnc/cnf:xnf/nf/instance
    |        +--ro management-name?   string
    +---x define {c:sdnc,cnf:sdnc-xnf,cs:sdnc-sku}?
    |  +---w input
    |  |  +---w model-namespace                          -> /c:sdnc/cs:sku/models/model-namespace
    |  |  +---w model-revision?                          -> /c:sdnc/cs:sku/models[cs:model-namespace=current()/../cnf:model-namespace]/cs:versions/model-revision
    |  |  +---w identifier                               ct:nf-identifier
    |  |  +---w name                                     string
    |  |  +---w description?                             string
    |  |  +---w location-decimal-degrees?                ct:location-decimal-degrees-type
    |  |  +---w parent-instance?                         -> /c:sdnc/cnf:xnf/nf/instance
    |  |  +---w host?                                    inet:host
    |  |  +---w port?                                    inet:port-number
    |  |  +---w username                                 string
    |  |  +---w password                                 string
    |  |  +---w data-model                               ct:model-construct
    |  |  +---w protocol                                 ct:management-protocol
    |  |  +---w incarnation?                             ct:xnf-incarnation
    |  |  +---w state?                                   ct:xnf-state
    |  |  +---w (protocol-transport)?
    |  |     +--:(cli-ssh)
    |  |     |  +---w enable-username?                   string
    |  |     |  +---w enable-password?                   string
    |  |     |  +---w snmp
    |  |     |     +---w security-group-identifier?   -> /c:sdnc/css:snmp/security-groups/security-group/identifier
    |  |     |     +---w request-group-identifier?    -> /c:sdnc/css:snmp/requests/request-groups/identifier
    |  |     +--:(netconf)
    |  |        +---w tcp-only?                          boolean
    |  |        +---w connection-timeout-millis?         uint32
    |  |        +---w default-request-timeout-millis?    uint32
    |  |        +---w between-attempts-timeout-millis?   uint16
    |  |        +---w sleep-factor?                      decimal64
    |  |        +---w keepalive-delay?                   uint32
    |  |        +---w schema-cache-directory?            string
    |  |        +---w concurrent-rpc-limit?              uint16
    |  |        +---w max-connection-attempts?           uint32
    |  |        +---w reconnect-on-changed-schema?       boolean
    |  |        +---w netconf-username?                  string
    |  |        +---w netconf-password?                  string
    |  |        +---w netconf-authentication-method?     enumeration
    |  |        +---w capability-override
    |  |        |  +---w override?     boolean
    |  |        |  +---w capability*   string
    |  |        +---w call-home
    |  |           +---w unique-id?        string
    |  |           +---w (protocol)?
    |  |           |  +--:(ssh)
    |  |           |  |  +---w host-key?   string
    |  |           |  +--:(tls)
    |  |           |     +---w chain* [certificate-id]
    |  |           |        +---w certificate-id    -> /c:sdnc/cch:call-home/tls/certificates/id
    |  |           |        +---w key-id?           -> /c:sdnc/cch:call-home/tls/certificates/id
    |  |           +---w username?         string
    |  |           +---w password?         string
    |  +--ro output
    |     +--ro instance    -> /c:sdnc/cnf:xnf/nf/instance
    +---x nf-change-cli-credentials {c:sdnc,cnf:sdnc-xnf}?
    |  +---w input
    |     +---w instance?   -> /c:sdnc/cnf:xnf/nf/instance
    |     +---w username    string
    |     +---w password?   string
    +---x nf-change-enable-credentials {c:sdnc,cnf:sdnc-xnf}?
    |  +---w input
    |     +---w instance?          -> /c:sdnc/cnf:xnf/nf/instance
    |     +---w enable-username    string
    |     +---w enable-password?   string
    +---x nf-change-netconf-credentials {c:sdnc,cnf:sdnc-xnf}?
    |  +---w input
    |     +---w instance?           -> /c:sdnc/cnf:xnf/nf/instance
    |     +---w netconf-username    string
    |     +---w netconf-password?   string
    +---x nf-change-call-home-credentials {c:sdnc,cnf:sdnc-xnf}?
    |  +---w input
    |     +---w instance?   -> /c:sdnc/cnf:xnf/nf/instance
    |     +---w username    string
    |     +---w password?   string
    +---x nf-change-call-home-host-key {c:sdnc,cnf:sdnc-xnf}?
    |  +---w input
    |     +---w instance?   -> /c:sdnc/cnf:xnf/nf/instance
    |     +---w host-key?   string
    +---x nf-change-netconf-host-port {c:sdnc,cnf:sdnc-xnf}?
    |  +---w input
    |     +---w instance?   -> /c:sdnc/cnf:xnf/nf/instance
    |     +---w host        inet:host
    |     +---w port?       inet:port-number
    +---x nf-config-to-history {c:sdnc,cnf:sdnc-xnf}?
    |  +---w input
    |     +---w instance?           -> /c:sdnc/cnf:xnf/nf/instance
    |     +---w source-datastore?   ct:netconf-datastores
    +---x history-to-nf-config {c:sdnc,cnf:sdnc-xnf}?
       +---w input
          +---w instance?            -> /c:sdnc/cnf:xnf/nf/instance
          +---w target-datastore?    ct:netconf-datastores
          +---w history-timestamp?   yang:date-and-time

  notifications:
    +---n nf-added {c:sdnc,cnf:sdnc-xnf}?
    |  +--ro instance           -> /c:sdnc/cnf:xnf/nf/instance
    |  +--ro model-namespace    -> /c:sdnc/cs:sku/models/model-namespace
    |  +--ro model-revision     -> /c:sdnc/cs:sku/models[cs:model-namespace=current()/../cnf:model-namespace]/cs:versions/model-revision
    |  +--ro parent-instance?   -> /c:sdnc/cnf:xnf/nf/instance
    |  +--ro management-name?   string
    +---n nf-change {c:sdnc,cnf:sdnc-xnf}?
    |  +--ro instance           -> /c:sdnc/cnf:xnf/nf/instance
    |  +--ro model-namespace    -> /c:sdnc/cs:sku/models/model-namespace
    |  +--ro model-revision     -> /c:sdnc/cs:sku/models[cs:model-namespace=current()/../cnf:model-namespace]/cs:versions/model-revision
    |  +--ro parent-instance?   -> /c:sdnc/cnf:xnf/nf/instance
    |  +--ro management-name?   string
    +---n nf-deleted {c:sdnc,cnf:sdnc-xnf}?
    |  +--ro instance           -> /c:sdnc/cnf:xnf/nf/instance
    |  +--ro model-namespace    -> /c:sdnc/cs:sku/models/model-namespace
    |  +--ro model-revision     -> /c:sdnc/cs:sku/models[cs:model-namespace=current()/../cnf:model-namespace]/cs:versions/model-revision
    |  +--ro parent-instance?   -> /c:sdnc/cnf:xnf/nf/instance
    |  +--ro management-name?   string
    +---n nf-config-change {c:sdnc,cnf:sdnc-xnf}?
    |  +--ro instance           -> /c:sdnc/cnf:xnf/nf/instance
    |  +--ro model-namespace    -> /c:sdnc/cs:sku/models/model-namespace
    |  +--ro model-revision     -> /c:sdnc/cs:sku/models[cs:model-namespace=current()/../cnf:model-namespace]/cs:versions/model-revision
    |  +--ro parent-instance?   -> /c:sdnc/cnf:xnf/nf/instance
    |  +--ro management-name?   string
    |  +--ro instance-slice     yang:uuid
    +---n nf-config-generated {c:sdnc,cnf:sdnc-xnf}?
    |  +--ro instance           -> /c:sdnc/cnf:xnf/nf/instance
    |  +--ro model-namespace    -> /c:sdnc/cs:sku/models/model-namespace
    |  +--ro model-revision     -> /c:sdnc/cs:sku/models[cs:model-namespace=current()/../cnf:model-namespace]/cs:versions/model-revision
    |  +--ro parent-instance?   -> /c:sdnc/cnf:xnf/nf/instance
    |  +--ro management-name?   string
    |  +--ro instance-slice     yang:uuid
    +---n nf-config-delivery {c:sdnc,cnf:sdnc-xnf}?
    |  +--ro instance           -> /c:sdnc/cnf:xnf/nf/instance
    |  +--ro model-namespace    -> /c:sdnc/cs:sku/models/model-namespace
    |  +--ro model-revision     -> /c:sdnc/cs:sku/models[cs:model-namespace=current()/../cnf:model-namespace]/cs:versions/model-revision
    |  +--ro parent-instance?   -> /c:sdnc/cnf:xnf/nf/instance
    |  +--ro management-name?   string
    |  +--ro instance-slice     -> /c:sdnc/cnf:xnf/nf[cnf:instance=current()/../instance]/configs/config-slices/instance-slice
    |  +--ro timestamp          yang:date-and-time
    |  +--ro result             ct:nf-config-delivery-result
    +---n nf-connected {c:sdnc,cnf:sdnc-xnf}?
    |  +--ro instance           -> /c:sdnc/cnf:xnf/nf/instance
    |  +--ro model-namespace    -> /c:sdnc/cs:sku/models/model-namespace
    |  +--ro model-revision     -> /c:sdnc/cs:sku/models[cs:model-namespace=current()/../cnf:model-namespace]/cs:versions/model-revision
    |  +--ro parent-instance?   -> /c:sdnc/cnf:xnf/nf/instance
    |  +--ro management-name?   string
    +---n nf-disconnected {c:sdnc,cnf:sdnc-xnf}?
    |  +--ro instance           -> /c:sdnc/cnf:xnf/nf/instance
    |  +--ro model-namespace    -> /c:sdnc/cs:sku/models/model-namespace
    |  +--ro model-revision     -> /c:sdnc/cs:sku/models[cs:model-namespace=current()/../cnf:model-namespace]/cs:versions/model-revision
    |  +--ro parent-instance?   -> /c:sdnc/cnf:xnf/nf/instance
    |  +--ro management-name?   string
    +---n nf-connecting {c:sdnc,cnf:sdnc-xnf}?
    |  +--ro instance           -> /c:sdnc/cnf:xnf/nf/instance
    |  +--ro model-namespace    -> /c:sdnc/cs:sku/models/model-namespace
    |  +--ro model-revision     -> /c:sdnc/cs:sku/models[cs:model-namespace=current()/../cnf:model-namespace]/cs:versions/model-revision
    |  +--ro parent-instance?   -> /c:sdnc/cnf:xnf/nf/instance
    |  +--ro management-name?   string
    +---n nf-unable-to-connect {c:sdnc,cnf:sdnc-xnf}?
    |  +--ro instance           -> /c:sdnc/cnf:xnf/nf/instance
    |  +--ro model-namespace    -> /c:sdnc/cs:sku/models/model-namespace
    |  +--ro model-revision     -> /c:sdnc/cs:sku/models[cs:model-namespace=current()/../cnf:model-namespace]/cs:versions/model-revision
    |  +--ro parent-instance?   -> /c:sdnc/cnf:xnf/nf/instance
    |  +--ro management-name?   string
    +---n nf-failed-auth-failure {c:sdnc,cnf:sdnc-xnf}?
    |  +--ro instance           -> /c:sdnc/cnf:xnf/nf/instance
    |  +--ro model-namespace    -> /c:sdnc/cs:sku/models/model-namespace
    |  +--ro model-revision     -> /c:sdnc/cs:sku/models[cs:model-namespace=current()/../cnf:model-namespace]/cs:versions/model-revision
    |  +--ro parent-instance?   -> /c:sdnc/cnf:xnf/nf/instance
    |  +--ro management-name?   string
    +---n nf-failed-not-allowed {c:sdnc,cnf:sdnc-xnf}?
    |  +--ro host    inet:host
    |  +--ro port    inet:port-number
    +---n nf-failed {c:sdnc,cnf:sdnc-xnf}?
       +--ro instance           -> /c:sdnc/cnf:xnf/nf/instance
       +--ro model-namespace    -> /c:sdnc/cs:sku/models/model-namespace
       +--ro model-revision     -> /c:sdnc/cs:sku/models[cs:model-namespace=current()/../cnf:model-namespace]/cs:versions/model-revision
       +--ro parent-instance?   -> /c:sdnc/cnf:xnf/nf/instance
       +--ro management-name?   string
```

### YANG Dependencies

```
 sdnc sdnc-sku sdnc-snmp sdnc-types sdnc-call-home ietf-yang-types ietf-inet-types yang-ext network-topology
```
