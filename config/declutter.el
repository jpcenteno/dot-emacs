;; inhibit startup messages
(setq inhibit-startup-message t)
(setq initial-scratch-message "")
(setq inhibit-splash-screen t)

;; No toolbars
(tool-bar-mode 0)
(menu-bar-mode 0)

;; No bells
(setq visible-bell t)

;; Dont make auto-save or backup files.
(setq auto-save-default nil)
(setq make-backup-files nil)

;; No fringe
(fringe-mode 0)

;; No scrollbar
(scroll-bar-mode 0)

;; Coordinates (instead of space wasting row numbers)
(setq line-number-mode t)
(setq column-number-mode t)

;; Emacs custom vars
					; write the customization code here.
(setq custom-file (expand-file-name "custom.el" user-emacs-directory))

					; Create the custom-file if it does
					; not exist yet.
(unless (file-exists-p custom-file) (write-region "" nil custom-file))

					; load the custom variables from the
					; customization file.
(load custom-file)
