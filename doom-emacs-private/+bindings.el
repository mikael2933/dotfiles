;;; ~/.config/doom/+bindings.el -*- lexical-binding: t; -*-

(map! :leader
      (:prefix-map ("b" . "buffer")
        :desc "Previous buffer"             "<left>"   #'previous-buffer
        :desc "Next buffer"                 "<right>"   #'next-buffer))
