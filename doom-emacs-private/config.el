;;; ~/.config/doom/config.el -*- lexical-binding: t; -*-

(load! "+bindings")
(load! "+ui")

(global-auto-revert-mode t)

;; Temporary fix before Emacs 26.3
(setq gnutls-algorithm-priority "NORMAL:-VERS-TLS1.3")

(setq projectile-project-search-path '("~/Projects/"))

;; Dashboard Banner
(setq +doom-dashboard-banner-file (expand-file-name "EmacsIcon192.png" doom-private-dir))

;; PDF Viewer for LaTeX documents
(setq +latex-viewers '(evince))

(setq
 helm-M-x-fuzzy-match t
 helm-locate-fuzzy-match t
 helm-recentf-fuzzy-match t)

;; Helm tramp
(use-package! helm-tramp
  :config
  (setq helm-tramp-custom-connections '(/sudo::/)))

;; private.el - No vc elisp file
(if (file-readable-p "~/.config/doom/+private.el")
    (load! "+private"))
