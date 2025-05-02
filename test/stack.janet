(use testament)

(import ../src/stack)

(defn reset-stack []
  (set stack/stack @[]))

(deftest "push"
  (reset-stack)
  (stack/push 5)
  (is (== [5] stack/stack) "push adds a value to the stack"))

(deftest "peek"
  (reset-stack)
  (stack/push 42)
  (is (= 42 (stack/peek)) "peek returns the top value without modifying the stack")
  (is (== [42] stack/stack) "stack restacks unchanged after peek")
  (reset-stack)
  (is (thrown? (stack/peek)) "peek on empty stack throws error"))

(deftest "pop"
  (reset-stack)
  (stack/push 10)
  (is (= 10 (stack/pop)) "pop returns the top value")
  (is (empty? stack/stack) "stack is empty after popping the only item")
  (reset-stack)
  (is (thrown? (stack/pop)) "pop on empty stack throws error"))

(run-tests! :exit-on-fail true)
