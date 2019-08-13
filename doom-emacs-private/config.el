;;; ~/.config/doom/config.el -*- lexical-binding: t; -*-

(load! "+bindings")
(load! "+ui")

;; Helm tramp
(use-package! helm-tramp
  :config
  (setq helm-tramp-custom-connections '(/sudo::/)))

;; private.el - No vc elisp file
(if (file-readable-p "~/.config/doom/+private.el")
    (load! "+private"))
