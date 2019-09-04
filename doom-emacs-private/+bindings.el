;;; ~/.config/doom/+bindings.el -*- lexical-binding: t; -*-

(defun ispell-dict-load(dict)
  (interactive)
  (ispell-change-dictionary dict)
  (flyspell-buffer))

(map! :n "C-<prior>" #'centaur-tabs-backward
      :n "C-<next>" #'centaur-tabs-forward

      :n "C-s" #'swiper
      :n "C-S-s" #'isearch-forward

      (:map fsharp-mode-map
        :n "M-RET" #'fsharp-eval-region
        :i "C-SPC" #'fsharp-ac/complete-at-point)

      :leader

      (:prefix-map ("f" . "file")
        :desc "Locate file" "l" #'helm-locate)

      (:prefix-map ("l" . "language")
        :desc "Change dictionary en_GB" "e" (λ! (ispell-dict-load "en_GB"))
        :desc "Change dictionary da_DK" "d" (λ! (ispell-dict-load "da_DK")))

      (:prefix-map ("b" . "buffer")
        :desc "Previous buffer"             "<left>"   #'previous-buffer
        :desc "Next buffer"                 "<right>"   #'next-buffer))
