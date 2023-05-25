```
module: sdnc-clinf-tasks

  augment /c:sdnc:
    +--rw clinf {c:sdnc}?
       +--rw tasks* [task]
          +--rw task     yang:uuid
          +---x empty
          +--rw xnf* [instance]
             +--rw instance    -> /c:sdnc/cnf:xnf/nf/instance
             +---x purge
             +--rw slices
                +--rw slices* [instance-slice]
                   +--rw instance-slice    -> /c:sdnc/cnf:xnf/nf/configs/config-slices/instance-slice
                   +--rw timestamp         yang:date-and-time
                   +---x delete

  rpcs:
    +---x add {c:sdnc,cct:sdnc-clinf-tasks}?
    |  +---w input
    |  |  +---w instance          -> /c:sdnc/cnf:xnf/nf/instance
    |  |  +---w instance-slice    -> /c:sdnc/cnf:xnf/nf/configs/config-slices/instance-slice
    |  +--ro output
    |     +--ro task    -> /c:sdnc/cct:clinf/tasks/task
    +---x list-nf {c:sdnc,cct:sdnc-clinf-tasks}?
    |  +--ro output
    |     +--ro instance    -> /c:sdnc/cnf:xnf/nf/instance
    +---x list-tasks-by-nf {c:sdnc,cct:sdnc-clinf-tasks}?
       +---w input
       |  +---w instance    -> /c:sdnc/cnf:xnf/nf/instance
       +--ro output
          +--ro task              -> /c:sdnc/cct:clinf/tasks/task
          +--ro instance-slice    -> /c:sdnc/cnf:xnf/nf/configs/config-slices/instance-slice
          +--ro timestamp         yang:date-and-time
```

### YANG Dependencies

```
 sdnc sdnc-xnf ietf-yang-types
```
