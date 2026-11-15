(define-module (modules flatpaks)
  #:use-module (gnu packages flatpak)
  #:use-module (guix gexp)
  #:use-module (guix build utils)
  #:export (flatpaks-environment))

(define flatpaks-packages
  '("flatpak"))

(define flathub-packages
  '("com.protonvpn.www"
    "com.valvesoftware.Steam"
    "com.discordapp.Discord"
    "com.mastermindzh.tidal-hifi"))

(define flatpaks-services
  #~(let (bin #$(file-append flatpak "/bin/flatpak"))
      (begin (invoke bin
                     "--user"
                     "remote-add"
                     "--if-not-exists"
                     "flathub"
                     "https://dl.flathub.org/repo/flathub.flatpakrepo")
             (for-each (lambda (package)
                         (invoke bin
                                 "--user"
                                 "install"
                                 "--or-update"
                                 "--noninteractive"
                                 "flathub"
                                 package))
                       '#$flathub-packages)
             '())))

(define flatpaks-environment
  (cons flatpaks-packages flatpaks-services))
