;;; ~/config/doom/+ui.el -*- lexical-binding: t; -*-

;; re-enable menu bar
(menu-bar-mode 1)

;; Display indentation information on modeline
(setq doom-modeline-indent-info t)

;; use relative line numbers
(setq display-line-numbers-type 'relative)

(setq doom-font (font-spec :family "Fira Mono")
      doom-big-font (font-spec :family "Fira Mono" :size 36)
      doom-variable-pitch-font (font-spec :family "Noto Sans" :size 20))
