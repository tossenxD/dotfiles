(define-module (home-config)
  #:use-module (gnu home)
  #:use-module (gnu home services)
  #:use-module (gnu services)
  #:use-module (gnu packages)
  #:use-module (guix gexp)
  #:use-module (srfi srfi-1)
  ;; local module definitions
  #:use-module (modules base)
  #:use-module (modules devutils)
  #:use-module (modules editors)
  #:use-module (modules desktops)
  #:use-module (modules office)
  #:use-module (modules benchutils)
  #:use-module (modules amdgpu)
  #:use-module (modules privacy)
  #:use-module (modules firmware)
  #:use-module (modules virtualizers)
  #:use-module (modules browsers))

(define host-environment
  (letrec* ((zip (lambda (xs ys)
                   (cons (append (car xs) (car ys)) (append (cdr xs) (cdr ys)))))
            (hostname (gethostname))
            (hostname? (lambda (xs)
                         (cond ((null? xs) #f)
                               ((string=? hostname (car xs)) #t)
                               (else (hostname? (cdr xs)))))))
    (fold zip base-environment
          (cond ((hostname? '("T14" "apollo69" "guixpad"))
                 (list devutils-environment
                       editors-environment
                       desktop-sway-environment
                       office-environment
                       benchutils-environment
                       amdgpu-environment
                       amdgpgpu-environment
                       privacy-environment
                       firmware-environment
                       virtualizers-environment
                       browsers-environment))
                ((hostname? '("htpc"))
                 (list desktop-plasma-environment
                       amdgpu-environment
                       privacy-environment
                       firmware-environment
                       browsers-environment))
                (else (throw 'missing-host hostname))))))

(home-environment
 (packages (specifications->packages (car host-environment)))
 (services (append (cdr host-environment) %base-home-services)))



;; TODO add service that checks for an existing wallpaper and creates a default if non are found
;; (also TODO, consider moving wallpaper from ~.wallpaper.png -> ~.config/.wallpaper.png
;;
;; e.g. take inspiration from:
;;
;; (list (service (home-files-service-type
;;   `(("scripts" ,(local0file "../common/foo" #:recursive? #t))))))





;; TODO Setup system configuration

;; TODO Setup channels

;; TODO Setup periodic garbage collection or alias

;; TODO embed home configuration in system configuration
;; (see https://guix.gnu.org/manual/devel/en/html_node/Guix-Services.html#guix_002dhome_002dservice_002dtype)

;; TODO tidal and discord package (nonguix)? Or maybe just use browser

;; TODO to microcode or not to microcode (nonguix)?

;; TODO steam+wifi on nonguix channel (what about minecraft and lutris?)
