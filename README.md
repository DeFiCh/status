# DeFiChain Status

Simple static status page to track the most important statuses.
Fork of https://github.com/bderenzo/tinystatus

## Features

- Parallel checks
- HTTP, ping, port checks
- HTTP expected status code (401, ...)
- Minimal dependencies (curl, nc and coreutils)
- Easy configuration and customisation
- Tiny (~1kb) optimized result page
- Incident history (manual)

## Setup

- Edit the checks file `checks.csv`
- To add incidents or maintenance, edit `incidents.txt`
- Generate status page `./generate-html.sh > index.html`
- Serve the page with your favorite web server

## Configuration file

The syntax of `checks.csv` file is:

```
Command, Expected Code, Status Text, Host to check
```

Command can be:

- `http` - Check http status
- `ping` - Check ping status
- `port` - Check open port status

There are also `http4`, `http6`, `ping4`, `ping6`, `port4`, `port6` for IPv4 or IPv6 only check.  
Note: `port4` and `port6` require OpenBSD `nc` binary.
