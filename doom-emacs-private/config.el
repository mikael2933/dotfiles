;;; ~/.config/doom/config.el -*- lexical-binding: t; -*-

(load! "+bindings")
(load! "+ui")
; private.el - No vc elisp file
(if (file-readable-p "+private.el")
  (load! "+private"))
