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
  (interpreter/interpret "1 2 3 +")
  (is (== [1 5] stack/stack) "addition operator should sum the top two values"))

(deftest "*"
  (reset-stack)
  (interpreter/interpret "1 2 3 *")
  (is (== [1 6] stack/stack) "multiplication operator should multiply the top two values"))

(deftest "-"
  (reset-stack)
  (interpreter/interpret "10 3 -")
  (is (== [7] stack/stack) "subtraction operator should subtract the top value from the one below it"))

(deftest "/"
  (reset-stack)
  (interpreter/interpret "20 4 /")
  (is (== [5] stack/stack) "division operator should divide the value below by the top value"))

(deftest "%"
  (reset-stack)
  (interpreter/interpret "10 3 %")
  (is (== [1] stack/stack) "modulo operator should return the remainder of division"))

(deftest "dup"
  (reset-stack)
  (interpreter/interpret "42 dup")
  (is (== [42 42] stack/stack) "dup should duplicate the top value"))

(deftest "drop"
  (reset-stack)
  (interpreter/interpret "1 2 3 drop")
  (is (== [1 2] stack/stack) "drop should remove the top value"))

(deftest "swap"
  (reset-stack)
  (interpreter/interpret "1 2 swap")
  (is (== [2 1] stack/stack) "swap should exchange the top two values"))

(deftest "over"
  (reset-stack)
  (interpreter/interpret "1 2 over")
  (is (== [1 2 1] stack/stack) "over should copy the second value to the top"))

(deftest "rot"
  (reset-stack)
  (interpreter/interpret "1 2 3 rot")
  (is (== [2 3 1] stack/stack) "rot should rotate the top three values"))

(deftest "print"
  (reset-stack)
  (interpreter/interpret "42 print")
  (is (== [42] stack/stack) "print should output the top value without modifying the stack"))

(deftest "."
  (reset-stack)
  (interpreter/interpret "42 .")
  (is (empty? stack/stack) "period should output and remove the top value"))

(deftest "invalid token"
  (reset-stack)
  (is (thrown? (interpreter/interpret "5 unknown-command"))
      "invalid tokens should throw an error"))

(deftest "stack underflow"
  (reset-stack)
  (is (thrown? (interpreter/interpret "+"))
      "operations on an empty stack should throw an error"))

(deftest "empty input"
  (reset-stack)
  (interpreter/interpret "")
  (is (empty? stack/stack) "empty input should not change the stack"))

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
