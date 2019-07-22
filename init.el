(package-initialize)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector
   [default default default italic underline success warning error])
 '(ansi-color-names-vector
   ["#14191f" "#d15120" "#81af34" "#deae3e" "#7e9fc9" "#a878b5" "#7e9fc9" "#dcdddd"])
 '(ansi-term-color-vector
   [unspecified "#14191f" "#d15120" "#81af34" "#deae3e" "#7e9fc9" "#a878b5" "#7e9fc9" "#dcdddd"] t)
 '(auto-save-default nil)
 '(c-offsets-alist (quote ((inlambda . 0))))
 '(column-number-mode t)
 '(custom-enabled-themes (quote (atom-one-dark)))
 '(custom-safe-themes
   (quote
    ("8885761700542f5d0ea63436874bf3f9e279211707d4b1ca9ed6f53522f21934" "82358261c32ebedfee2ca0f87299f74008a2e5ba5c502bde7aaa15db20ee3731" "a4c9e536d86666d4494ef7f43c84807162d9bd29b0dfd39bdf2c3d845dcc7b2e" "5dc0ae2d193460de979a463b907b4b2c6d2c9c4657b2e9e66b8898d2592e3de5" "98cc377af705c0f2133bb6d340bf0becd08944a588804ee655809da5d8140de6" "ff7625ad8aa2615eae96d6b4469fcc7d3d20b2e1ebc63b761a349bebbb9d23cb" "0eb173dcdd23dbc02e0a178c7e8d3d9a9697786c11ef68b77b8b6255d4163cfd" "8aeb4dbed3dd5c639adcc574eb2e5698b08545dd3d1794ed7e9b4f2b8eb289e4" "4528fb576178303ee89888e8126449341d463001cb38abe0015541eb798d8a23" "b0fc95a71c0d988dbb9a147ae30b11748d87987f8f818fbff84484f6bb7892d7" default)))
 '(fci-rule-character-color "#192028")
 '(fci-rule-color "#192028")
 '(global-linum-mode t)
 '(helm-gtags-auto-update t)
 '(helm-gtags-ignore-case t)
 '(helm-gtags-path-style (quote relative))
 '(helm-gtags-suggested-key-mapping t)
 '(hl-sexp-background-color "#1c1f26")
 '(ido-mode (quote both) nil (ido))
 '(indent-tabs-mode nil)
 '(inhibit-startup-screen t)
 '(menu-bar-mode nil)
 '(nrepl-message-colors
   (quote
    ("#CC9393" "#DFAF8F" "#F0DFAF" "#7F9F7F" "#BFEBBF" "#93E0E3" "#94BFF3" "#DC8CC3")))
 '(package-selected-packages
   (quote
    (helm-gtags yasnippet w3 paredit material-theme helm-projectile atom-one-dark-theme)))
 '(pdf-view-midnight-colors (quote ("#DCDCCC" . "#383838")))
 '(show-paren-mode t)
 '(tool-bar-mode nil)
 '(vc-annotate-background "#2B2B2B")
 '(vc-annotate-color-map
   (quote
    ((20 . "#BC8383")
     (40 . "#CC9393")
     (60 . "#DFAF8F")
     (80 . "#D0BF8F")
     (100 . "#E0CF9F")
     (120 . "#F0DFAF")
     (140 . "#5F7F5F")
     (160 . "#7F9F7F")
     (180 . "#8FB28F")
     (200 . "#9FC59F")
     (220 . "#AFD8AF")
     (240 . "#BFEBBF")
     (260 . "#93E0E3")
     (280 . "#6CA0A3")
     (300 . "#7CB8BB")
     (320 . "#8CD0D3")
     (340 . "#94BFF3")
     (360 . "#DC8CC3"))))
 '(vc-annotate-very-old-color "#DC8CC3"))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "Monaco" :foundry "apple" :slant normal :weight normal :height 120 :width normal)))))

;;For removing beep sound
(setq ring-bell-function #'ignore)

;;Electric Indentation disabled
(setq-default c-electric-flag nil)

;;Map newline-and-return to Return
(add-hook 'c-mode-hook
          '(lambda ()
             (define-key c-mode-map "\C-m" 'newline-and-indent)))

;;Resizing window key bindings
(global-set-key (kbd "<C-up>") 'shrink-window)
(global-set-key (kbd "<C-down>") 'enlarge-window)
(global-set-key (kbd "<C-left>") 'shrink-window-horizontally)
(global-set-key (kbd "<C-right>") 'enlarge-window-horizontally)

;;Preventing creation of backup files
(setq make-backup-files nil)

;;Default Frame size
(add-to-list 'default-frame-alist '(height . 32))
(add-to-list 'default-frame-alist '(width . 80))

;;Melpa
(require 'package)
(let* ((no-ssl (and (memq system-type '(windows-nt ms-dos))
                    (not (gnutls-available-p))))
       (url (concat (if no-ssl "http" "https") "://melpa.org/packages/")))
  (add-to-list 'package-archives (cons "melpa" url) t))
(when (< emacs-major-version 24)
  ;; For important compatibility libraries like cl-lib
  (add-to-list 'package-archives '("gnu" . "https://elpa.gnu.org/packages/")))

;;c++-sport-mode
(load-library "/home/thekid/.emacs.d/c++-sport-mode.el")
(add-hook 'c++-mode 'c++-sport-mode)

;;helm
(require 'helm-config)
(helm-mode t)

;;yasnippet
(add-to-list 'load-path
              "~/.emacs.d/plugins/yasnippet")
(require 'yasnippet)
(yas-global-mode 1)

;;radare2 development settings
(c-add-style "radare2"
             '((c-basic-offset . 4)
               (tab-width . 4)
               (indent-tabs-mode . t)
               (put 'c-auto-align-backslashes 'safe-local-variable 'booleanp)
               (c-auto-align-backslashes . nil)
               (c-offsets-alist
                (arglist-intro . ++)
                (arglist-cont . ++)
                (arglist-cont-nonempty . ++)
                (statement-cont . ++)
                )))

;;projectile settings
(projectile-global-mode)
(setq projectile-completion-system 'helm)
(helm-projectile-on)

;;load helm-gtags settings
(load "~/.emacs.d/helm-gtags-settings.el")

;;set colorless background for terminal
(if (not (display-graphic-p)) 
    (load-theme 'noctilux))
