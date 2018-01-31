
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; (add-projectsto-list 'dashboard-items '(agenda) t)If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(inhibit-startup-screen t)
 '(package-selected-packages
   (quote
    (pallet package-build shut-up epl git commander f dash s))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(setq tab-width 4)

(global-unset-key (kbd "C-z"))

(require 'ox-beamer)

(setq org-support-shift-select t)

;;(desktop-save-mode 1)

(add-hook 'org-mode-hook (lambda () (org-bullets-mode 1)))

;(require 'doom-themes)
;(load-theme 'doom-spacegrey t)

;;(load-theme 'sanityinc-tomorrow-bright t)

(load-theme 'manoj-dark t)

(require 'yasnippet)
(yas-reload-all)
;;Add hook for prog-mode and org-mode
(add-hook 'prog-mode-hook #'yas-minor-mode)
(add-hook 'org-mode-hook #'yas-minor-mode)
(add-hook 'latex-mode-hook #'yas-minor-mode)

;; Ob-sagemath supports only evaluating with a session.
(setq org-babel-default-header-args:sage '((:session . t)
                                           (:results . "output")))

;; C-c c for asynchronous evaluating (only for SageMath code blocks).
(with-eval-after-load "org"
  (define-key org-mode-map (kbd "C-c c") 'ob-sagemath-execute-async))

;; Do not confirm before evaluation
(setq org-confirm-babel-evaluate nil)

;; Show images when opening a file.
(setq org-startup-with-inline-images t)

(ac-config-default)

(add-hook 'sage-shell:sage-mode-hook 'ac-sage-setup)
(add-hook 'sage-shell-mode-hook 'ac-sage-setup)
;; Show quick help
(setq ac-sage-show-quick-help t)

(global-set-key (kbd "C-x g") 'magit-status)

(require 'dashboard)
(dashboard-setup-startup-hook)
;;(setq dashboard-items '((recents  . 5)
;;                        (bookmarks . 5)))

(setq dashboard-items '((recents  . 5)))

(beacon-mode 1)

(require 'linum-relative)
