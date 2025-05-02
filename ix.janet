(var stack @[])

(defn push [value]
  (array/push stack value))

(defn pop []
  (when (empty? stack)
    (error "Stack underflow"))
  (array/pop stack))

(defn peek []
  (when (empty? stack)
    (error "Stack empty"))
  (last stack))

(defn dup []
  (let [val (peek)]
    (push val)))

(defn swap []
  (let [a (pop) b (pop)] (push a) (push b)))

(defn drop [] (pop) nil)

(defn over []
  (let [a (pop) b (peek)] (push a) (push b)))

(defn rot []
  (let [c (pop) b (pop) a (pop)] (push b) (push c) (push a)))

(defn add []
  (let [b (pop) a (pop)] (push (+ a b))))

(defn subtract []
  (let [b (pop) a (pop)] (push (- a b))))

(defn multiply [] 
  (let [b (pop) a (pop)] (push (* a b))))

(defn divide []
  (let [b (pop) a (pop)]
    (when (= b 0)
      (error "Division by zero"))
    (push (/ a b))))

(defn modulo []
  (let [b (pop) a (pop)]
    (when (= b 0)
      (error "Modulo by zero"))
    (push (% a b))))

(defn interpret [code]
  (def tokens (string/split " " (string/trim code)))
  
  (each token tokens
    (case token
      "%" (modulo)
      "*" (multiply)
      "+" (add)
      "-" (subtract)
      "/" (divide)
      "drop" (drop)
      "dup" (dup)
      "over" (over)
      "rot" (rot)
      "swap" (swap)
      (if-let [num (scan-number token)]
        (push num)
        (error (string "invalid token: " token))))))

(defn repl []
  (while true
    (def stack-str 
      (if (empty? stack)
        "<>" (string "<" (string/join (map string stack) " ") ">")))

    (print "stack: " stack-str)

    (prinf "> ")

    (def input (string/trim (file/read stdin :line)))

    (when (= input "exit")
      (break))

    (try
      (interpret input)
      ([err] (eprint "error: %s" err)))))

(repl)
