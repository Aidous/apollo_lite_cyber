# Apollo lite cyber RT [![Build Status](https://travis-ci.com/Aidous/apollo_lite_cyber.svg?token=8DqbrMkiJq8qxyzaYtzQ&branch=master)](https://travis-ci.com/Aidous/apollo_lite_cyber)

The cmake version of [Apollo Cyber RT](https://github.com/ApolloAuto/apollo). 

Reference:
- [Apollo_Lite](https://github.com/mickeyouyou/apollo_lite)
- [Apollo_standalone](https://github.com/yuzhangbit/apollo_standalone)

Os:
- Ubuntu 16.04 LTS

## Environment Build
```bash
bash scripts/scripts/install_dependencies.sh
```

## Build Framework
```
mkdir -p build
cd build && cmake ..
make -j$(nproc)
make install
cd ..
```

## Have a try on Cyber RT

### python tools:

- cyber_launch:

  usage: 
  - start 
  - stop

- cyber_channel:

  usage: 
  - bw  
  - echo  
  - hz  
  - info  
  - list  
  - type 

- cyber_node:

  usage: 
  - info  
  - list 

- cyber_service:

  usage: 
  - info  
  - list


### cc tools:

- cyber_app

  usage: 
  - info 
  - play 
  - record 
  - split 
  - recover

- cyber_monitor_app


## some simple examples:

1. **firstly set environments:**
```
   - source cyber/setup.bash
```   
   
2. component usage example:

- subscriber:
```
   cyber_launch start cyber/examples/timer_component_example/timer.launch   
```

- publisher:
```
   cyber_launch start cyber/examples/common_component_example/common.launch   
```
- stop launch:
```
   cyber_launch stop cyber/examples/timer_component_example/timer.launch

   cyber_launch stop cyber/examples/common_component_example/common.launch
```

3. sub/pub usage example:

- subscriber:
``` 
     example_listener / cyber_example_listenr 
```

- publisher:
```
     example_talker / cyber_example_talker 
```

4. service usage example:
```
   cyber_example_service
```

5. paramserver usage example:
```
   cyber_example_paramserver
```
