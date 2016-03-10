kv-sh [![Build Status](https://travis-ci.org/imyller/kv-sh.png?branch=master)](https://travis-ci.org/imyller/kv-sh)
=====================
**About**
 - tiny key/value dabatase
 - configurable database directory (default: ~/.kv-sh)
 - used by importing functions via ```$ source ./kv-sh```
 
Based on `kv-bash` script by @damphat

**Requirements**

standard shell, unix-like environment, no dependencies

**Usage**

import all key/value database functions

```
$ source ./kv-sh         # import kv-sh functions
```

use ke/value database functions

```
$ kvset <key> <value>      # create or change value of key
$ kvget <key>              # get value of key
$ kvdel <key>              # delete key
$ kvlist                   # list all key/value pairs
$ kvkeys                   # list all keys
$ kvclear                  # clear database
```

**Examples**

``` 
$ source ./kv-sh
$ kvset user mr.bob
$ kvset pass abc@123
$ kvlist
user mr.bob
pass abc@123
$ kvkeys
user
pass
$ kvget user
mr.bob
$ kvget pass
abc@123
$ kvdel pass
$ kvget pass

$ kvclear
```

**Run tests**

```
git clone https://github.com/imyller/kv-sh.git
cd kv-sh
./kv-test
```

test result

```
Testing: ./kv-sh
Database: /tmp/.kv-test

RUN ALL TEST CASES:
===================
  1 call kvget for non-exist key should return empty  [  OK  ]
  2 kvset then kvget a variable                       [  OK  ]
  3 kvset then kvset again with different value       [  OK  ]
  4 deleted variable should be empty                  [  OK  ]
  5 kvdel non exist should be OK                      [  OK  ]
  6 kvset without param return error                  [  OK  ]
  7 kvget without param return error                  [  OK  ]
  8 kvdel without param return error                  [  OK  ]
  9 kvset 3 keys/value; kvlist => line count = 3      [  OK  ]
 10 kvset 3 keys/value; kvkeys => line count = 3      [  OK  ]
 11 non-exist-var => empty value => line count = 1    [  OK  ]
 12 kvclear; kvlist => line count = 0                 [  OK  ]
 13 kvclear; kvkeys => line count = 0                 [  OK  ]
 14 kvget return empty value => error code != 0       [  OK  ]
 15 spaces in value                                   [  OK  ]
```
