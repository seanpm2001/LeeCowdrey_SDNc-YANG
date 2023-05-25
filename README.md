---
title: SDNc Aspects
author: Lee Cowdrey
subject: SDN Multi Domain Controller
keywords: [RESTCONF, NETCONF, YANG, CLI, lighty.io, ODL, OpenDaylight, MD-SAL, YANGtools]
---

- MD-SAL Java Modules: `com.vendor.modules.sdnc.{{...}}` i.e.
  - `com.vendor.modules.sdnc.core`
  - `com.vendor.modules.sdnc.pools`
  - `com.vendor.modules.sdnc.sku`
  - `com.vendor.modules.sdnc.yang-to-cli`
- YANG CSDM core namespaces: `urn:com:vendor:yang:sdnc:{{...}}` i.e.
  - `urn:com:vendor:yang:sdnc:extensions`
  - `urn:com:vendor:yang:sdnc:types`
- YANG namespaces for devices: `urn:com:vendor:yang:{{device-family}}:{{device-model}}` i.e.
  - `urn:com:vendor:yang:rxd:rd2322`
- pom.xml
  - groupId: `com.vendor.mdsal.{{...}}` i.e.
    - `com.vendor.mdsal.models` (for YANG bindings)
  - artifactId: `{{function}}` i.e.
    - `sdnc`
    - `yang-to-cli`
    - `sku`

## RD1322 Device Model

Work In Progress

### YANG model name

`rxd-rd1322`

### YANG namespace

`urn:com:vendor:yang:rxd:rd1322`

### YANG model prefix

`rd1322`

### YANG version

`1.1`

### YANG revision

`2020-12-04`

### Status

`Unpublished/Draft`

### YANG Model (UML)

[![](./img/devices/rxd-rd1322.png)](./img/devices/rxd-rd1322.svg)

### YANG exposed RPC's

| type | path | name |
| :--- | :--- | :--- |
|      |      |      |

### YANG tree structure

```none```

### Branches of Interest

| Path                        | Purpose               |
| :-------------------------- | :-------------------- |
| `../rd1322:config`          | device root container |
| `../rd1322:config/cli-header` |                       |
| `../rd1322:config/hardware`   |                       |
| `../rd1322:config/cli-footer` |                       |

## RD2322 Device Model

### YANG model name

`rxd-rd2322`

### YANG namespace

`urn:com:vendor:yang:rxd:rd2322`

### YANG model prefix

`rd2322`

### YANG version

`1.1`

### YANG revision

`2020-12-04`

### Status

`Unpublished/Draft`

### YANG exposed RPC's

| type | path | name |
| :--- | :--- | :--- |
|      |      |      |

### YANG Model (UML)

[![](./img/devices/rxd-rd2322.png)](./img/devcies/rxd-rd2322.svg)

### YANG tree structure

```none```

## ICX Generic Device Model

Work In Progress, expected to be required for RMD Layer 2 Bridge and External Interfaces as per RMD 2.0 release

### YANG model name

`icx-generic`

### YANG namespace

`urn:com:vendor:yang:icx:generic`

### YANG model prefix

`icx`

### YANG version

`1.1`

### YANG revision

`2021-06-01`

### Status

`Unpublished/Draft`

### YANG exposed RPC's

| type | path | name |
| :--- | :--- | :--- |
|      |      |      |

### YANG Model (UML)

[![](./img/devices/icx-generic.png)](./img/devices/icx-generic.svg)

### YANG tree structure

```none```

### Branches of Interest

| Path                      | Purpose               |
| :------------------------ | :-------------------- |
| `../icx:config`             | device root container |
| `../icx::config/cli-header` |                       |
| `../icx:config/hardware`    |                       |
| `../icx:config/interfaces`  |                       |
| `../icx:config/ip`          |                       |
| `../icx:config/vlan`        |                       |
| `../icx:config/cli-footer`  |                       |

***

# Core Models

## Root Container

### YANG model name

`sdnc`

### YANG namespace

`urn:com:vendor:yang:sdnc`

### YANG model prefix

`c`

### YANG version

`1.1`

### YANG revision

`2020-12-04`

### Status

`Unpublished/Draft`

### YANG exposed RPCs

| type | path | name |
| :--- | :--- | :--- |
| rpc  |      | about|

### YANG Model (UML)

[![](./img/sdnc.png)](./img/sdnc.svg)

### YANG Tree Structure

```none```

## Network Function

### YANG model name

`sdnc-xnf`

### YANG namespace

`urn:com:vendor:yang:sdnc-xnf`

### YANG model prefix

`cnf`

### YANG version

`1.1`

### YANG revision

`2020-12-04`

### Status

`Unpublished/Draft`

### YANG exposed RPCs

| type | path | name |
| :--- | :--- | :--- |
| rpc  |      | define |
|action|xnf/nf| undefine |
|action|xnf/nf| upgrade |
|action|xnf/nf| downgrade |

### YANG Model (UML)

[![](./img/sdnc-xnf.png)](./img/sdnc-xnf.svg)

### YANG Tree Structure

```none```

### YANG exposed RPCs

| type | path | name |
| :--- | :--- | :--- |
|      |      |      |

## Pools

### YANG model name

`sdnc-pools`

### YANG namespace

`urn:com:vendor:yang:sdnc-pools`

### YANG model prefix

`cp`

### YANG version

`1.1`

### YANG revision

`2020-12-04`

### Status

`Unpublished/Draft`

### YANG exposed RPCs

| type | path | name |
| :--- | :--- | :--- |
| rpc  |      | ipv4-block-allocate |
| rpc  |      | ipv6-block-allocate |
| rpc  |      | vrf-request |
| rpc  |      | vlan-request |
| rpc  |      | vxlan-request |
| rpc  |      | virtual-router-request |
| rpc  |      | route-target-request |
| rpc  |      | route-distinguisher-request |
| rpc  |      | autonomous-system-request |
|action| pools/address/ipv4/blocks | deallocate |
|action| pools/address/ipv4/blocks | request |
|action| pools/...| ... |

### YANG Model (UML)

[![](./img/sdnc-pools.png)](./img/sdnc-pools.svg)

### YANG Tree Structure

```none```

### YANG exposed RPCs

| type | path | name |
| :--- | :--- | :--- |
|      |      |      |

## Device SKUs

### YANG model name

`sdnc-sku`

### YANG namespace

`urn:com:vendor:yang:sdnc:sku`

### YANG model prefix

`cs`

### YANG version

`1.1`

### YANG revision

`2020-12-04`

### Status

`Unpublished/Draft`

### YANG exposed RPCs

| type | path | name |
| :--- | :--- | :--- |
| rpc  |      | register |
|action|sku/models|register-version|
|action|sku/models|unregister|
|action|sku/models/versions|unregister|

### YANG Model (UML)

[![](./img/sdnc-sku.png)](./img/sdnc-sku.svg)

### YANG Tree Structure

```none```

### YANG exposed RPCs

| type | path | name |
| :--- | :--- | :--- |
|      |      |      |

## Device SKUs

### YANG model name

`sdnc-sku`

### YANG namespace

`urn:com:vendor:yang:sdnc:sku`

### YANG model prefix

`cei`

### YANG version

`1.1`

### YANG revision

`2020-12-04`

### Status

`Unpublished/Draft`

### YANG exposed RPCs

 | type | path | name |
 | :--- | :--- | :--- |
 | rpc  |      | import |
 | rpc  |      | export |

## NETCONF Call-Home (call-home)

### YANG model name

`sdnc-call-home`

### YANG namespace

`urn:com:vendor:yang:sdnc:call-home`

### YANG model prefix

`cch`

### YANG version

`1.1`

### YANG revision

`2022-06-23`

### Status

`Unpublished/Draft`

### YANG exposed RPCs

| type | path | name |
| :--- | :--- | :--- |
|      |      |      |

### YANG Model (UML)

[![](./img/sdnc-call-home.png)](./img/sdnc-call-home.svg)

### YANG Tree Structure

```none```

## Universal License Management (ULS)

### YANG model name

`sdnc-uls`

### YANG namespace

`urn:com:vendor:yang:sdnc:uls`

### YANG model prefix

`cu`

### YANG version

`1.1`

### YANG revision

`2020-12-04`

### Status

`Unpublished/Draft`

### YANG exposed RPCs

| type | path | name |
| :--- | :--- | :--- |
|      |      |      |

### YANG Model (UML)

[![](./img/sdnc-uls.png)](./img/sdnc-uls.svg)

### YANG Tree Structure

```none```

## SNMP Security/Requests Management (SNMP)

### YANG model name

`sdncsnmp`

### YANG namespace

`urn:com:vendor:yang:sdnc:snmp`

### YANG model prefix

`css`

### YANG version

`1.1`

### YANG revision

`2020-12-04`

### Status

`Unpublished/Draft`

### YANG exposed RPCs

| type | path | name |
| :--- | :--- | :--- |
|      |      |      |

### YANG Model (UML)

[![](./img/sdncsnmp.png)](./img/sdncsnmp.svg)

### YANG Tree Structure

```none```

## Topology

### YANG model name

`sdnc-topology`

### YANG namespace

`urn:com:vendor:yang:sdnc:topology`

### YANG model prefix

`ctop`

### YANG version

`1.1`

### YANG revision

`2020-12-04`

### Status

`Unpublished/Draft`

### YANG exposed RPCs

| type | path | name |
| :--- | :--- | :--- |
| rpc  |      |is-known|
| rpc  |      |define-link|
|action|topology/links|undefine|

### YANG Model (UML)

[![](./img/sdnc-topology.png)](./img/sdnc-toplogy.svg)

### YANG Tree Structure

```none```

### YANG exposed RPCs

| type | path | name |
| :--- | :--- | :--- |
|      |      |      |

## Swagger

### YANG model name

`sdnc-swagger`

### YANG namespace

`urn:com:vendor:yang:sdnc:swagger`

### YANG model prefix

`csw`

### YANG version

`1.1`

### YANG revision

`2020-12-04`

### Status

`Unpublished/Draft`

### YANG exposed RPCs

| type | path | name |
| :--- | :--- | :--- |
|      |      |      |

### YANG Model (UML)

[![](./img/sdnc-swagger.png)](./img/sdnc-swagger.svg)

### YANG Tree Structure

```none```

## Notifications

### YANG model name

`sdnc-notifications`

### YANG namespace

`urn:com:vendor:yang:sdnc:notifications`

### YANG model prefix

`cn`

### YANG version

`1.1`

### YANG revision

`2020-12-04`

### Status

`Unpublished/Draft`

### YANG Model (UML)

[![](./img/sdnc-notifications.png)](./img/sdnc-notifications.svg)

### YANG Tree Structure

```none```

## Publish/Subscribe (PubSub)

### YANG model name

`sdnc-pubsub`

### YANG namespace

`urn:com:vendor:yang:sdnc:pubsub`

### YANG model prefix

`cps`

### YANG version

`1.1`

### YANG revision

`2020-12-04`

### Status

`Unpublished/Draft`

### YANG exposed RPCs

| type | path | name |
| :--- | :--- | :--- |
| rpc  |      | publish |
| action |    | unpublish |
| rpc  |      | subscribe |
| action |     | unsubscribe |

### YANG Model (UML)

[![](./img/sdnc-pubsub.png)](./img/sdnc-pubsub.svg)

### YANG Tree Structure

```none```

## Common Groupings

### YANG model name

`sdnc-groupings`

### YANG namespace

`urn:com:vendor:yang:sdnc:groupings`

### YANG model prefix

`cg`

### YANG version

`1.1`

### YANG revision

`2020-12-04`

### Status

`Unpublished/Draft`

### YANG exposed RPCs

| type | path | name |
| :--- | :--- | :--- |
|      |      |      |

### YANG Model (UML)

[![](./img/sdnc-groupings.png)](./img/sdnc-groupings.svg)

### YANG Tree Structure

```none```

### YANG exposed RPCs

| type | path | name |
| :--- | :--- | :--- |
|      |      |      |

## Branches of Interest

| `Path`                                                       | `Purpose`                                                    |
| :----------------------------------------------------------- | :----------------------------------------------------------- |
| `/h:sdnc`                                                    | root container                                               |
| `/h:sdnc/h:xnf`                                              | network function container                                   |
| `/h:sdnc/hnf:xnf/nf`                                         |                                                              |
| `/h:sdnc/hnf:xnf/nf/configs`                               | Managed network function container                           |
| `/h:sdnc/hnf:xnf/nf/configs/uuid`                        | Common management metadata per network function              |
| `/h:sdnc/hnf:xnf/nf/configs[uuid={{uuid}}]/{{device model prefix}}:config`             | augmentation point for instantiated network function model schemas |
| `/h:sdnc`                                           |                                                              |
| `/h:sdnc/hp:pools`                                   |                                                              |
| `/h:sdnc/hp:pools/ip/address/h:ipv4`             |                                                              |
| `/h:sdnc/hp:pools/ip/address/h:ipv6`             |                                                              |
| `/h:sdnc/hp:pools/ip/vrf`                        |                                                              |
| `/h:sdnc/hp:pools/ip/vlan`                       |                                                              |
| `/h:sdnc/hp:pools/ip/vxlan`                      |                                                              |
| `/h:sdnc/hp:pools/ip/virtual-router`             |                                                              |
| `/h:sdnc/hp:pools/ip/route-target`               |                                                              |
| `/h:sdnc/hp:pools/ip/route-distinguisher`        |                                                              |
| `/h:sdnc/hp:pools/ip/autonomous-system`          |                                                              |
| `/h:sdnc/hp:pools/docsis/channel`                |                                                              |
| `...`                                                        |                                                              |
| `/h:sdnc/hs:sku`                                     |                                                              |
| `/h:sdnc/hs:sku/models`                            |                                                              |
| `/h:sdnc/hs:sku/models/versions`                 |                                                              |
| `/h:sdnc/hs:sku/models/versions/firmware`      |                                                              |
| `/h:sdnc/hs:sku/models/versions/definition`    |                                                              |
| `/h:sdnc/hs:sku/models/versions/definiton/dhcpv4` |                                                              |
| `/h:sdnc/hs:sku/models/versions/definiton/dhcpv6` |                                                              |
| `/h:sdnc/hs:sku/models/versions/definiton/factory-credential` |                                                              |
| `/h:sdnc/hs:sku/models/versions/definiton/config-cli` |                                                              |
| `/h:sdnc/hs:sku/models/versions/definiton/ssh-idle` |                                                              |

## Generated Notifications

Notifications will be generated dynamically but defined within the CSDM core model itself; allowing interested parties can register for and consume, interested parties must maintain connection following RESTCONF RFC8040 Server-Sent Events (SSE) guidelines in order to receive. The notifications will contain minimal information, allowing subsequent direct retrieval of dense metadata from MDSAL including change|generated|delivery-timestamps, result enumerations, output from network function as CLI was applied etc. More information on SSE available at []((<http://www.w3.org/TR/2015/REC-eventsource-20150203>)

| Notification             | Usage                                                        | Content                                                      |
| :----------------------- | :----------------------------------------------------------- | :----------------------------------------------------------- |
| hnf:nf-config-change    | Generated whenever a config change request is applied to schema within MDSAL for a specific network function | instance uuidmodel-namespacemodel-versioninstance-slice uuid |
| hnf:nf-config-delivery  | Expected to generated to indicate configuration delivery status | instance uuidmodel-namespacemodel-versiontimestamp (delivery)result (enumeration) |
| hnf:nf-config-generated | Generated whenever CLI has been generated and stored within MDSAL for a specific network function | instance uuidmodel-namespacemodel-versioninstance-slice uuid |

All notifications will contain an event timestamp and will be wrapped in the appropriate NETCONF or RESTCONF notification definition; notification content can be subscribed to in either XML or JSON formats, for example:

- XML format

```xml
data: <notification
data:    xmlns="urn:ietf:params:xml:ns:netconf:notification:1.0">
data:    <eventTime>2020-12-21T00:01:00Z</eventTime>
data:    <nf-config-change xmlns="urn:com:vendor:yang:sdnc">
data:       <instance>a951a653-f557-4d49-9f84-2ea33585ae11</instance>
data:       <model-namespace>urn:com:vendor:yang:rxd:rd2322</model-namespace>
data:       <model-version>2020-12-04</model-version>
data:       <instance-slice>57cdbf08-7447-4a01-873d-6e4b9dff86a0</instance-slice>
data:     </nf-config-change>
data: </notification>
```

- JSON format:

```json
data: {
data:   "ietf-restconf:notification" : {
data:     "eventTime" : "2020-12-21T00:01:00Z",
data:     "nf-config-change" : {
data:       "instance"  : "a951a653-f557-4d49-9f84-2ea33585ae11",
data:       "model-namespace"  : "urn:com:vendor:yang:rxd:rd2322",
data:       "model-version"  : "2020-12-04",
data:       "instance-slice"  : "57cdbf08-7447-4a01-873d-6e4b9dff86a0"
data:     }
data:   }
data: }
```

For more details on YANG defined event-notifications please review [RFC8040 Section-6](https://datatracker.ietf.org/doc/html/rfc8040#section-6)

## CSDM Complete Model

### UML

While complexity is expected to increase over time, the dependencies on the device models against the CSDM Core Model should not be misunderstood.

[![](./img/sdnc_global.png)](./img/sdnc_global.svg)

### YANG model viewer

[Interactive Model Viewer](./jstree/sdnc_global.html)

### YANG tree structure

```none```
