(import ./repl)
(import ./interpreter)

(defn file-exists? [filename]
  (not= nil (try (os/stat filename) ([_] nil))))

(defn main [& args]
  (def rest (tuple/slice args 1))

  (if (empty? rest)
    (repl/repl)
    (let [filename (first rest)]
      (if (file-exists? filename)
        (interpreter/interpret-file filename)
        (eprintf "error: file %s does not exist" filename)))))
