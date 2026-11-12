(define-module (modules office)
  #:export (office-environment))

(define office-packages
  '("gimp"
    "libreoffice"
    "openscad"
    "inkscape"
    "prusa-slicer"
    "audacity"))

(define office-services
  '())

(define office-environment
  (cons office-packages office-services))
