```
module: sdnc-sku

  augment /c:sdnc:
    +--rw sku {c:sdnc}?
       +--rw models* [model-namespace]
          +--rw model-namespace    ct:module-namespace
          +--rw versions* [model-revision]
             +--rw model-revision    ct:module-revision
             +--ro model-yang        string
             +--ro yang-version?     enumeration
             +--ro module-name?      string
             +--ro prefix?           string
             +--ro imports
             |  +--ro import* [module-name]
             |     +--ro module-name      string
             |     +--ro prefix?          string
             |     +--ro revision-date?   string
             |     +--ro description?     string
             |     +--ro reference?       string
             +--ro includes
             |  +--ro include* [submodule-name]
             |     +--ro submodule-name    string
             |     +--ro revision-date?    string
             |     +--ro description?      string
             |     +--ro reference?        string
             +--ro organization?     string
             +--ro contact?          string
             +--ro description?      string
             +--ro reference?        string
             +--ro submodels
             |  +--ro submodule* [submodule-name]
             |     +--ro submodule-name      string
             |     +--ro submodel-yang?      string
             |     +--ro belongs-to?         string
             |     +--ro belongs-to-xmlns?   -> ../../../../model-namespace
             |     +--ro imports
             |     |  +--ro import* [module-name]
             |     |     +--ro module-name      string
             |     |     +--ro prefix?          string
             |     |     +--ro revision-date?   string
             |     |     +--ro description?     string
             |     |     +--ro reference?       string
             |     +--ro organization?       string
             |     +--ro contact?            string
             |     +--ro description?        string
             |     +--ro reference?          string
             +--ro properties
                +--ro product
                |  +--ro vendor?         string
                |  +--ro model-family?   string
                |  +--ro model-type?     string
                +--ro firmware
                |  +--ro revisions* [name]
                |     +--ro name       string
                |     +--ro version?   string
                +--ro factory-credentials
                |  +--ro username?          string
                |  +--ro password?          string
                |  +--ro enable-username?   string
                |  +--ro enable-password?   string
                +--ro cli-helpers
                   +--ro config-erase-cli?            string
                   +--ro config-reset-cli?            string
                   +--ro config-save-to-memory-cli?   string
                   +--ro config-copy-to-remote?       string
                   +--ro config-remote-endpoint?      inet:uri
                   +--ro ssh-idle-cli?                string
                   +--ro ssh-idle-timeout-duration?   uint64

  rpcs:
    +---x list-model-revision-by-vendor {c:sdnc,cs:sdnc-sku}?
    |  +---w input
    |  |  +---w sku-vendor    string
    |  +--ro output
    |     +--ro models-revisions* [model-namespace model-revision]
    |        +--ro model-namespace    -> /c:sdnc/cs:sku/models/model-namespace
    |        +--ro model-revision     -> /c:sdnc/cs:sku/models/versions/model-revision
    +---x list-model-revision-by-vendor-model-family {c:sdnc,cs:sdnc-sku}?
    |  +---w input
    |  |  +---w sku-vendor          string
    |  |  +---w sku-model-family    string
    |  +--ro output
    |     +--ro models-revisions* [model-namespace model-revision]
    |        +--ro model-namespace    -> /c:sdnc/cs:sku/models/model-namespace
    |        +--ro model-revision     -> /c:sdnc/cs:sku/models/versions/model-revision
    +---x list-model-revision-by-vendor-model-family-type {c:sdnc,cs:sdnc-sku}?
    |  +---w input
    |  |  +---w sku-vendor          string
    |  |  +---w sku-model-family    string
    |  |  +---w sku-model-type      string
    |  +--ro output
    |     +--ro models-revisions* [model-namespace model-revision]
    |        +--ro model-namespace    -> /c:sdnc/cs:sku/models/model-namespace
    |        +--ro model-revision     -> /c:sdnc/cs:sku/models/versions/model-revision
    +---x list-model-revision-by-model-family {c:sdnc,cs:sdnc-sku}?
    |  +---w input
    |  |  +---w sku-model-family    string
    |  +--ro output
    |     +--ro models-revisions* [model-namespace model-revision]
    |        +--ro model-namespace    -> /c:sdnc/cs:sku/models/model-namespace
    |        +--ro model-revision     -> /c:sdnc/cs:sku/models/versions/model-revision
    +---x list-model-revision-by-model-family-type {c:sdnc,cs:sdnc-sku}?
       +---w input
       |  +---w sku-model-family    string
       |  +---w sku-model-type      string
       +--ro output
          +--ro models-revisions* [model-namespace model-revision]
             +--ro model-namespace    -> /c:sdnc/cs:sku/models/model-namespace
             +--ro model-revision     -> /c:sdnc/cs:sku/models/versions/model-revision
```

### YANG Dependencies

```
 sdnc sdnc-types ietf-inet-types
```
