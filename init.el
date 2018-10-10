
;; package.el config ---------------------------------------------------------

(require 'package)
(package-initialize)

(setq package-archives
      '(("melpa-stable" . "http://stable.melpa.org/packages/")
        ("gnu"          . "https://elpa.gnu.org/packages/")))

;; Download a copy of the package archive (only for the first time).
(when (not package-archive-contents)
  (package-refresh-contents))

;; use-package ---------------------------------------------------------------

(eval-when-compile

  (unless (package-installed-p 'use-package)
    (package-install 'use-package))

  (require 'use-package)

  ;; Ensure every declared dep is installed
  (setq use-package-always-ensure t))

;; Navigation ----------------------------------------------------------------

;; Toggle fullscreen:
(if (display-graphic-p)
    (global-set-key (kbd "<C-return>") 'toggle-frame-fullscreen))

(use-package helm
  :diminish helm-mode
  :bind (("C-x C-f" . helm-find-files)
	 ("M-x"     . helm-M-x)
	 ("C-x b"   . helm-mini) 
	 ("M-y"     . helm-show-kill-ring)
	 :map helm-map
	 ("<tab>"   . helm-execute-persistent-action))
  :config
  (setq helm-buffers-fuzzy-matching t
	helm-recentf-fuzzy-match    t)
  (helm-mode 1))

;; Evil Mode -----------------------------------------------------------------

(use-package evil
  :config
  (define-key evil-normal-state-map ";" 'evil-ex)
  (define-key evil-visual-state-map ";" 'evil-ex)
  (evil-mode))

;; Looks ---------------------------------------------------------------------

;; Declutter emacs
(load "~/.emacs.d/config/declutter")

(use-package dracula-theme
  :config
  (load-theme 'dracula))

;; Lang: Python --------------------------------------------------------------

(use-package elpy
  :init
  (add-hook 'python-mode-hook 'elpy-mode))
