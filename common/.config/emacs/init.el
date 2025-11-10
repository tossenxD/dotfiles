;;;;;;;;;;;;;;;;;;;;;;;;
;; Package Management ;;
;;;;;;;;;;;;;;;;;;;;;;;;

;; Get package archives.
(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)
(package-refresh-contents)

;; Define function `get-package` for installing packages s.t:
;;   (get-package pkg)
;;     1) install `pkg`
;;     2) require `pkg`
;;   (get-package pkg pkg-req)
;;     1) install `pkg`
;;     2) require `pkg-reg`
;;   (get-package pkg pkg-req mode)
;;     1) install `pkg`
;;     2) require (see above)
;;     3) auto determine major-mode according to `mode`
;;   (get-package pkg pkg-req mode init-fun args) ::
;;     1) install `pkg`
;;     2) apply `init-fun` to `args`
;;     3) require (see above)
;;     4) mode (see above)
(defun get-package (pkg &optional pkg-req mode init-fun &rest args)
  (unless (package-installed-p pkg) (package-install pkg))
  (when init-fun (apply init-fun args))
  (if pkg-req (require pkg-req) (require pkg))
  (when mode (add-to-list 'auto-mode-alist mode)))



;;;;;;;;;;;
;; Emacs ;;
;;;;;;;;;;;


;;;; Evil

;; Install and enable Evil mode.
(get-package 'evil)
(evil-mode 1)

;; Evil requires undo-redo (part of Emacs from version 28) and it requires 'goto
;; last change' functionality. The package goto-chg can provide this.
(get-package 'goto-chg)
(setq evil-v$-excludes-newline t)
(setq evil-want-fine-undo t)
(evil-set-undo-system 'undo-redo)


;;;; Theme Customization

;; The darkest text color will determine the whitespace color (by making it
;; slightly darker).
(get-package 'gruvbox-theme)
(load-theme 'gruvbox-dark-medium t)
(defconst theme-darkest-text-color "#665c54")


;;;; Faces & Text Customization

(set-face-attribute 'default nil :family "DejaVu Sans Mono" :height 112)
(setq-default frame-resize-pixelwise t)
(add-hook 'prog-mode-hook #'display-line-numbers-mode)
(setq-default indent-tabs-mode nil)
(setq-default fill-column 80)
(add-hook 'prog-mode-hook #'display-fill-column-indicator-mode)

;; Show whitespaces.
(global-whitespace-mode t)
(setq-default whitespace-style
              '(face
                spaces
                newline
                empty
                tabs
                trailing
                missing-newline-at-eof
                space-mark
                ;; newline-mark
                tab-mark))
(setq-default whitespace-global-modes
              '(not shell-mode
                    help-mode
                    magit-mode
                    magit-diff-mode
                    ibuffer-mode
                    dired-mode
                    occur-mode))
(setq-default whitespace-action '(cleanup auto-cleanup))
(require 'color)
(add-hook 'server-after-make-frame-hook
          (lambda ()
            (let ((whitespace-color (color-darken-name theme-darkest-text-color 20)))
              (set-face-attribute 'whitespace-newline                nil :foreground whitespace-color)
              (set-face-attribute 'whitespace-missing-newline-at-eof nil :foreground whitespace-color)
              (set-face-attribute 'whitespace-space                  nil :foreground whitespace-color)
              (set-face-attribute 'whitespace-space-after-tab        nil :foreground whitespace-color)
              (set-face-attribute 'whitespace-space-before-tab       nil :foreground whitespace-color)
              (set-face-attribute 'whitespace-tab                    nil :foreground whitespace-color)
              (set-face-attribute 'whitespace-trailing               nil :foreground whitespace-color))))


;;;; Frame Customization

(menu-bar-mode -1)
(scroll-bar-mode -1)
(tool-bar-mode -1)


;;;; Mode line

(setq-default column-number-mode t)



;;;;;;;;;;;;;;
;; Programs ;;
;;;;;;;;;;;;;;


;;;; PDF Rendering

(get-package 'pdf-tools nil '("\\.pdf\\'" . pdf-tools) 'pdf-tools-install t)



;;;;;;;;;;;;;;;
;; Languages ;;
;;;;;;;;;;;;;;;


;;;; Emacs-lisp

(add-hook 'emacs-lisp-mode-hook 'prettify-symbols-mode)


;;;; Org

(get-package 'toc-org)
(get-package 'org-bullets)
(add-hook 'org-mode-hook 'toc-org-mode)
(add-hook 'org-mode-hook 'org-bullets-mode)
(setq-default org-pretty-entities t)
(setq-default org-support-shift-select t)


;;;; C and C-likes

(setq-default c-basic-offset 4)
(add-hook 'c++-mode-hook (lambda () (set-fill-column 100)))
;; TODO
;;(add-to-list 'eglot-server-programs '((c++-mode c-mode) "clangd"))
;;(add-hook 'c-mode-hook 'eglot-ensure)
;;(add-hook 'c++-mode-hook 'eglot-ensure)


;;;; LaTeX


;;;;;; AUCTeX

;; See more with: `C-h i m auctex`
(get-package 'auctex 'tex)
(setq TeX-auto-save t)
(setq TeX-parse-self t)
(setq-default TeX-master nil)


;;;;;; RefTeX

;; See more with: `C-h i m reftex`
(add-hook 'LaTeX-mode-hook 'turn-on-reftex)
(setq reftex-plug-into-AUCTeX t)


;;;;;; CDLaTeX

;; See more at:
;;   https://www.gnu.org/software/emacs/manual/html_node/org/CDLaTeX-mode.html
(get-package 'cdlatex)
(add-hook 'LaTeX-mode-hook #'turn-on-cdlatex)


;;;;;; Compilation

;; `C-c C-a` to compile and view. `C-c C-g` to correlate view to source mark.
(setq TeX-save-query nil)
(setq TeX-show-compilation nil)
(setq TeX-PDF-mode t)
(add-hook 'LaTeX-mode-hook (lambda ()
                             (setq TeX-view-program-selection '((output-pdf "PDF Tools"))
                                   TeX-view-program-list '(("PDF Tools" TeX-pdf-tools-sync-view))
                                   TeX-source-correlate-start-server t)
                             (add-to-list 'TeX-command-list '("LaTeX" "%`pdflatex -shell-escape --synctex=1%(mode)%' %t" TeX-run-TeX nil t))
                             (define-key LaTeX-mode-map (kbd "C-c C-g") #'pdf-sync-forward-search)
                             (setq TeX-command-default "LaTeX")
                             (setq pdf-sync-backward-display-action t
                                   pdf-sync-forward-display-action t
                                   TeX-source-correlate-mode t
                                   TeX-source-correlate-method '((dvi . source-specials) (pdf . synctex)))
                             (add-hook 'TeX-after-compilation-finished-functions #'TeX-revert-document-buffer)
                             ))


;;;;;; Prettification

;; Configurations that makes LaTeX source more readable (especially math).
(setq prettify-symbols-unprettify-at-point 'right-edge)
(add-hook 'TeX-mode-hook (lambda () (prettify-symbols-mode)))


;;;;;; Spelling
(add-hook 'TeX-mode-hook (lambda () (flyspell-mode 1)))


;;;; Markdown

;; Markdown depends on a markdown processor for parsing.
(defconst markdown-processor "cmark")
(get-package 'markdown-mode nil '("README\\.md\\'" . gfm-mode)
             '(lambda () (setq markdown-command markdown-processor)))


;;;; Asciidoc

(get-package 'adoc-mode)


;;;; Futhark

(get-package 'futhark-mode)


;;;; CUDA

(add-to-list 'auto-mode-alist '("\.cu$" . c++-mode))
(add-to-list 'auto-mode-alist '("\.cu.h$" . c++-mode))


;;;; Nix

;; Provides Nix language support and a NixOS option search function,
;; which is bound to `C-c C-n` in any .nix file buffers.

;; TODO
;;(get-package 'nix-mode nil '("\\.nix\\'" . nix-mode))
;;(get-package 'helm-nixos-options)
;;(with-eval-after-load 'nix-mode
;;  (define-key nix-mode-map (kbd "C-c C-n") 'helm-nixos-options))



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Customize interface file ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Options added by customize interface (outsourced to avoid cluttering).
;; Should be left at the bottom of the file to take precedence.
(setq custom-file (expand-file-name "custom.el" user-emacs-directory))
(load custom-file)
