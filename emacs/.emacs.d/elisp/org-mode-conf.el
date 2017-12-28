;; Setting up Org Mode
;(require 'org)
(setq org-format-latex-options (plist-put org-format-latex-options :scale 1.35))

(add-hook 'org-mode-hook
  (lambda ()
    (evil-leader/set-key "i" 'org-insert-heading)
  )          
)

;(add-hook 'org-mode-hook (lambda () (linum-mode 0)))

;; active Babel languages
(org-babel-do-load-languages
 'org-babel-load-languages
 '((python . t)
   ;; (bash . t)
   ))

(setq org-src-fontify-natively t)

(setq linum-format "%4d \u2502 ")
