kv-sh [![Build Status](https://travis-ci.org/imyller/kv-sh.svg?branch=master)](https://travis-ci.org/imyller/kv-sh)
=====================

`kv-sh` is a key-value database written in standard POSIX shell (sh)

## About
 - Tiny key-value database
 - Configurable database directory (default: `~/.kv-sh`)
 - Used by importing functions via ```$ . ./kv-sh```
 - Full database dump/restore
 - Support for secondary read-only defaults database
 
Based on `kv-bash` script by [damphat](https://github.com/damphat/kv-bash)

## Requirements

 - Standard POSIX shell (sh)
 - Unix-like environment
 - No dependencies

## Usage

### Import functions

Import all key-value database functions (default database directory, no defaults database):

```sh
. ./kv-sh         # import kv-sh functions
```

Import all key-value database functions (custom database directory, no defaults database):

```sh
DB_DIR="/tmp/.kv" . ./kv-sh       # import kv-sh functions and use /tmp/.kv as database directory
```

#### Configuration environment variables

Following can be set when importing `kv-sh`:

* `DB_DIR`: custom database directory
* `DB_DEFAULTS_DIR`: enable secondary read-only default value database

### Functions

```
    . ./kv-sh                  # import kv-sh functions (use default database directory; see
                                 configuration environment variables for available options)
    kvset <key> <value>        # assign value to key
    kvget <key>                # get value of key
    kvdel <key>                # delete key
    kvexists <key>             # check if key exists
    kvkeys {-l|-d|-a}          # list all keys (-l local only, -d default only, -a all (default))
    kvlist {-a}                # list all key/value pairs (-a all keys, including default)
    kvdump {-a}                # database dump (-a all keys, including default)
    kvimport                   # database import (overwrite)
    kvrestore                  # database restore (clear and restore)
    kvclear                    # clear database
```

### Defaults database

`kv-sh` supports secondary read-only defaults database. If enabled, keys-value pairs from default value database are returned if local value is not specified.

Enable defaults database by setting `DB_DEFAULTS_DIR`:

```sh
DB_DIR="/tmp/.kv" DB_DEFAULTS_DIR="/tmp/.kv-default" . ./kv-sh
```

## Examples

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

## Tests

### Run tests

```sh
git clone https://github.com/imyller/kv-sh.git
cd kv-sh
./kv-test
```

## License

 * MIT
