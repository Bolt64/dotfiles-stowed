;; inhibit-startup-echo-area-message MUST be set to a hardcoded 
;; string of your login name 
(setq inhibit-startup-echo-area-message "bolt")
(setq inhibit-startup-message t)


;; Setting up package management

(require 'package) ;; You might already have this line
(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/"))
(package-initialize) ;; You might already have this line

;; use-package config
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))
(setq use-package-verbose t)
;(setq use-package-always-ensure t)
(require 'use-package)

;; Package config files

(add-to-list 'load-path "~/.emacs.d/elisp/")
(load-library "emacs-general")
(load-library "dashboard-conf")
(load-library "yasnippet-conf")
(load-library "neotree-conf")
(load-library "ido-conf")
(load-library "evil-mode-conf")
(load-library "ibuffer-conf")
(load-library "helm-conf")
(load-library "org-mode-conf")
(load-library "markdown-mode-conf")
(load-library "auctex-conf")
(load-library "magit-conf")
;; (load-library "fzf-conf")

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(TeX-electric-math (quote ("$" . "$")))
 '(TeX-view-program-list (quote (("Zathura" "zathura %o"))))
 '(TeX-view-program-selection (quote ((output-pdf "Zathura"))))
 '(column-number-mode t)
 '(fill-column 100)
 '(help-window-select t)
 '(org-M-RET-may-split-line (quote ((default))))
 '(org-default-notes-file (concat org-directory "/notes.org"))
 '(org-directory "~/OrgMode")
 '(org-export-html-postamble nil)
 '(org-hide-leading-stars t)
 '(org-startup-folded (quote overview))
 '(org-startup-indented t)
 '(org-startup-truncated nil)
 '(package-selected-packages
   (quote
    (dashboard magit yasnippet helm markdown-mode tex use-package neotree monokai-theme evil-nerd-commenter evil-leader auctex-latexmk)))
 '(save-place-mode t)
 '(show-paren-mode t)
 '(smooth-scrolling-mode t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
