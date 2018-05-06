;; Enabling IDO

(use-package ido
  :ensure t
  :config
  (ido-mode 1)
  (setq ido-everywhere t)
  (setq ido-enable-flex-matching t)
  )
