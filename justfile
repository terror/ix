set dotenv-load

export EDITOR := 'nvim'

alias b := build
alias f := fmt
alias r := run
alias t := test

default:
  just --list

build:
  jpm clean && jpm build

install: build
  jpm install

fmt:
  janet-format --files */*.janet

run *args:
  @janet src/main.janet {{ args }}

test:
  jpm test
