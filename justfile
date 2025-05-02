set dotenv-load

export EDITOR := 'nvim'

alias b := build
alias r := run
alias t := test

default:
  just --list

build:
  jpm build

run *args:
  @janet src/main.janet {{ args }}

test:
  jpm test
