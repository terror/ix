set dotenv-load

export EDITOR := 'nvim'

alias r := run

default:
  just --list

run *args:
  @janet ix.janet {{ args }}
