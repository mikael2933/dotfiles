;;; ~/.config/doom/+bindings.el -*- lexical-binding: t; -*-

(map! :n "C-<prior>" #'centaur-tabs-backward
      :n "C-<next>" #'centaur-tabs-forward

      :leader
      (:prefix-map ("b" . "buffer")
        :desc "Previous buffer"             "<left>"   #'previous-buffer
        :desc "Next buffer"                 "<right>"   #'next-buffer))
