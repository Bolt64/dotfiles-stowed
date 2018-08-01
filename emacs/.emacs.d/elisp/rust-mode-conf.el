;; Rust mode conf
(use-package rust-mode)
(add-hook 'rust-mode-hook
          (lambda () (local-set-key (kbd "<backtab>") 'dabbrev-expand)))
