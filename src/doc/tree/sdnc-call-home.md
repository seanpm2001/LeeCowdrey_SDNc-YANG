```
module: sdnc-call-home

  augment /c:sdnc:
    +--rw call-home {c:sdnc}?
       +--rw credentials
       |  +--rw username?    string
       |  +---x remove
       |  +--rw passwords* [password]
       |     +--rw password    string
       |     +---x delete
       +--rw ssh
       |  +--rw ssh-host-keys
       |     +--rw ignore?   boolean
       +--rw tls
          +--rw certificates* [id]
             +--rw id             string
             +--rw category       ct:tls-certificate-type
             +--rw certificate    string
             +--rw passphrase?    string
             +---x revoke

  rpcs:
    +---x set-global-credentials {cch:sdnc-call-home}?
    |  +---w input
    |     +---w username     string
    |     +---w passwords* [password]
    |        +---w password    string
    +---x add-global-credential-passwords {cch:sdnc-call-home}?
    |  +---w input
    |     +---w username     -> /c:sdnc/cch:call-home/credentials/username
    |     +---w passwords* [password]
    |        +---w password    string
    +---x ignore-ssh-host-keys {cch:sdnc-call-home}?
    |  +---w input
    |     +---w ignore    boolean
    +---x set-tls-passphrase {cch:sdnc-call-home}?
    |  +---w input
    |     +---w key-id?       -> /c:sdnc/cch:call-home/tls/certificates/id
    |     +---w passphrase    string
    +---x add-tls-certificate {cch:sdnc-call-home}?
       +---w input
          +---w id             string
          +---w category       ct:tls-certificate-type
          +---w certificate    string
          +---w passphrase?    string
```

### YANG Dependencies

```
 sdnc sdnc-types
```
