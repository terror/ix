## ix

[![CI](https://github.com/terror/ix/actions/workflows/ci.yaml/badge.svg)](https://github.com/terror/ix/actions/workflows/ci.yaml)

**ix** is an interpreter for a stack-based programming language,
written entirely in [**janet**](https://janet-lang.org/).

## Installation

```
git clone https://github.com/terror/ix
cd ix
jpm deps
jpm build
jpm install
```

## Usage

Simply run `ix` without any arguments to spawn a repl (read–eval–print loop)
environment, or pass in a file as an argument `ix <file>` evaluate the entire
file.

## Features

The idea for `ix` is simple: you have a stack, and are given primitives to
mutate the stack.

## Prior Art

The [stack oriented programming](https://en.wikipedia.org/wiki/Stack-oriented_programming)
wikipedia page.
