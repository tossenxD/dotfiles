(define-module (modules privacy)
  #:export (privacy-environment))

;; TODO fix VPN
(define privacy-packages
  '("qbittorrent-no-x"
    "proton-vpn-cli"))

(define privacy-services
  '())

(define privacy-environment
  (cons privacy-packages privacy-services))
