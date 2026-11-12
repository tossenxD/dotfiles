(define-module (modules editors)
  #:use-module (gnu home)
  #:use-module (gnu home services)
  #:use-module (gnu home services shepherd)
  #:use-module (gnu services)
  #:use-module (gnu packages emacs)
  #:use-module (guix gexp)
  #:export (editors-environment))

(define editors-packages
  '("emacs-pgtk"
    "aspell"
    "aspell-dict-uk"
    "aspell-dict-da"
    "neovim"
    "python-pynvim"))

(define editors-services
  (list
   (simple-service 'emacs-daemon-service home-shepherd-service-type
                   (list (shepherd-service
                          (provision '(emacs))
                          ;; (requirement '(user-processes)) TODO from docs, needed?
                          (documentation "Emacs daemon")
                          (start #~(make-forkexec-constructor
                                    (list (string-append #$emacs-pgtk "/bin/emacs") "--fg-daemon")))
                          (stop #~(make-kill-desctructor)))))))

(define editors-environment
  (cons editors-packages editors-services))
