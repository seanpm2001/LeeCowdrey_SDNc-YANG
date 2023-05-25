```
module: sdnc-pubsub

  augment /c:sdnc:
    +--rw pubsub {c:sdnc}?
       +--rw kafka
       |  +--rw brokers* [host port]
       |     +--rw host                                    inet:host
       |     +--rw port                                    inet:port-number
       |     +---x unregister
       |     +--rw client-id?                              string
       |     +--rw retries                                 uint8
       |     +--rw retry-delay?                            uint64
       |     +--rw username?                               string
       |     +--rw password?                               string
       |     +--rw security-protocol?                      enumeration
       |     +--rw acks?                                   enumeration
       |     +--rw linger?                                 uint64
       |     +--rw batch-size?                             uint64
       |     +--rw buffer-memory?                          uint64
       |     +--rw max-request-size?                       uint64
       |     +--rw max-inflight-requests-per-connection?   uint8
       |     +--rw compression-method?                     enumeration
       +--rw listener
       |  +--rw notifications* [yang-notification]
       |     +--rw yang-notification    string
       |     +---x unlisten
       +--rw subscriptions
          +--rw subscription* [yang-notification]
             +--rw yang-notification    -> ../../../listener/notifications/yang-notification
             +--rw consumers* [endpoint]
                +--rw endpoint       inet:uri
                +---x unsubscribe
                +--rw options
                   +--rw retries              uint8
                   +--rw retry-delay          uint64
                   +--ro life-retries?        uint8
                   +--rw max-life-retries?    uint8
                   +--rw username?            string
                   +--rw password?            string
                   +--rw security-protocol    enumeration

  rpcs:
    +---x listen {c:sdnc}?
    |  +---w input
    |     +---w yang-notification*   string
    +---x publish {c:sdnc}?
    |  +---w input
    |     +---w yang-notification    string
    |     +---w data                 string
    +---x subscribe {c:sdnc}?
    |  +---w input
    |     +---w subscriptions* [yang-notification]
    |     |  +---w yang-notification    string
    |     |  +---w endpoint             inet:uri
    |     +---w retries?             uint8
    |     +---w retry-delay?         uint64
    |     +---w max-life-retries?    uint8
    |     +---w username?            string
    |     +---w password?            string
    |     +---w security-protocol?   enumeration
    +---x kafka-broker-register
       +---w input
          +---w brokers* [host port]
             +---w host                                    inet:host
             +---w port                                    inet:port-number
             +---w client-id?                              string
             +---w retries?                                uint8
             +---w retry-delay?                            uint64
             +---w username?                               string
             +---w password?                               string
             +---w security-protocol?                      enumeration
             +---w acks?                                   enumeration
             +---w linger?                                 uint64
             +---w batch-size?                             uint64
             +---w buffer-memory?                          uint64
             +---w max-request-size?                       uint64
             +---w max-inflight-requests-per-connection?   uint8
             +---w compression-method?                     enumeration
```

### YANG Dependencies

```
 sdnc ietf-inet-types
```
