(define-module (modules browsers)
  #:export (browsers-environment))

(define browsers-packages
  '("icecat"
    "librewolf"
    "ungoogled-chromium-wayland"))

(define browsers-services
  '())

(define browsers-environment
  (cons browsers-packages browsers-services))
