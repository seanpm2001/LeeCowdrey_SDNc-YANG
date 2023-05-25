```
module: sdnc-swagger

  augment /c:sdnc:
    +--rw swagger {c:sdnc}?
       +--rw openapi
       |  +--rw version?   string
       +--rw info
       |  +--rw title?         string
       |  +--rw version?       string
       |  +--rw description?   string
       |  +--rw contact
       |     +--rw name?    string
       |     +--rw email?   ct:email-address
       +--rw server
       |  +--rw servers* [url]
       |     +--rw url            inet:uri
       |     +--rw description?   string
       +--rw components
       |  +--rw schemas* [ref-name]
       |  |  +--rw ref-name    string
       |  |  +--rw schema
       |  |     +--rw type?           enumeration
       |  |     +--rw string
       |  |     |  +--rw format?    enumeration
       |  |     |  +--rw default?   string
       |  |     +--rw number
       |  |     |  +--rw format?    enumeration
       |  |     |  +--rw minimum?   decimal64
       |  |     |  +--rw maximum?   decimal64
       |  |     |  +--rw default?   decimal64
       |  |     +--rw integer
       |  |     |  +--rw format?    enumeration
       |  |     |  +--rw minimum?   uint64
       |  |     |  +--rw maximum?   uint64
       |  |     |  +--rw default?   uint64
       |  |     +--rw ref?            string
       |  |     +--rw list-of
       |  |     |  +--rw ofs* [ref]
       |  |     |     +--rw ref    string
       |  |     +--rw callback-url?   inet:uri
       |  |     +--rw property
       |  |        +--rw properties* [property-name]
       |  |           +--rw property-name    string
       |  |           +--rw type?            enumeration
       |  |           +--rw string
       |  |           |  +--rw format?    enumeration
       |  |           |  +--rw default?   string
       |  |           +--rw number
       |  |           |  +--rw format?    enumeration
       |  |           |  +--rw minimum?   decimal64
       |  |           |  +--rw maximum?   decimal64
       |  |           |  +--rw default?   decimal64
       |  |           +--rw integer
       |  |           |  +--rw format?    enumeration
       |  |           |  +--rw minimum?   uint64
       |  |           |  +--rw maximum?   uint64
       |  |           |  +--rw default?   uint64
       |  |           +--rw ref?             string
       |  +--rw security
       |     +--rw type?               enumeration
       |     +--rw http-basic-auth
       |     |  +--rw auth-name?   string
       |     |  +--rw type?        enumeration
       |     |  +--rw schema?      enumeration
       |     +--rw http-bearer-auth
       |        +--rw auth-name?   string
       |        +--rw type?        enumeration
       |        +--rw schema?      enumeration
       |        +--rw format?      string
       +--rw path
          +--rw paths* [path]
             +--rw path         string
             +--rw endpoints* [method]
                +--rw method          enumeration
                +--rw summary?        string
                +--rw description?    string
                +--rw request-body
                |  +--rw description?   string
                |  +--rw required?      boolean
                |  +--rw content
                |     +--rw mime-type?   string
                |     +--rw schema
                |        +--rw type?                enumeration
                |        +--rw string
                |        |  +--rw format?    enumeration
                |        |  +--rw default?   string
                |        +--rw number
                |        |  +--rw format?    enumeration
                |        |  +--rw minimum?   decimal64
                |        |  +--rw maximum?   decimal64
                |        |  +--rw default?   decimal64
                |        +--rw integer
                |        |  +--rw format?    enumeration
                |        |  +--rw minimum?   uint64
                |        |  +--rw maximum?   uint64
                |        |  +--rw default?   uint64
                |        +--rw ref?                 string
                |        +--rw list-of
                |        |  +--rw ofs* [ref]
                |        |     +--rw ref    string
                |        +--rw callback-url?        inet:uri
                |        +--rw property
                |        |  +--rw properties* [property-name]
                |        |     +--rw property-name    string
                |        |     +--rw type?            enumeration
                |        |     +--rw string
                |        |     |  +--rw format?    enumeration
                |        |     |  +--rw default?   string
                |        |     +--rw number
                |        |     |  +--rw format?    enumeration
                |        |     |  +--rw minimum?   decimal64
                |        |     |  +--rw maximum?   decimal64
                |        |     |  +--rw default?   decimal64
                |        |     +--rw integer
                |        |     |  +--rw format?    enumeration
                |        |     |  +--rw minimum?   uint64
                |        |     |  +--rw maximum?   uint64
                |        |     |  +--rw default?   uint64
                |        |     +--rw ref?             string
                |        +--rw request-property
                |        |  +--rw properties* [property-name]
                |        |     +--rw property-name    string
                |        |     +--rw type?            enumeration
                |        |     +--rw string
                |        |     |  +--rw format?    enumeration
                |        |     |  +--rw default?   string
                |        |     +--rw number
                |        |     |  +--rw format?    enumeration
                |        |     |  +--rw minimum?   decimal64
                |        |     |  +--rw maximum?   decimal64
                |        |     |  +--rw default?   decimal64
                |        |     +--rw integer
                |        |     |  +--rw format?    enumeration
                |        |     |  +--rw minimum?   uint64
                |        |     |  +--rw maximum?   uint64
                |        |     |  +--rw default?   uint64
                |        |     +--rw ref?             string
                |        |     +--rw list-of
                |        |     |  +--rw ofs* [ref]
                |        |     |     +--rw ref    string
                |        |     +--rw callback-url?    inet:uri
                |        |     +--rw property
                |        |        +--rw properties* [property-name]
                |        |           +--rw property-name    string
                |        |           +--rw type?            enumeration
                |        |           +--rw string
                |        |           |  +--rw format?    enumeration
                |        |           |  +--rw default?   string
                |        |           +--rw number
                |        |           |  +--rw format?    enumeration
                |        |           |  +--rw minimum?   decimal64
                |        |           |  +--rw maximum?   decimal64
                |        |           |  +--rw default?   decimal64
                |        |           +--rw integer
                |        |           |  +--rw format?    enumeration
                |        |           |  +--rw minimum?   uint64
                |        |           |  +--rw maximum?   uint64
                |        |           |  +--rw default?   uint64
                |        |           +--rw ref?             string
                |        +--rw required-property
                |           +--rw properties* [property-name]
                |              +--rw property-name    string
                +--rw response
                   +--rw responses* [code]
                      +--rw code           union
                      +--rw description?   string
                      +--rw content
                         +--rw mime-type?   string
                         +--rw schema
                            +--rw type?                enumeration
                            +--rw string
                            |  +--rw format?    enumeration
                            |  +--rw default?   string
                            +--rw number
                            |  +--rw format?    enumeration
                            |  +--rw minimum?   decimal64
                            |  +--rw maximum?   decimal64
                            |  +--rw default?   decimal64
                            +--rw integer
                            |  +--rw format?    enumeration
                            |  +--rw minimum?   uint64
                            |  +--rw maximum?   uint64
                            |  +--rw default?   uint64
                            +--rw ref?                 string
                            +--rw list-of
                            |  +--rw ofs* [ref]
                            |     +--rw ref    string
                            +--rw callback-url?        inet:uri
                            +--rw property
                            |  +--rw properties* [property-name]
                            |     +--rw property-name    string
                            |     +--rw type?            enumeration
                            |     +--rw string
                            |     |  +--rw format?    enumeration
                            |     |  +--rw default?   string
                            |     +--rw number
                            |     |  +--rw format?    enumeration
                            |     |  +--rw minimum?   decimal64
                            |     |  +--rw maximum?   decimal64
                            |     |  +--rw default?   decimal64
                            |     +--rw integer
                            |     |  +--rw format?    enumeration
                            |     |  +--rw minimum?   uint64
                            |     |  +--rw maximum?   uint64
                            |     |  +--rw default?   uint64
                            |     +--rw ref?             string
                            +--rw response-property
                               +--rw properties* [property-name]
                                  +--rw property-name    string
                                  +--rw type?            enumeration
                                  +--rw string
                                  |  +--rw format?    enumeration
                                  |  +--rw default?   string
                                  +--rw number
                                  |  +--rw format?    enumeration
                                  |  +--rw minimum?   decimal64
                                  |  +--rw maximum?   decimal64
                                  |  +--rw default?   decimal64
                                  +--rw integer
                                  |  +--rw format?    enumeration
                                  |  +--rw minimum?   uint64
                                  |  +--rw maximum?   uint64
                                  |  +--rw default?   uint64
                                  +--rw ref?             string
                                  +--rw list-of
                                  |  +--rw ofs* [ref]
                                  |     +--rw ref    string
                                  +--rw property
                                     +--rw properties* [property-name]
                                        +--rw property-name    string
                                        +--rw type?            enumeration
                                        +--rw string
                                        |  +--rw format?    enumeration
                                        |  +--rw default?   string
                                        +--rw number
                                        |  +--rw format?    enumeration
                                        |  +--rw minimum?   decimal64
                                        |  +--rw maximum?   decimal64
                                        |  +--rw default?   decimal64
                                        +--rw integer
                                        |  +--rw format?    enumeration
                                        |  +--rw minimum?   uint64
                                        |  +--rw maximum?   uint64
                                        |  +--rw default?   uint64
                                        +--rw ref?             string
```

### YANG Dependencies

```
 sdnc sdnc-types ietf-inet-types
```
