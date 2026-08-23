# mod_blocklistd - Apache module for blocklstd.

"Blocklistd" is a daemon to block and release ports on demand
to avoid DoS abuse.

This Apache module provides ability to send actions to blocklistd
based on HTTP response status code.

## Dependencies

* blocklist

former name "blacklist"

<https://github.com/zoulasc/blocklist>

* Apache HTTP Server

<https:/httpd.apache.org>

## Build

```sh
% autoreconf -f -i
% ./configure
% make
% make install
```
## Configuration

### Apache

```conf
LoadModule blocklistd_modules path/to/module/mod_blocklistd.so
```

HTTP authenticatin failures are handled as "Auth fail".

"Abuseive Behavior" respons status and ignored uri patterns are configurable.

#### Configuratin Options

##### BlocklistAbusiveResponseCodes

- Description:

  Response codes as blocklistd abusive behavior

- Syntax:

  BlocklistAbusiveResponseCodes [error-code ...]

- Default:

  BlocklistIgnoreUriPatterns 400 403 404 405 410 421

- Context:

  server config

Add error codes to response code list handled as abusive behavior.

##### BlocklistIgnoreUriPatterns

- Description:

  Glob patterns ignored as abusive behavior

- Syntax:

  BlocklistIgnoreUriPatterns [URI-path-grob ...]

- Default:

  BlocklistIgnoreUriPatterns /favicon.ico /apple-touch-icon*.png /robots.txt /.well-known/*

- Context:

  server config

Add glob patterns to the uri list to be ignored even if its response code is in
abusive response code list.


#### blocklistd

```conf
http	stream	*	www	*	3	6h
https	stream	*	www	*	3	6h
```

`www` is the user name defined with Apache `User` directive.
