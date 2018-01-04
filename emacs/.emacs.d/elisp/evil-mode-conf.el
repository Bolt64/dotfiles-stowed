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
