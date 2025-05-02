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
        (try
          (interpreter/interpret-file filename)
          ([err]
            (eprintf "error interpreting file %s: %s" filename err)))
        (eprintf "error: file %s does not exist" filename)))))
