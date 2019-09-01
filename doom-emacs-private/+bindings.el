;;; ~/.config/doom/+bindings.el -*- lexical-binding: t; -*-

(map! :n "C-<prior>" #'centaur-tabs-backward
      :n "C-<next>" #'centaur-tabs-forward

      :n "C-s" #'swiper
      :n "C-S-s" #'isearch-forward

      :leader
      :desc "Locate file" "l" #'helm-locate

      (:prefix-map ("b" . "buffer")
        :desc "Previous buffer"             "<left>"   #'previous-buffer
        :desc "Next buffer"                 "<right>"   #'next-buffer))
