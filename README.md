# giti.sh

**git** **i**ntelligence

> a git toolbelt

## usage

```
giti.sh

Usage:
  giti.sh [-h|--help] [-v|--version]
    f|fetch|pl|pull|ph|push

  giti.sh up|upgrade

Options:
  -h|--help
          show this message

  -v|--version
          version

  f|fetch
          git fetch

  pl|pull
          git pull

  ph|push
          git push

  up|upgrade
          upgrade giti.sh

Examples:
  giti.sh -h
          display this message

  giti.sh -v
          display version

  giti.sh upgrade
          upgrade giti.sh to latest version

```

## installation

### automatically

Run `curl https://raw.githubusercontent.com/frncsdrk/giti.sh/master/download.sh | bash`

### manually

- clone the repo
- run `./setup.sh i` (requires `sudo`)

## docker

Use `docker run frncsdrk/giti.sh`

## license

[MIT](https://github.com/frncsdrk/giti.sh/blob/master/LICENSE) (c) frncsdrk 2019
