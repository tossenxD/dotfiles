(define-module (modules virtualizers)
  #:export (virtualizers-environment))

;; TODO consider adding virtualbox (or something alike) and gaming emulators
(define virtualizers-packages
  '("qemu"))

(define virtualizers-services
  '())

(define virtualizers-environment
  (cons virtualizers-packages virtualizers-services))
