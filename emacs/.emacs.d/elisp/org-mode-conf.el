;; Setting up Org Mode

(use-package org
  :config
  (setq org-format-latex-options (plist-put org-format-latex-options :scale 1.35))

  (add-hook 'org-mode-hook
	    (lambda ()
	      (evil-leader/set-key "i" 'org-insert-heading)
	      )          
	    )

  (evil-leader/set-key "p" 'org-agenda)
  (evil-leader/set-key "o" 'org-capture)
  
  (custom-set-variables
   '(org-directory "~/OrgMode")
   '(org-default-notes-file (concat org-directory "/notes.org"))
   '(org-export-html-postamble nil)
   '(org-hide-leading-stars t)
   '(org-startup-folded (quote overview))
   '(org-startup-indented t)
   )
  
  (setq org-refile-targets '((nil :maxlevel . 3)
                             (org-agenda-files :maxlevel . 3)))
  
  (setq org-agenda-files (list "~/OrgMode/main.org"))
  
  (setq org-capture-templates
	'(("l" "Link" entry (file+headline "~/OrgMode/links.org" "Uncategorized links")
           "* %? %^L %^G \n%T" :prepend t)
          ("b" "Blog idea" entry (file+headline "~/OrgMode/main.org" "Blog Topics")
           "* %? %^G \n%U" :prepend t)
          ("t" "To Do Item" entry (file+headline "~/OrgMode/main.org" "To Do")
           "* TODO %? %^G \n%U" :prepend t)
          ("i" "Item" entry (file+headline "~/OrgMode/main.org" "Uncategorized")
           "* %? %^G \n%U" :prepend t)
  	  ("n" "Note" entry (file+headline "~/OrgMode/notes.org" "Uncategorized notes")
           "* %? %^G \n%u" :prepend t)
  	  ))
  
  (setq org-todo-keywords
	'((sequence "TODO" "NEXT" "WAITING" "|" "INACTIVE" "CANCELLED" "DONE")))
  
  (setq org-todo-keyword-faces
	'(
	  ;; ("TODO" . org-warning)
	  ("NEXT" . "yellow")
	  ("WAITING" . "orange")
	  ))
  
  (defadvice org-capture-finalize
      (after delete-capture-frame activate)
    "Advise capture-finalize to close the frame"
    (if (equal "capture" (frame-parameter nil 'name))
	(delete-frame)))
  
  (defadvice org-capture-destroy
      (after delete-capture-frame activate)
    "Advise capture-destroy to close the frame"
    (if (equal "capture" (frame-parameter nil 'name))
	(delete-frame)))
  
  ;; (use-package noflet)
  ;; (defun make-capture-frame ()
  ;;   "Create a new frame and run org-capture."
  ;;   (interactive)
  ;;   (make-frame '((name . "capture")))
  ;;   (select-frame-by-name "capture")
  ;;   (delete-other-windows)
  ;;   (noflet ((switch-to-buffer-other-window (buf) (switch-to-buffer buf)))
  ;;           (org-capture)))
  
  (org-babel-do-load-languages
   'org-babel-load-languages
   '((python . t)
     ;; (bash . t)
     ))

  (setq org-src-fontify-natively t)
  
  (setq linum-format "%4d \u2502 ")
  )
