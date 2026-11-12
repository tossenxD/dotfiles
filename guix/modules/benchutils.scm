(define-module (modules benchutils)
  #:export (benchutils-environment))

(define benchutils-packages
  '("mangohud"
    "glmark2"
    "xmrig"))

(define benchutils-services
  '())

(define benchutils-environment
  (cons benchutils-packages benchutils-services))
