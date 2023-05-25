```
module: sdnc-halo-docs

  rpcs:
    +---x controller-create-device {chd:sdnc-halo-docs}?
    |  +---w input
    |  |  +---w elementName          ct:element-name
    |  |  +---w elementFamily        ct:element-family
    |  |  +---w elementVendor        ct:element-vendor
    |  |  +---w elementModel         ct:element-model
    |  |  +---w primaryMacAddress    ct:mac-address
    |  |  +---w groupId?             string
    |  |  +---w description?         string
    |  |  +---w location?            string
    |  |  +---w gpsLocation?         ct:location-decimal-degrees-type
    |  |  +---w ipv4Address?         inet:ipv4-address
    |  |  +---w ipv6Address?         inet:ipv6-address
    |  |  +---w trafficTypes* [trafficType]
    |  |  |  +---w trafficType    ct:element-traffic-types
    |  |  +---w vendorClasses* [vendorClass]
    |  |  |  +---w vendorClass    ct:element-vendor-classes
    |  |  +---w mgmtConfig
    |  |  |  +---w username?       string
    |  |  |  +---w password?       string
    |  |  |  +---w ipAddress?      inet:ip-address
    |  |  |  +---w protocol?       ct:element-management-protocol
    |  |  |  +---w sshPublicKey?   string
    |  |  |  +---w port?           uint16
    |  |  |  +---w snmpV2Public?   ct:snmp-community-name
    |  |  +---w assetId?             string
    |  |  +---w deviceAlias?         string
    |  |  +---w serialNumber?        string
    |  |  +---w operationalMode?     ct:rxd-operational-mode
    |  |  +---w intraNodeCabling?    ct:rxd-operational-mode
    |  |  +---w licenseConfig
    |  |  |  +---w lawfulIntercept?   boolean
    |  |  |  +---w calea?             boolean
    |  |  |  +---w laes?              boolean
    |  |  |  +---w downstream
    |  |  |  |  +---w serviceGroupCnt?   uint8
    |  |  |  |  +---w enterprise?        boolean
    |  |  |  |  +---w eneterpriseCnt?    uint8
    |  |  |  |  +---w docsisDS30aCnt?    uint16
    |  |  |  |  +---w docsisDS30bCnt?    uint16
    |  |  |  |  +---w docsisDSOfdmCnt?   uint16
    |  |  |  +---w upstream
    |  |  |     +---w serviceGroupCnt?    uint8
    |  |  |     +---w enterprise?         boolean
    |  |  |     +---w eneterpriseCnt?     uint8
    |  |  |     +---w docsisDS30bCnt?     uint8
    |  |  |     +---w docsisDSOfdmaCnt?   uint16
    |  |  +---w onboarding
    |  |  |  +---w onboarded?         boolean
    |  |  |  +---w ssdIdentifier?     string
    |  |  |  +---w softwareVersion?   string
    |  |  |  +---w time?              yang:date-and-time
    |  |  +---w auxCore
    |  |  |  +---w auxCoreId?      string
    |  |  |  +---w gcpIpAddress?   inet:ip-address
    |  |  +---w softwareVersion?     string
    |  |  +---w startupTemplate?     string
    |  |  +---w securityTemplate?    string
    |  |  +---w useLag?              boolean
    |  |  +---w annex?               ct:docsis-annex-type
    |  +--ro output
    |     +--ro (response)?
    |        +--:(success)
    |        |  +--ro elementId            yang:uuid
    |        |  +--ro elementName          ct:element-name
    |        |  +--ro elementFamily        ct:element-family
    |        |  +--ro elementVendor        ct:element-vendor
    |        |  +--ro elementModel         ct:element-model
    |        |  +--ro primaryMacAddress    ct:mac-address
    |        |  +--ro groupId?             string
    |        |  +--ro description?         string
    |        |  +--ro location?            string
    |        |  +--ro gpsLocation?         ct:location-decimal-degrees-type
    |        |  +--ro ipv4Address?         inet:ipv4-address
    |        |  +--ro ipv6Address?         inet:ipv6-address
    |        |  +--ro trafficTypes* [trafficType]
    |        |  |  +--ro trafficType    ct:element-traffic-types
    |        |  +--ro vendorClasses* [vendorClass]
    |        |  |  +--ro vendorClass    ct:element-vendor-classes
    |        |  +--ro mgmtConfig
    |        |  |  +--ro username?       string
    |        |  |  +--ro password?       string
    |        |  |  +--ro ipAddress?      inet:ip-address
    |        |  |  +--ro protocol?       ct:element-management-protocol
    |        |  |  +--ro sshPublicKey?   string
    |        |  |  +--ro port?           uint16
    |        |  |  +--ro snmpV2Public?   ct:snmp-community-name
    |        |  +--ro assetId?             string
    |        |  +--ro deviceAlias?         string
    |        |  +--ro serialNumber?        string
    |        |  +--ro operationalMode?     ct:rxd-operational-mode
    |        |  +--ro intraNodeCabling?    ct:rxd-operational-mode
    |        |  +--ro licenseConfig
    |        |  |  +--ro lawfulIntercept?   boolean
    |        |  |  +--ro calea?             boolean
    |        |  |  +--ro laes?              boolean
    |        |  |  +--ro downstream
    |        |  |  |  +--ro serviceGroupCnt?   uint8
    |        |  |  |  +--ro enterprise?        boolean
    |        |  |  |  +--ro eneterpriseCnt?    uint8
    |        |  |  |  +--ro docsisDS30aCnt?    uint16
    |        |  |  |  +--ro docsisDS30bCnt?    uint16
    |        |  |  |  +--ro docsisDSOfdmCnt?   uint16
    |        |  |  +--ro upstream
    |        |  |     +--ro serviceGroupCnt?    uint8
    |        |  |     +--ro enterprise?         boolean
    |        |  |     +--ro eneterpriseCnt?     uint8
    |        |  |     +--ro docsisDS30bCnt?     uint8
    |        |  |     +--ro docsisDSOfdmaCnt?   uint16
    |        |  +--ro onboarding
    |        |  |  +--ro onboarded?         boolean
    |        |  |  +--ro ssdIdentifier?     string
    |        |  |  +--ro softwareVersion?   string
    |        |  |  +--ro time?              yang:date-and-time
    |        |  +--ro auxCore
    |        |  |  +--ro auxCoreId?      string
    |        |  |  +--ro gcpIpAddress?   inet:ip-address
    |        |  +--ro softwareVersion?     string
    |        |  +--ro startupTemplate?     string
    |        |  +--ro securityTemplate?    string
    |        |  +--ro useLag?              boolean
    |        |  +--ro annex?               ct:docsis-annex-type
    |        +--:(error-bad-request)
    |        |  +--ro badRequest?          string
    |        |  +--ro error_list*          string
    |        +--:(error-unauthorized)
    |        +--:(error-conflict)
    |           +--ro conflict?            string
    +---x controller-retrieve-devices {chd:sdnc-halo-docs}?
    |  +---w input
    |  |  +---w elementFamily?   ct:element-family
    |  |  +---w elementVendor?   ct:element-vendor
    |  |  +---w elementModel?    ct:element-model
    |  |  +---w elementName?     ct:element-name
    |  |  +---w fields?          union
    |  +--ro output
    |     +--ro (response)?
    |        +--:(success)
    |        |  +--ro elementId            yang:uuid
    |        |  +--ro elementName          ct:element-name
    |        |  +--ro elementFamily        ct:element-family
    |        |  +--ro elementVendor        ct:element-vendor
    |        |  +--ro elementModel         ct:element-model
    |        |  +--ro primaryMacAddress    ct:mac-address
    |        |  +--ro groupId?             string
    |        |  +--ro description?         string
    |        |  +--ro location?            string
    |        |  +--ro gpsLocation?         ct:location-decimal-degrees-type
    |        |  +--ro ipv4Address?         inet:ipv4-address
    |        |  +--ro ipv6Address?         inet:ipv6-address
    |        |  +--ro trafficTypes* [trafficType]
    |        |  |  +--ro trafficType    ct:element-traffic-types
    |        |  +--ro vendorClasses* [vendorClass]
    |        |  |  +--ro vendorClass    ct:element-vendor-classes
    |        |  +--ro mgmtConfig
    |        |  |  +--ro username?       string
    |        |  |  +--ro password?       string
    |        |  |  +--ro ipAddress?      inet:ip-address
    |        |  |  +--ro protocol?       ct:element-management-protocol
    |        |  |  +--ro sshPublicKey?   string
    |        |  |  +--ro port?           uint16
    |        |  |  +--ro snmpV2Public?   ct:snmp-community-name
    |        |  +--ro assetId?             string
    |        |  +--ro deviceAlias?         string
    |        |  +--ro serialNumber?        string
    |        |  +--ro operationalMode?     ct:rxd-operational-mode
    |        |  +--ro intraNodeCabling?    ct:rxd-operational-mode
    |        |  +--ro licenseConfig
    |        |  |  +--ro lawfulIntercept?   boolean
    |        |  |  +--ro calea?             boolean
    |        |  |  +--ro laes?              boolean
    |        |  |  +--ro downstream
    |        |  |  |  +--ro serviceGroupCnt?   uint8
    |        |  |  |  +--ro enterprise?        boolean
    |        |  |  |  +--ro eneterpriseCnt?    uint8
    |        |  |  |  +--ro docsisDS30aCnt?    uint16
    |        |  |  |  +--ro docsisDS30bCnt?    uint16
    |        |  |  |  +--ro docsisDSOfdmCnt?   uint16
    |        |  |  +--ro upstream
    |        |  |     +--ro serviceGroupCnt?    uint8
    |        |  |     +--ro enterprise?         boolean
    |        |  |     +--ro eneterpriseCnt?     uint8
    |        |  |     +--ro docsisDS30bCnt?     uint8
    |        |  |     +--ro docsisDSOfdmaCnt?   uint16
    |        |  +--ro onboarding
    |        |  |  +--ro onboarded?         boolean
    |        |  |  +--ro ssdIdentifier?     string
    |        |  |  +--ro softwareVersion?   string
    |        |  |  +--ro time?              yang:date-and-time
    |        |  +--ro auxCore
    |        |  |  +--ro auxCoreId?      string
    |        |  |  +--ro gcpIpAddress?   inet:ip-address
    |        |  +--ro softwareVersion?     string
    |        |  +--ro startupTemplate?     string
    |        |  +--ro securityTemplate?    string
    |        |  +--ro useLag?              boolean
    |        |  +--ro annex?               ct:docsis-annex-type
    |        +--:(error-unauthorized)
    +---x controller-get-device {chd:sdnc-halo-docs}?
    |  +---w input
    |  |  +---w elementId    yang:uuid
    |  +--ro output
    |     +--ro (response)?
    |        +--:(success)
    |        |  +--ro elementId            yang:uuid
    |        |  +--ro elementName          ct:element-name
    |        |  +--ro elementFamily        ct:element-family
    |        |  +--ro elementVendor        ct:element-vendor
    |        |  +--ro elementModel         ct:element-model
    |        |  +--ro primaryMacAddress    ct:mac-address
    |        |  +--ro groupId?             string
    |        |  +--ro description?         string
    |        |  +--ro location?            string
    |        |  +--ro gpsLocation?         ct:location-decimal-degrees-type
    |        |  +--ro ipv4Address?         inet:ipv4-address
    |        |  +--ro ipv6Address?         inet:ipv6-address
    |        |  +--ro trafficTypes* [trafficType]
    |        |  |  +--ro trafficType    ct:element-traffic-types
    |        |  +--ro vendorClasses* [vendorClass]
    |        |  |  +--ro vendorClass    ct:element-vendor-classes
    |        |  +--ro mgmtConfig
    |        |  |  +--ro username?       string
    |        |  |  +--ro password?       string
    |        |  |  +--ro ipAddress?      inet:ip-address
    |        |  |  +--ro protocol?       ct:element-management-protocol
    |        |  |  +--ro sshPublicKey?   string
    |        |  |  +--ro port?           uint16
    |        |  |  +--ro snmpV2Public?   ct:snmp-community-name
    |        |  +--ro assetId?             string
    |        |  +--ro deviceAlias?         string
    |        |  +--ro serialNumber?        string
    |        |  +--ro operationalMode?     ct:rxd-operational-mode
    |        |  +--ro intraNodeCabling?    ct:rxd-operational-mode
    |        |  +--ro licenseConfig
    |        |  |  +--ro lawfulIntercept?   boolean
    |        |  |  +--ro calea?             boolean
    |        |  |  +--ro laes?              boolean
    |        |  |  +--ro downstream
    |        |  |  |  +--ro serviceGroupCnt?   uint8
    |        |  |  |  +--ro enterprise?        boolean
    |        |  |  |  +--ro eneterpriseCnt?    uint8
    |        |  |  |  +--ro docsisDS30aCnt?    uint16
    |        |  |  |  +--ro docsisDS30bCnt?    uint16
    |        |  |  |  +--ro docsisDSOfdmCnt?   uint16
    |        |  |  +--ro upstream
    |        |  |     +--ro serviceGroupCnt?    uint8
    |        |  |     +--ro enterprise?         boolean
    |        |  |     +--ro eneterpriseCnt?     uint8
    |        |  |     +--ro docsisDS30bCnt?     uint8
    |        |  |     +--ro docsisDSOfdmaCnt?   uint16
    |        |  +--ro onboarding
    |        |  |  +--ro onboarded?         boolean
    |        |  |  +--ro ssdIdentifier?     string
    |        |  |  +--ro softwareVersion?   string
    |        |  |  +--ro time?              yang:date-and-time
    |        |  +--ro auxCore
    |        |  |  +--ro auxCoreId?      string
    |        |  |  +--ro gcpIpAddress?   inet:ip-address
    |        |  +--ro softwareVersion?     string
    |        |  +--ro startupTemplate?     string
    |        |  +--ro securityTemplate?    string
    |        |  +--ro useLag?              boolean
    |        |  +--ro annex?               ct:docsis-annex-type
    |        +--:(error-unauthorized)
    |        +--:(error-not-found)
    |           +--ro notFound?            string
    +---x controller-update-device {chd:sdnc-halo-docs}?
    |  +---w input
    |  |  +---w elementId            yang:uuid
    |  |  +---w elementName          ct:element-name
    |  |  +---w elementFamily        ct:element-family
    |  |  +---w elementVendor        ct:element-vendor
    |  |  +---w elementModel         ct:element-model
    |  |  +---w primaryMacAddress    ct:mac-address
    |  |  +---w groupId?             string
    |  |  +---w description?         string
    |  |  +---w location?            string
    |  |  +---w gpsLocation?         ct:location-decimal-degrees-type
    |  |  +---w ipv4Address?         inet:ipv4-address
    |  |  +---w ipv6Address?         inet:ipv6-address
    |  |  +---w trafficTypes* [trafficType]
    |  |  |  +---w trafficType    ct:element-traffic-types
    |  |  +---w vendorClasses* [vendorClass]
    |  |  |  +---w vendorClass    ct:element-vendor-classes
    |  |  +---w mgmtConfig
    |  |  |  +---w username?       string
    |  |  |  +---w password?       string
    |  |  |  +---w ipAddress?      inet:ip-address
    |  |  |  +---w protocol?       ct:element-management-protocol
    |  |  |  +---w sshPublicKey?   string
    |  |  |  +---w port?           uint16
    |  |  |  +---w snmpV2Public?   ct:snmp-community-name
    |  |  +---w assetId?             string
    |  |  +---w deviceAlias?         string
    |  |  +---w serialNumber?        string
    |  |  +---w operationalMode?     ct:rxd-operational-mode
    |  |  +---w intraNodeCabling?    ct:rxd-operational-mode
    |  |  +---w licenseConfig
    |  |  |  +---w lawfulIntercept?   boolean
    |  |  |  +---w calea?             boolean
    |  |  |  +---w laes?              boolean
    |  |  |  +---w downstream
    |  |  |  |  +---w serviceGroupCnt?   uint8
    |  |  |  |  +---w enterprise?        boolean
    |  |  |  |  +---w eneterpriseCnt?    uint8
    |  |  |  |  +---w docsisDS30aCnt?    uint16
    |  |  |  |  +---w docsisDS30bCnt?    uint16
    |  |  |  |  +---w docsisDSOfdmCnt?   uint16
    |  |  |  +---w upstream
    |  |  |     +---w serviceGroupCnt?    uint8
    |  |  |     +---w enterprise?         boolean
    |  |  |     +---w eneterpriseCnt?     uint8
    |  |  |     +---w docsisDS30bCnt?     uint8
    |  |  |     +---w docsisDSOfdmaCnt?   uint16
    |  |  +---w onboarding
    |  |  |  +---w onboarded?         boolean
    |  |  |  +---w ssdIdentifier?     string
    |  |  |  +---w softwareVersion?   string
    |  |  |  +---w time?              yang:date-and-time
    |  |  +---w auxCore
    |  |  |  +---w auxCoreId?      string
    |  |  |  +---w gcpIpAddress?   inet:ip-address
    |  |  +---w softwareVersion?     string
    |  |  +---w startupTemplate?     string
    |  |  +---w securityTemplate?    string
    |  |  +---w useLag?              boolean
    |  |  +---w annex?               ct:docsis-annex-type
    |  +--ro output
    |     +--ro (response)?
    |        +--:(success)
    |        +--:(error-bad-request)
    |        |  +--ro badRequest?   string
    |        |  +--ro error_list*   string
    |        +--:(error-unauthorized)
    |        +--:(error-not-found)
    |           +--ro notFound?     string
    +---x controller-delete-device {chd:sdnc-halo-docs}?
    |  +---w input
    |  |  +---w elementId    yang:uuid
    |  +--ro output
    |     +--ro (response)?
    |        +--:(success)
    |        +--:(error-unauthorized)
    |        +--:(error-not-found)
    |           +--ro notFound?   string
    +---x controller-get-device-interfaces-ethernet {chd:sdnc-halo-docs}?
    |  +---w input
    |  |  +---w elementId    yang:uuid
    |  +--ro output
    |     +--ro (response)?
    |        +--:(success)
    |        |  +--ro ethernets* [_id]
    |        |     +--ro _id            string
    |        |     +--ro name           string
    |        |     +--ro templateId?    string
    |        |     +--ro ipAddress?     inet:ip-address
    |        |     +--ro subnetMask?    ct:ipv4-subnet-mask
    |        |     +--ro ipv6Address?   inet:ipv6-address
    |        |     +--ro ipv6Prefix?    inet:ipv6-prefix
    |        |     +--ro description?   string
    |        |     +--ro vlanId?        ct:ip-vlan-id
    |        +--:(error-unauthorized)
    |        +--:(error-not-found)
    |           +--ro notFound?    string
    +---x controller-create-device-interfaces-ethernet {chd:sdnc-halo-docs}?
    |  +---w input
    |  |  +---w elementId      yang:uuid
    |  |  +---w ifId           string
    |  |  +---w name           string
    |  |  +---w templateId?    string
    |  |  +---w ipAddress?     inet:ip-address
    |  |  +---w subnetMask?    ct:ipv4-subnet-mask
    |  |  +---w ipv6Address?   inet:ipv6-address
    |  |  +---w ipv6Prefix?    inet:ipv6-prefix
    |  |  +---w description?   string
    |  |  +---w vlanId?        ct:ip-vlan-id
    |  +--ro output
    |     +--ro (response)?
    |        +--:(success)
    |        |  +--ro _id            string
    |        |  +--ro name           string
    |        |  +--ro templateId?    string
    |        |  +--ro ipAddress?     inet:ip-address
    |        |  +--ro subnetMask?    ct:ipv4-subnet-mask
    |        |  +--ro ipv6Address?   inet:ipv6-address
    |        |  +--ro ipv6Prefix?    inet:ipv6-prefix
    |        |  +--ro description?   string
    |        |  +--ro vlanId?        ct:ip-vlan-id
    |        +--:(error-bad-request)
    |        |  +--ro badRequest?    string
    |        |  +--ro error_list*    string
    |        +--:(error-unauthorized)
    |        +--:(error-not-found)
    |           +--ro notFound?      string
    +---x controller-get-device-interface-ethernet {chd:sdnc-halo-docs}?
    |  +---w input
    |  |  +---w elementId    yang:uuid
    |  |  +---w ifId         string
    |  +--ro output
    |     +--ro (response)?
    |        +--:(success)
    |        |  +--ro _id            string
    |        |  +--ro name           string
    |        |  +--ro templateId?    string
    |        |  +--ro ipAddress?     inet:ip-address
    |        |  +--ro subnetMask?    ct:ipv4-subnet-mask
    |        |  +--ro ipv6Address?   inet:ipv6-address
    |        |  +--ro ipv6Prefix?    inet:ipv6-prefix
    |        |  +--ro description?   string
    |        |  +--ro vlanId?        ct:ip-vlan-id
    |        +--:(error-bad-request)
    |        |  +--ro badRequest?    string
    |        |  +--ro error_list*    string
    |        +--:(error-unauthorized)
    |        +--:(error-not-found)
    |           +--ro notFound?      string
    +---x controller-update-device-interface-ethernet {chd:sdnc-halo-docs}?
    |  +---w input
    |  |  +---w elementId    yang:uuid
    |  |  +---w ifId         string
    |  +--ro output
    |     +--ro (response)?
    |        +--:(success)
    |        |  +--ro _id            string
    |        |  +--ro name           string
    |        |  +--ro templateId?    string
    |        |  +--ro ipAddress?     inet:ip-address
    |        |  +--ro subnetMask?    ct:ipv4-subnet-mask
    |        |  +--ro ipv6Address?   inet:ipv6-address
    |        |  +--ro ipv6Prefix?    inet:ipv6-prefix
    |        |  +--ro description?   string
    |        |  +--ro vlanId?        ct:ip-vlan-id
    |        +--:(error-bad-request)
    |        |  +--ro badRequest?    string
    |        |  +--ro error_list*    string
    |        +--:(error-unauthorized)
    |        +--:(error-not-found)
    |           +--ro notFound?      string
    +---x controller-delete-device-interface-ethernet {chd:sdnc-halo-docs}?
       +---w input
       |  +---w elementId    yang:uuid
       |  +---w ifId         string
       +--ro output
          +--ro (response)?
             +--:(success)
             +--:(error-unauthorized)
             +--:(error-not-found)
                +--ro notFound?   string
```

### YANG Dependencies

```
 sdnc-types ietf-yang-types ietf-inet-types
```
