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

Commands:
  f|fetch
          git fetch

  pl|pull
          git pull

  ph|push
          git push

  up|upgrade
          upgrade giti.sh

Modules:
  meh
          git reset HEAD

  nah
        git reset HEAD --hard

  qmg
        quick merge current branch into another branch with the option to add a tag beforehand

  wip
          git add -A && git commit -m "WIP"

Examples:
  giti.sh -h
          display this message

  giti.sh -v
          display version

  giti.sh upgrade
          upgrade giti.sh to latest version

```

## installation

### supported systems

- linux

### automatically

Run `curl https://raw.githubusercontent.com/frncsdrk/giti.sh/master/download.sh | sudo bash`

### manually

- clone the repo
- run `./setup.sh i` (requires `sudo`)

## docker

Use `docker run frncsdrk/giti.sh`

## recommended git aliases

- `gs` for `git status`

## TODO

### commands

- [ ] rb - rebase
- [ ] m - merge

### modules

- [x] meh - `git reset HEAD`
- [x] nah - `git reset HEAD --hard && git clean -df`
- [x] qmg - quick merge
- [x] wip - `git add -A && git commit -m "WIP"`

## license

[MIT](https://github.com/frncsdrk/giti.sh/blob/master/LICENSE) (c) frncsdrk 2019
