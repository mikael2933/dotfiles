(package-initialize)

;; Require Melpa on first install
(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))

;; fetch the list of packages available 
(unless package-archive-contents
  (package-refresh-contents))

;; Install Cask and Pallet if missing (first time installation)
(unless (package-installed-p 'cask)
  (package-install 'cask))
(unless (package-installed-p 'pallet)
  (package-install 'pallet))

;; Cask and pallet - Package Management
(require 'cask "~/.cask/cask.el")
(cask-initialize)
(require 'pallet)
(pallet-mode t)

(org-babel-load-file "~/.emacs.d/config.org")
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(anzu-cons-mode-line-p nil)
 '(company-ghc-show-info t)
 '(counsel-projectile-mode t nil (counsel-projectile))
 '(custom-enabled-themes (quote (custom-manoj-dark)))
 '(custom-safe-themes
   (quote
    ("ff798ae7e7f84b2260042c27978f52c996830132961cae618d917b017509cc92" default)))
 '(display-time-mode nil)
 '(dumb-jump-selector (quote ivy))
 '(electric-pair-mode t)
 '(font-use-system-font t)
 '(haskell-indentation-layout-offset 4)
 '(haskell-indentation-left-offset 4)
 '(haskell-indentation-starter-offset 4)
 '(haskell-indentation-where-post-offset 4)
 '(haskell-indentation-where-pre-offset 4)
 '(haskell-mode-hook nil t)
 '(haskell-stylish-on-save t)
 '(haskell-tags-on-save t)
 '(inhibit-startup-screen t)
 '(intero-global-mode t nil (intero))
 '(max-lisp-eval-depth 10000)
 '(max-specpdl-size 100000)
 '(org-format-latex-options
   (quote
    (:foreground default :background default :scale 1.5 :html-foreground "Black" :html-background "Transparent" :html-scale 1.0 :matchers
		 ("begin" "$1" "$" "$$" "\\(" "\\["))))
 '(org-highlight-latex-and-related (quote (latex script entities)))
 '(package-selected-packages
   (quote
    (leuven-theme spaceline anzu company-ghc ghc all-the-icons-ivy all-the-icons-dired all-the-icons-gnus git-timemachine ghub helm helm-core ivy yasnippet smartparens powerline ibuffer-git dumb-jump counsel-projectile projectile git-gutter iedit expand-region aggressive-indent undo-tree ox-reveal ace-window swiper-helm atomic-chrome intero smex multiple-cursors buffer-move ## god-mode haskell-mode counsel rainbow-mode yasnippet-snippets ranger rainbow-delimiters pallet org-bullets ob-sagemath magit linum-relative helm-sage flyspell-correct-ivy exwm doom-themes dashboard color-theme-sanityinc-tomorrow cdlatex beacon auto-complete-sage)))
 '(powerline-default-separator nil)
 '(projectile-completion-system (quote ivy))
 '(ring-bell-function (quote ignore))
 '(show-smartparens-global-mode t)
 '(vc-follow-symlinks t)
 '(visible-bell t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(powerline-active1 ((t (:inherit mode-line :background "grey17" :foreground "white" :height 1.1))))
 '(powerline-active2 ((t (:inherit mode-line :background "grey40" :foreground "white" :height 1.1))))
 '(rainbow-delimiters-depth-1-face ((t (:inherit rainbow-delimiters-base-face :foreground "pale green"))))
 '(rainbow-delimiters-depth-2-face ((t (:inherit rainbow-delimiters-base-face :foreground "cornflower blue"))))
 '(rainbow-delimiters-depth-3-face ((t (:inherit rainbow-delimiters-base-face :foreground "light goldenrod"))))
 '(rainbow-delimiters-depth-4-face ((t (:inherit rainbow-delimiters-base-face :foreground "tomato")))))
(put 'narrow-to-region 'disabled nil)
(put 'upcase-region 'disabled nil)
