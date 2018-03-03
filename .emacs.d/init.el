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
    ("48fe8318ded6ac80cd577d71cd0bcec903d57127737c1e2dc270a0e3e76f7e5e" "dc7af7dad53d8e4c0087e8f72836e90291d5e44e8dc891c721110cd1102b724e" "450cfbd93d9c0bed01590143dade66f964df1fdf0377ee3a30fb2420918c447b" "0f567acfea16e50f133a992176430ec066dff34e7afb43adb0c0bdc6fc53ec8c" "06edc5747fb549787f4dcf80c9c2273d01d6c7adab943113c5257da431a4330b" "cb134f291834d61b68d8f552ec6038322aa2c73f7098481806be1efd69ece4e4" "a13e5f6b4eeaea9d34d155e9ea57e3e189749c9ebed8277b89d98be211c6ceb3" "c28a17fb39a0c985c418e212068852a25f4605d9028aa7c526bc8a9cbb9ed7ca" "48e7188afa64b343c6db008b56d21cbe77381537f90eabf9078e9145e477c9c9" "80c7fca3c842698d3c89e39cead72458776db1ad1f1cb33cb06e06e3dd7fb8b8" "c26ba321b9034e4357dff751489f9329add2392e02c2100d9aa5952f1bbda273" "989a7bfc5f8caeb6ba4f036c74fcbe79afc5044ce4effe6a898a3614bd4d2aa2" "7d4b36cd04ccb623b79196363304199e13eaf3947229c23e7e54b380236588f8" "6d684339a099cf522abc6301baeb63db863911bd671b1123deb2dc5df76aab5b" "6dd47525c8cf4a7c1a952290900e658cb0583289acdc487fd6ba14ba1068ccad" "3e909a9928f6858f37d76ab0bfb660c49a9b820f77cd469c64b042708ed80f71" default)))
 '(display-time-mode nil)
 '(dumb-jump-selector (quote ivy))
 '(electric-pair-mode t)
 '(font-use-system-font t)
 '(haskell-mode-hook nil)
 '(haskell-stylish-on-save t)
 '(haskell-tags-on-save t)
 '(inhibit-startup-screen t)
 '(intero-global-mode t nil (intero))
 '(max-lisp-eval-depth 10000)
 '(max-specpdl-size 10000)
 '(package-selected-packages
   (quote
    (powerline ibuffer-git dumb-jump counsel-projectile projectile git-gutter iedit expand-region aggressive-indent undo-tree ox-reveal ace-window swiper-helm atomic-chrome intero smex multiple-cursors buffer-move ## god-mode haskell-mode counsel rainbow-mode yasnippet-snippets ranger rainbow-delimiters pallet org-bullets ob-sagemath magit linum-relative helm-sage flyspell-correct-ivy exwm doom-themes dashboard color-theme-sanityinc-tomorrow cdlatex beacon auto-complete-sage)))
 '(projectile-completion-system (quote ivy))
 '(ring-bell-function (quote ignore))
 '(vc-follow-symlinks t)
 '(visible-bell t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(powerline-active1 ((t (:inherit mode-line :background "grey17" :foreground "white" :height 1.1))))
 '(powerline-active2 ((t (:inherit mode-line :background "grey40" :foreground "white" :height 1.1)))))
(put 'narrow-to-region 'disabled nil)
(put 'upcase-region 'disabled nil)
