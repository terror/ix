(import ./stack)

(defn interpret [code]
  (def tokens (string/split " " (string/trim (string/replace-all "\n" " " code))))

  (each token tokens
    (when (not (empty? token))
      (case token
        "!=" (stack/not-equal)
        "%" (stack/modulo)
        "*" (stack/multiply)
        "+" (stack/add)
        "-" (stack/subtract)
        "." (print (stack/pop))
        "/" (stack/divide)
        "<" (stack/less-than)
        "<=" (stack/less-or-equal)
        "==" (stack/equal)
        ">" (stack/greater-than)
        ">=" (stack/greater-or-equal)
        "drop" (stack/drop)
        "dup" (stack/dup)
        "over" (stack/over)
        "print" (print (stack/peek))
        "rot" (stack/rot)
        "swap" (stack/swap)
        (if-let [num (scan-number token)]
          (stack/push num)
          (error (string "invalid token: " token)))))))

(defn interpret-file [filename]
  (let [content (string/trim (slurp filename))]
    (interpret content)))
