(use testament)

(import ../src/interpreter)
(import ../src/stack)

(defn reset-stack []
  (set stack/stack @[]))

(deftest "add values onto the stack"
  (reset-stack)
  (interpreter/interpret "5 10 15")
  (is (== [5 10 15] stack/stack) "stack should contain pushed numbers in order"))

(deftest "+"
  (reset-stack)
  (interpreter/interpret "3 4 +")
  (is (== [7] stack/stack) "addition operator should sum the top two values"))

(deftest "whitespace"
  (reset-stack)
  (interpreter/interpret "  5   10  + ")
  (is (== [15] stack/stack) "interpreter should handle extra whitespace"))

(deftest "newlines"
  (reset-stack)
  (interpreter/interpret "5\n10\n+")
  (is (== [15] stack/stack) "interpreter should replace newlines with spaces"))

(deftest "division by zero"
  (reset-stack)
  (is (thrown? (interpreter/interpret "5 0 /"))
      "division by zero should throw an error"))

(deftest "modulo by zero"
  (reset-stack)
  (is (thrown? (interpreter/interpret "5 0 %"))
      "modulo by zero should throw an error"))

(run-tests! :exit-on-fail true)
