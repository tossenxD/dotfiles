;; Configurations
(org-babel-load-file (expand-file-name "emacs.org" user-emacs-directory))

;; Options added by customize interface (outsourced to avoid cluttering)
(setq custom-file (expand-file-name "custom.el" user-emacs-directory))
(load custom-file)
