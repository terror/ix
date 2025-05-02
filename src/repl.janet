(import ./interpreter)
(import ./stack)

(defn repl []
  (while true
    (def stack-str
      (if (empty? stack/stack)
        "<>" (string "<" (string/join (map string stack/stack) " ") ">")))

    (print "stack: " stack-str)

    (prinf "> ")

    (def input (string/trim (file/read stdin :line)))

    (when (= input "exit")
      (break))

    (try
      (interpreter/interpret input)
      ([err] (eprint "error: %s" err)))))
