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

;; list of installed packages
(use-package tex)
(use-package auctex-latexmk)
(use-package evil)
(use-package evil-leader)
(use-package evil-nerd-commenter)
(use-package undo-tree)
(use-package monokai-theme)
(use-package org)
(use-package neotree
    :bind ([f8] . neotree-toggle))
(use-package markdown-mode)
(use-package helm)
(use-package fzf)

;; Backup files
(setq backup-directory-alist `(("." . "~/.emacs.d/backups")))

;; Shorten yes no prompts
(fset 'yes-or-no-p 'y-or-n-p)

;; Remap next and prev
(global-set-key (kbd "<next>") 'move-end-of-line)
(global-set-key (kbd "<prior>") 'move-beginning-of-line)

; scroll bar disable
(scroll-bar-mode -1)

;; Setting up smooth scrolling

(setq scroll-conservatively 4)
(setq scroll-margin 2)

(setq mouse-wheel-scroll-amount '(1 ((shift) . 1))) ;; one line at a time
(setq mouse-wheel-progressive-speed nil) ;; don't accelerate scrolling    
(setq mouse-wheel-follow-mouse 't) ;; scroll window under mouse


;; Setting up history
(savehist-mode 1)

;; Enabling C-Tab completion
;(global-set-key (kbd "<tab>") 'dabbrev-expand)
;(define-key minibuffer-local-map (kbd "<tab>") 'dabbrev-expand)

;; Enabling IDO for filename completion
(ido-mode 1)
(setq ido-everywhere t)
(setq ido-enable-flex-matching t)

;; Disabling line numbers

;(global-linum-mode f)

;; Electric pair mode
(electric-pair-mode 1)

;; Remember position in file
    
(save-place-mode 1) 


;; Setting up neotree

;(require 'neotree)
  ;(global-set-key [f8] 'neotree-toggle)

;; Setting up evil-mode

(global-evil-leader-mode)
;(require 'evil)
  ;(evil-mode 1)
;(use-package evil)
(evil-mode 1)

(add-to-list 'evil-emacs-state-modes 'neotree-mode 'interactive-haskell-mode)
(evilnc-default-hotkeys)

(evil-leader/set-key
  "b" 'switch-to-buffer
  "'" 'ibuffer
  "k" 'kill-buffer
  "c" 'evilnc-comment-or-uncomment-lines)

;; ibuffer settings
(setq ibuffer-expert t)
(setq ibuffer-show-empty-filter-groups nil)

;; fzf shortcut
(global-set-key (kbd "C-c f") 'fzf)

;; Helm mode config

(require 'helm)
(require 'helm-config)
;; The default "C-x c" is quite close to "C-x C-c", which quits Emacs.
;; Changed to "C-c h". Note: We must set "C-c h" globally, because we
;; cannot change `helm-command-prefix-key' once `helm-config' is loaded.
(global-set-key (kbd "C-c s") 'helm-command-prefix)
(global-unset-key (kbd "C-x c"))

(define-key helm-map (kbd "<tab>") 'helm-execute-persistent-action) ; rebind tab to run persistent action
(define-key helm-map (kbd "C-i") 'helm-execute-persistent-action) ; make TAB work in terminal
(define-key helm-map (kbd "C-z")  'helm-select-action) ; list actions using C-z

(when (executable-find "curl")
  (setq helm-google-suggest-use-curl-p t))

(setq helm-split-window-in-side-p           t ; open helm buffer inside current window, not occupy whole other window
      helm-move-to-line-cycle-in-source     t ; move to end or beginning of source when reaching top or bottom of source.
      helm-ff-search-library-in-sexp        t ; search for library in `require' and `declare-function' sexp.
      helm-scroll-amount                    8 ; scroll 8 lines other window using M-<next>/M-<prior>
      helm-ff-file-name-history-use-recentf t
      helm-echo-input-in-header-line t)

;; (defun spacemacs//helm-hide-minibuffer-maybe ()
;;   "Hide minibuffer in Helm session if we use the header line as input field."
;;   (when (with-helm-buffer helm-echo-input-in-header-line)
;;     (let ((ov (make-overlay (point-min) (point-max) nil nil t)))
;;       (overlay-put ov 'window (selected-window))
;;       (overlay-put ov 'face
;;                    (let ((bg-color (face-background 'default nil)))
;;                      `(:background ,bg-color :foreground ,bg-color)))
;;       (setq-local cursor-type nil))))

(setq helm-autoresize-max-height 0)
(setq helm-autoresize-min-height 20)
(helm-autoresize-mode 1)

(helm-mode 1)


;; Setting up Org Mode
;(require 'org)
(setq org-format-latex-options (plist-put org-format-latex-options :scale 1.35))

(add-hook 'org-mode-hook
  (lambda ()
    (evil-leader/set-key "i" 'org-insert-heading)
  )          
)

(add-hook 'org-mode-hook (lambda () (linum-mode 0)))

;; active Babel languages
(org-babel-do-load-languages
 'org-babel-load-languages
 '((python . t)
   ;; (bash . t)
   ))

(setq org-src-fontify-natively t)

(setq linum-format "%4d \u2502 ")

;; Markdown config
(add-hook 'markdown-mode-hook 'turn-on-flyspell)
(add-hook 'markdown-mode-hook
          (lambda () (local-set-key (kbd "<S-iso-lefttab>") 'dabbrev-expand)))
(add-hook 'markdown-mode-hook (lambda () (linum-mode 0)))

;; Haskell mode hooks
;; (add-hook 'haskell-mode-hook 'haskell-indent-mode)
;; (add-hook 'haskell-mode-hook 'interactive-haskell-mode)
;; (add-hook 'interactive-haskell-mode-hook (lambda () (linum-mode 0)))

;; AUCTeX config
(setq TeX-auto-save t)
(setq TeX-parse-self t)
(setq TeX-PDF-mode t)
(setq ispell-program-name "aspell") ; could be ispell as well, depending on your preferences
(setq ispell-dictionary "english") ; this can obviously be set to any language your spell-checking program supports

(add-hook 'LaTeX-mode-hook 'flyspell-mode)
(add-hook 'LaTeX-mode-hook 'flyspell-buffer)
(add-hook 'LaTeX-mode-hook (lambda () (linum-mode 0)))
(add-hook 'LaTeX-mode-hook 'turn-on-reftex)
(add-hook 'LaTeX-mode-hook
          (lambda () (local-set-key (kbd "<backtab>") 'dabbrev-expand)))
(setq reftex-plug-into-AUCTeX t)
;(add-hook 'LaTeX-mode-hook 'turn-on-auto-fill)

(eval-after-load "tex"
  '(add-to-list 'TeX-command-list
		'("xelatexmk" "latexmk -xelatex %s" TeX-run-command t t :help "Run latexmk with xelatex") t))
;(require 'auctex-latexmk)
    (auctex-latexmk-setup)
(add-hook 'TeX-mode-hook 
      (lambda () 
        (setq TeX-command-default "LatexMk")))

(add-hook 'LaTeX-mode-hook 
      (lambda () 
        (setq TeX-command-default "LatexMk")))

(add-hook 'LaTeX-mode-hook
      (lambda ()
        (evil-leader/set-key
          "s" 'LaTeX-section
          "m" 'TeX-insert-macro
          "e" 'LaTeX-environment)))


;; Moving between panes

(global-set-key (kbd "C-x <up>") 'windmove-up)
(global-set-key (kbd "C-x <down>") 'windmove-down)
(global-set-key (kbd "C-x <left>") 'windmove-left)
(global-set-key (kbd "C-x <right>") 'windmove-right)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(TeX-view-program-list (quote (("Zathura" "zathura %o"))))
 '(TeX-view-program-selection (quote ((output-pdf "Zathura"))))
 '(column-number-mode t)
 '(fill-column 100)
 '(org-M-RET-may-split-line (quote ((default))))
 '(org-startup-truncated nil)
 '(package-selected-packages
   (quote
    (fzf helm markdown-mode tex use-package neotree monokai-theme evil-nerd-commenter evil-leader auctex-latexmk)))
 '(save-place-mode t)
 '(show-paren-mode t)
 '(smooth-scrolling-mode t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;; Custom themes

(load-theme 'monokai t)

;; Font size

(set-face-attribute 'default nil :height 105)

;; Disabling the menu bar

(menu-bar-mode -1)
(tool-bar-mode -1)
