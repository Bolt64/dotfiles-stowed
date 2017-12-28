;; Markdown config
(add-hook 'markdown-mode-hook 'turn-on-flyspell)
(add-hook 'markdown-mode-hook
          (lambda () (local-set-key (kbd "<S-iso-lefttab>") 'dabbrev-expand)))
;(add-hook 'markdown-mode-hook (lambda () (linum-mode 0)))
