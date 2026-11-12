(define-module (modules editors)
  #:use-module (gnu home services shepherd)
  #:use-module (gnu services)
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
  '((simple-service 'emacs-daemon-service home-shepherd-service-type
                    '((shepherd-service
                       (provision '(emacs))
                       (requirement '(user-processes))
                       (documentation "Emacs daemon")
                       (start #~(make-forkexec-constructor
                                 '(#$(string-append emacs-pgtk "/bin/emacs") "--fg-daemon")))
                       (stop #~(make-kill-desctructor)))))))

(define editors-environment
  (cons editors-packages editors-services))
