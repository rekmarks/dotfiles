
# RegEx

## Essential Tools

- [regexr.com](https://regexr.com)

## Useful Snippets

For replacements, assumes VS Code.

```shell

### URLs

# scheme?, host
((http|https)?\:\/\/)?[a-zA-Z0-9\-\.]+\.[a-zA-Z]{2,}

### Markdown

# Parenthesized GitHub tag number to PR/Issue link
\(#(\d+)\)
([#$1](https://github.com/ORG_OR_USER/REPO_NAME/PULL_OR_ISSUE/$1))

### JavaScript

# dot notation property require -> destructure property require
const (\w+) = (require\('[-\w\/\.]+'\))\.(\w+)(;)?
const { $3: $1 } = $2

# require -> import syntax
const (\w+|\{ [\w,: ]+ \}) = require\(('[-\w@\/\.]+')\)(;)?
import $1 from $2$3

# import -> require syntax
import ([{\w, }]+) from ('[-\w@\/\.]+')(;)?
const $1 = require($2)$3

# prototype -> Class syntax
YOUR_CLASS_NAME\.prototype\.(\w+) = function( \(.*\) \{)(;)?
$1$2$3
```
