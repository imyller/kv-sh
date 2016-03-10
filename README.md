kv-sh [![Build Status](https://travis-ci.org/imyller/kv-sh.svg?branch=master)](https://travis-ci.org/imyller/kv-sh)
=====================

`kv-sh` is a key-value database written in standard POSIX shell (sh)

**About**
 - Tiny key-value database
 - Configurable database directory (default: `~/.kv-sh`)
 - Used by importing functions via ```$ . ./kv-sh```
 - Full database dump/restore
 
Based on `kv-bash` script by [damphat](https://github.com/damphat/kv-bash)

**Requirements**

 - Standard POSIX shell (sh)
 - Unix-like environment
 - No dependencies

**Usage**

Import all key-value database functions (default database directory):

```sh
. ./kv-sh         # import kv-sh functions
```

Import all key-value database functions (custom database directory):


```sh
. ./kv-sh /tmp/.kv         # import kv-sh functions and use /tmp/.kv as database directory
```

Import all key-value database functions (custom database directory, alternative method):

```sh
DB_DIR="/tmp/.kv" . ./kv-sh       # import kv-sh functions and use /tmp/.kv as database directory
```

Use key-value database functions:

```
$ kvset <key> <value>      # create or change value of key
$ kvget <key>              # get value of key
$ kvdel <key>              # delete key
$ kvexists <key>	   # check if key exists (exit code 0 if key exists, 1 if not)
$ kvlist                   # list all key/value pairs
$ kvkeys                   # list all keys
$ kvdump		   # dump key-value pairs in importable format
$ kvimport		   # import key value-pairs from dump without clearing database
$ kvrestore		   # clear database and import key-value pairs from dump
$ kvclear                  # clear database
```

**Examples**

```sh 
$ . ./kv-sh
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
$ kvdump > /tmp/kv.dump
$ kvdel pass
$ kvget pass

$ kvclear
$ kvrestore < /tmp/kv.dump
```

**Run tests**

```sh
git clone https://github.com/imyller/kv-sh.git
cd kv-sh
./kv-test
```

Example test result:

```
SCRIPT: ./kv-sh
DATABASE DIRECTORY: /tmp/.kv-test

TEST CASES:
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
 11 spaces in value                                   [  OK  ]
 12 non-exist-var => empty value => line count = 1    [  OK  ]
 13 kvclear; kvlist => line count = 0                 [  OK  ]
 14 kvclear; kvkeys => line count = 0                 [  OK  ]
 15 kvexists non exist => error code != 0             [  OK  ]
 16 kvexists exist empty => error code = 0            [  OK  ]
 17 kvexists exists value => error code = 0           [  OK  ]
 18 kvclear; kvset => directory created               [  OK  ]
 19 kvset; kvclear => directory deleted               [  OK  ]
 20 kvclear; kvdump => line count = 0                 [  OK  ]
 21 kvset 3 keys/value; kvdump => line count = 3      [  OK  ]
 22 kvdump; kvclear; kvimport                         [  OK  ]
 23 kvdump; kvimport                                  [  OK  ]
 24 kvdump; kvrestore                                 [  OK  ]
===================
TESTS:        24
TESTS OK:     24
TESTS FAILED: 0
```
