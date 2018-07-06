;; Dashboard configuration
(use-package dashboard
  :config
  (dashboard-setup-startup-hook)
  (setq initial-buffer-choice (lambda () (get-buffer "*dashboard*")))
  (setq dashboard-startup-banner 2)
  (setq show-week-agenda-p t)
  (setq dashboard-items '(
			  (agenda . 10)
			  (bookmarks . 10)
			  ;; (recents  . 10)
			  )
	)
  (add-hook 'dashboard-mode-hook
	    (lambda ()
	      (local-set-key (kbd "o") 'org-capture)
	      )
	    )
  (add-hook 'dashboard-mode-hook
	    (lambda ()
	      (local-set-key (kbd "p") 'org-agenda)
	      )
	    )

  )
