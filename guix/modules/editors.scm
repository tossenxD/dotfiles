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
   (simple-service 'emacs-server
                   home-shepherd-service-type
                   (list (shepherd-service
                          (provision '(emacs-server))
                          (requirement '(dbus))
                          (documentation "Emacs daemon")
                          (start #~(make-forkexec-constructor
                                    (list #$(file-append emacs-pgtk "/bin/emacs") "--fg-daemon")))
                          (stop #~(make-kill-destructor)))))))

(define editors-environment
  (cons editors-packages editors-services))
