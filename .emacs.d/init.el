(package-initialize)

;; Require Melpa on first install
(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))

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
 '(counsel-projectile-mode t nil (counsel-projectile))
 '(custom-enabled-themes (quote (custom-manoj-dark)))
 '(custom-safe-themes
   (quote
    ("7d4b36cd04ccb623b79196363304199e13eaf3947229c23e7e54b380236588f8" "6d684339a099cf522abc6301baeb63db863911bd671b1123deb2dc5df76aab5b" "6dd47525c8cf4a7c1a952290900e658cb0583289acdc487fd6ba14ba1068ccad" "3e909a9928f6858f37d76ab0bfb660c49a9b820f77cd469c64b042708ed80f71" default)))
 '(display-time-mode nil)
 '(dumb-jump-selector (quote ivy))
 '(font-use-system-font t)
 '(haskell-mode-hook nil)
 '(haskell-stylish-on-save t)
 '(haskell-tags-on-save t)
 '(inhibit-startup-screen t)
 '(intero-global-mode t nil (intero))
 '(package-selected-packages
   (quote
    (powerline ibuffer-git dumb-jump counsel-projectile projectile git-gutter iedit expand-region aggressive-indent undo-tree ox-reveal ace-window swiper-helm atomic-chrome intero smex multiple-cursors buffer-move ## god-mode haskell-mode counsel rainbow-mode yasnippet-snippets ranger rainbow-delimiters pallet org-bullets ob-sagemath magit linum-relative helm-sage flyspell-correct-ivy exwm doom-themes dashboard color-theme-sanityinc-tomorrow cdlatex beacon auto-complete-sage)))
 '(projectile-completion-system (quote ivy)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
(put 'narrow-to-region 'disabled nil)
(put 'upcase-region 'disabled nil)
