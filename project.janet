(declare-project
  :name "ix"
  :description "A stack-based language implementation in Janet"
  :version "0.1.0"
  :dependencies [
    "https://github.com/janet-lang/spork.git"
    "https://github.com/pyrmont/testament"
  ]
  :author "Liam <liam@scalzulli.com>"
  :license "CC0-1.0")

(declare-archive
  :name "ix"
  :entry "/src/main")

(declare-binscript
  :main "src/ix"
  :hardcode-syspath true
  :is-janet true)
