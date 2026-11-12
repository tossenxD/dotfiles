(define-module (modules firmware)
  #:export (firmware-services))

;; TODO test (and add) game controllers and possibly keyboard QMK flashing
(define firmware-packages
  '("solaar"))

(define firmware-services
  '())

(define firmware-environment
  (cons firmware-packages firmware-services))
