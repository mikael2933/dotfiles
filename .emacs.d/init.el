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
 '(custom-enabled-themes (quote (custom-leuven)))
 '(custom-safe-themes
   (quote
    ("2e6a7437219bf5a926316776c807d4dc31766ab94abe3829d675f333b06d5636" "5280d3d44e7260e9a779710425d88fa071928f5703a5691fa08747818804d14a" "540954a9ac6825292156cda74de13d518661d9360522ecddcac74695bea557e3" "1217330e20209930251620110826e6a8e6070b00b90097b1e876d0ed21f93e97" "a3be4674b03af0bdebda177bf89c0d31134474122b9d2d89df881b1b4f3164ab" "24224653f3de4687c83d991619339ce99c6e8597b89fa60c70c486c2ae3b135c" "9a155066ec746201156bb39f7518c1828a73d67742e11271e4f24b7b178c4710" "ff798ae7e7f84b2260042c27978f52c996830132961cae618d917b017509cc92" default)))
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
 '(org-fontify-whole-heading-line t)
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
 )
(put 'narrow-to-region 'disabled nil)
(put 'upcase-region 'disabled nil)
