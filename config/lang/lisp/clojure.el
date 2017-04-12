(use-package clojure-mode)

(use-package cider
  :init
  ;; Location of the boot and lein executables.
  (customize-set-variable 'cider-boot-command "~/.local/bin/boot")
  (customize-set-variable 'cider-lein-command "~/.local/bin/lein"))

;; Add clojure-related modes to the lisp-family-hook
(add-hook 'clojure-mode-hook    #'run-lisp-family-hook)
(add-hook 'cider-repl-mode-hook #'run-lisp-family-hook)
