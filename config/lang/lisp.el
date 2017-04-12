
;;;; lisp-family-hook
;;;; A common hook for every flavor of lisp.

					; Create a hook for configuration
					; common to all the lisp modes.
(defvar lisp-family-hook
  nil ; Empty for now.
  "Hook to be called after starting any LISP related mode.")

					; Create a function to run that hook.
(defun run-lisp-family-hook ()
  "Function to run the `lisp-family-hook`. Should be added to every
  LISP-related mode hook."
  (run-hooks 'lisp-family-hook))

					; Attach it to some built in lisp
					; related mode hooks.
(add-hook 'lisp-mode-hook                        #'run-lisp-family-hook)
(add-hook 'lisp-interaction-mode-hook            #'run-lisp-family-hook)
(add-hook 'emacs-lisp-mode-hook                  #'run-lisp-family-hook)
(add-hook 'eval-expression-minibuffer-setup-hook #'run-lisp-family-hook)
(add-hook 'scheme-mode-hook                      #'run-lisp-family-hook)


;;;; Paredit

(use-package paredit
  :config
  ;; Enable paredit in every lisp-related major mode.
  (add-hook 'lisp-family-hook #'enable-paredit-mode))


;;;; Rainbow delimiters
(use-package rainbow-delimiters
  :config
  (add-hook 'lisp-family-hook 'rainbow-delimiters-mode)
  ;; Make unbalanced parens stand out more.
  (set-face-attribute 'rainbow-delimiters-unmatched-face nil
		      :foreground 'unspecified
		      :inherit    'show-paren-mismatch)
  ;; Rainbow pallete
  (setq rainbow-delimiters-outermost-only-face-count 0)
  (setq rainbow-delimiters-max-face-count 5)

  (set-face-foreground 'rainbow-delimiters-depth-1-face "#ff4f4f")
  (set-face-foreground 'rainbow-delimiters-depth-2-face "#fdbe4c")
  (set-face-foreground 'rainbow-delimiters-depth-3-face "#fafa56")
  (set-face-foreground 'rainbow-delimiters-depth-4-face "#49ff49")
  (set-face-foreground 'rainbow-delimiters-depth-5-face "#87f5ff"))


;; The configurations specific to some lisp-based language should be saved in
;; the `~/.emacs.d/config/lang/lisp` directory.
(load-elisp-files-in-dir "~/.emacs.d/config/lang/lisp")
