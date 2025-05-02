(import ./stack)

(defn interpret [code]
  (def tokens (string/split " " (string/trim code)))

  (each token tokens
    (case token
      "%" (stack/modulo)
      "*" (stack/multiply)
      "+" (stack/add)
      "-" (stack/subtract)
      "/" (stack/divide)
      "drop" (stack/drop)
      "dup" (stack/dup)
      "over" (stack/over)
      "rot" (stack/rot)
      "swap" (stack/swap)
      (if-let [num (scan-number token)]
        (stack/push num)
        (error (string "invalid token: " token))))))
