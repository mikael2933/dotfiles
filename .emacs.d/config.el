
(add-to-list 'load-path "~/.emacs.d/lib/")

(setq tab-width 4)

(global-unset-key (kbd "C-z"))

(global-set-key (kbd "C-c C-s") 'query-replace)

(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)

;;(desktop-save-mode 1)

(require 'ox-beamer)

(setq org-support-shift-select t)

(setq org-src-fontify-natively t)

(add-hook 'org-mode-hook (lambda () (org-bullets-mode 1)))

(add-to-list 'custom-theme-load-path "~/.emacs.d/themes")

;(require 'doom-themes)
;(load-theme 'doom-spacegrey t)

;;(load-theme 'sanityinc-tomorrow-bright t)

;;(load-theme 'manoj-dark t)

(load-theme 'custom-manoj-dark t)

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



(define-derived-mode sage-mode sage-shell-mode "sage-block mode")
(provide 'sage-mode)

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
;; Use `display-line-number-mode` as linum-mode's backend for smooth performance
(setq linum-relative-backend 'display-line-numbers-mode)

(ido-mode 1)

(global-set-key (kbd "C-h C-f") 'helm-find-files)

(require 'god-mode)

;; Set ½ as toggle
(global-set-key (kbd "C-½") 'god-mode-all)

;; If you are using the global mode, you might want to make no buffers exempt
(setq god-exempt-major-modes nil)
(setq god-exempt-predicates nil)

;; Shrink fringes to 1 pixel
;(fringe-mode 1)

;; You may want Emacs to show you the time
;(setq display-time-default-load-average nil)
;(display-time-mode t)

;; Emacs server is not required to run EXWM but it has some interesting uses
;; (see next section)
(server-start)

;;;; Below are configurations for EXWM

;; Load EXWM
(require 'exwm)

;; Fix problems with Ido
(require 'exwm-config)
(exwm-config-ido)

;; Set the initial number of workspaces.
(setq exwm-workspace-number 10)

;; All buffers created in EXWM mode are named "*EXWM*". You may want to change
;; it in `exwm-update-class-hook' and `exwm-update-title-hook', which are run
;; when a new window class name or title is available. Here's some advice on
;; this subject:
;; + Always use `exwm-workspace-rename-buffer` to avoid naming conflict.
;; + Only renaming buffer in one hook and avoid it in the other. There's no
;;   guarantee on the order in which they are run.
;; + For applications with multiple windows (e.g. GIMP), the class names of all
;;   windows are probably the same. Using window titles for them makes more
;;   sense.
;; + Some application change its title frequently (e.g. browser, terminal).
;;   Its class name may be more suitable for such case.
;; In the following example, we use class names for all windows expect for
;; Java applications and GIMP.
(add-hook 'exwm-update-class-hook
          (lambda ()
            (unless (or (string-prefix-p "sun-awt-X11-" exwm-instance-name)
                        (string= "gimp" exwm-instance-name))
              (exwm-workspace-rename-buffer exwm-class-name))))
(add-hook 'exwm-update-title-hook
          (lambda ()
            (when (or (not exwm-instance-name)
                      (string-prefix-p "sun-awt-X11-" exwm-instance-name)
                      (string= "gimp" exwm-instance-name))
              (exwm-workspace-rename-buffer exwm-title))))

(shell-command "setxkbmap -layout dk,gb -option grp:alt_shift_toggle")

;; `exwm-input-set-key' allows you to set a global key binding (available in
;; any case). Following are a few examples.
;; + We always need a way to go back to line-mode from char-mode
(exwm-input-set-key (kbd "s-r") #'exwm-reset)
;; + Bind a key to switch workspace interactively
(exwm-input-set-key (kbd "s-w") #'exwm-workspace-switch)
;; + Bind "s-0" to "s-9" to switch to the corresponding workspace.
(dotimes (i 10)
  (exwm-input-set-key (kbd (format "s-%d" i))
                      `(lambda ()
                         (interactive)
                         (exwm-workspace-switch-create ,i))))
;; + Application launcher ('M-&' also works if the output buffer does not
;;   bother you). Note that there is no need for processes to be created by
;;   Emacs.
(exwm-input-set-key (kbd "s-d")
                    (lambda () (interactive) (counsel-linux-app)))
;; + 'slock' is a simple X display locker provided by suckless tools.
(exwm-input-set-key (kbd "s-<f2>")
                    (lambda () (interactive) (start-process "" nil "slock")))

;; The following example demonstrates how to set a key binding only available
;; in line mode. It's simply done by first push the prefix key to
;; `exwm-input-prefix-keys' and then add the key sequence to `exwm-mode-map'.
;; The example shorten 'C-c q' to 'C-q'.
(push ?\C-q exwm-input-prefix-keys)
(define-key exwm-mode-map [?\C-q] #'exwm-input-send-next-key)

;; The following example demonstrates how to use simulation keys to mimic the
;; behavior of Emacs. The argument to `exwm-input-set-simulation-keys' is a
;; list of cons cells (SRC . DEST), where SRC is the key sequence you press and
;; DEST is what EXWM actually sends to application. Note that SRC must be a key
;; sequence (of type vector or string), while DEST can also be a single key.
;;(exwm-input-set-simulation-keys
;; '(
;; movement
;;     ([?\C-b] . left)
;;     ([?\M-b] . C-left)
;;     ([?\C-f] . right)
;;     ([?\M-f] . C-right)
;;     ([?\C-p] . up)
;;     ([?\C-n] . down)
;;     ([?\C-a] . home)
;;     ([?\C-e] . end)
;;     ([?\M-v] . prior)
;;     ([?\C-v] . next)
;;     ([?\C-d] . delete)
;;     ([?\C-k] . (S-end delete))
;; cut/paste.
;;     ([?\C-w] . ?\C-x)
;;     ([?\M-w] . ?\C-c)
;;     ([?\C-y] . ?\C-v)))
;; search
;;     ([?\C-s] . ?\C-f))

;(global-set-key (kbd "s-<left>") 'windmove-left)
;(global-set-key (kbd "s-<right>") 'windmove-right)
;(global-set-key (kbd "s-<up>") 'windmove-up)
;(global-set-key (kbd "s-<down>") 'windmove-down)

(exwm-input-set-key (kbd "s-<right>") 'windmove-right)
(exwm-input-set-key (kbd "s-<left>") 'windmove-left)
(exwm-input-set-key (kbd "s-<up>") 'windmove-up)
(exwm-input-set-key (kbd "s-<down>") 'windmove-down)

(require 'buffer-move)
;(global-set-key (kbd "<s-S-up>")     'buf-move-up)
;(global-set-key (kbd "<s-S-down>")   'buf-move-down)
;(global-set-key (kbd "<s-S-left>")   'buf-move-left)
;(global-set-key (kbd "<s-S-right>")  'buf-move-right)
(exwm-input-set-key (kbd "s-S-<right>") 'buf-move-right)
(exwm-input-set-key (kbd "s-S-<left>") 'buf-move-left)
(exwm-input-set-key (kbd "s-S-<up>") 'buf-move-up)
(exwm-input-set-key (kbd "s-S-<down>") 'buf-move-down)

(require 'multiple-cursors)
(global-set-key (kbd "C->") 'mc/mark-next-like-this)
(global-set-key (kbd "C-<") 'mc/mark-previous-like-this)
(global-set-key (kbd "C-M-<") 'mc/mark-all-like-this)
