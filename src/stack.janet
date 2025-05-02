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
