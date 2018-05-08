;; Setting up Org Mode

(use-package org
  :config
  (setq org-format-latex-options (plist-put org-format-latex-options :scale 1.35))

  (add-hook 'org-mode-hook
	    (lambda ()
	      (evil-leader/set-key "i" 'org-insert-heading)
	      )          
	    )

  (org-babel-do-load-languages
   'org-babel-load-languages
   '((python . t)
     ;; (bash . t)
     ))

  (setq org-src-fontify-natively t)
  
  (setq linum-format "%4d \u2502 ")
  )
