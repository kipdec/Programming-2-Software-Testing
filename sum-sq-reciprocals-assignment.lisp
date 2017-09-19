(include-book "testing" :dir :teachpacks)
(include-book "doublecheck" :dir :teachpacks)
(include-book "arithmetic-5/top" :dir :system)


;;; Here is an example that you can use to build
;;; your solution

;; Function definition

(defun sum-up-to-n (n)
   (if (zp n)
       0
       (+ n (sum-up-to-n (- n 1)))))

;; Unit tests

(check-expect (sum-up-to-n 0)
              0)
(check-expect (sum-up-to-n 1)
              1)
(check-expect (sum-up-to-n 4)
              10)
(check-expect (sum-up-to-n 100)
              5050)

;; Little theory (randomized testing)

(defproperty-program gauss-trick
   (n :value (random-natural))
   (equal (sum-up-to-n n)
          (/ (* n (+ n 1)) 2)))

;; Big theory (correctness theorem)

(defproperty gauss-trick
   (n :value (random-natural))
   (implies (natp n)
	   (equal (sum-up-to-n n)
     	     (/ (* n (+ n 1)) 2))))

;;; TODO write a function that adds up the first n square reciprocals
;;; E.g., 1/1 + 1/4 + 1/9 + ... + 1/n^2
(defun ...)

;;; TODO You need at least 5 unit tests

(check-expect ...)

;;; NOTE The actual value of 1/1 + 1/4 + 1/9 + ... is pi^2/6, 
;;; roughly 1.6.  That's actually very hard to prove! So let's 
;;; just try to show that it's somewhere between 0 and 2.  

;;; TODO Test a little theory that the answer is at least 0

(defproperty-program ...)

;;; TODO Turn the little theory above into an actual theorem

(defproperty ...)

;;; TODO Test a little theory that the answer is at most 2

(defproperty-program ...)

;;; TODO Convert the little theory above into a theorem
;;; It's OK if the theorem doesn't quite prove. I want
;;; to see you give it a good try

(defproperty ...)
