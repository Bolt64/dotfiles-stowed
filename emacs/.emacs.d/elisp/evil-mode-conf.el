;; Configuration of evil and related packages

(use-package evil
  :ensure t
  :config
  (global-evil-leader-mode)
  (evil-mode 1)
  (add-to-list 'evil-emacs-state-modes 'neotree-mode 'interactive-haskell-mode)
  )

(use-package evil-nerd-commenter
  :ensure t
  :config
  (evilnc-default-hotkeys)
  )

(use-package evil-leader
  :ensure t
  :config
  (evil-leader/set-key
    "b" 'switch-to-buffer
    "'" 'ibuffer
    "k" 'kill-buffer
    "c" 'evilnc-comment-or-uncomment-lines)
  )
