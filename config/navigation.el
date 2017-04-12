(use-package helm
  :config
					; Fix the Helm buffers to a size
					; of 20.
  (setq helm-autoresize-max-height 20)
  (setq helm-autoresize-min-height 20)
  (helm-autoresize-mode 1)

  :bind (("M-x"     . helm-M-x)
	 ("<menu>"  . helm-M-x)
	 ("C-x C-b" . helm-buffers-list)
	 ("C-x C-f" . helm-find-files)
	 :map helm-map
	 ("<tab>" . helm-execute-persistent-action)
	 ("C-i" . helm-execute-persistent-action) ; Same, for terminal.
	 ("C-z" . helm-select-action)))
