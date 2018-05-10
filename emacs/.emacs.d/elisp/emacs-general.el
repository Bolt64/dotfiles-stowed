;; General emacs options

;; Backup files
(setq backup-directory-alist `(("." . "~/.emacs.d/backups")))

;; Shorten yes no prompts
(fset 'yes-or-no-p 'y-or-n-p)

;; Remap next and prev
(global-set-key (kbd "<next>") 'move-end-of-line)
(global-set-key (kbd "<prior>") 'move-beginning-of-line)

; scroll bar disable
(scroll-bar-mode -1)

;; Disabling the menu bar
(menu-bar-mode -1)
(tool-bar-mode -1)

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

;; Electric pair mode
(electric-pair-mode 1)

;; Remember position in file
(save-place-mode 1) 

;; Moving between panes
(global-set-key (kbd "C-x <up>") 'windmove-up)
(global-set-key (kbd "C-x <down>") 'windmove-down)
(global-set-key (kbd "C-x <left>") 'windmove-left)
(global-set-key (kbd "C-x <right>") 'windmove-right)

;; Custom themes
(use-package monokai-theme
  :config
  (load-theme 'monokai t)
  )

;; Font size
(set-face-attribute 'default nil :height 105)

;; Replace ding bell with visual alarm
(setq visible-bell 1)

;; Set proper frame title
(setq-default frame-title-format '("%b [%m]"))
