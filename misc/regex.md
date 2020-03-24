
# RegEx

## Essential Tools

- [regexr.com](https://regexr.com)

## Useful Snippets

```shell

### URLs

# scheme?, host
((http|https)?\:\/\/)?[a-zA-Z0-9\-\.]+\.[a-zA-Z]{2,}

### JavaScript

# require -> import syntax
const (\w+|\{ [\w\, ]+ \}) = require\(('[-\w\/\.]+')\)(;)?
import $1 from $2$3

# import -> require syntax
import (\w+) from ('[-\w\/\.]+')(;)?
const $1 = require($2)$3

# prototype -> Class syntax
YOUR_CLASS_NAME\.prototype\.(\w+) = function( \(.*\) \{)(;)?
$1$2$3
```
