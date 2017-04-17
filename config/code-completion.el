

;;  M-n              -- Select next
;;  M-p              -- Select prev
;; <return>          -- complete
;; <tab>             -- complete the common part.
;; C-s, C-r and C-o. -- Search through the completions
;; M-(digit)         -- quickly complete with one of the first 10 candidates.
;; <f1>              -- Display doc for the selected candidate.
;; C-w               -- Display source for the selected candidate.
(use-package company
  :config
  (add-hook 'after-init-hook 'global-company-mode)
  (require 'company-elisp)

  :init
  (setq company-auto-complete t
	company-idle-delay    0.2
	company-auto-complete 'company-explicit-action-p))
