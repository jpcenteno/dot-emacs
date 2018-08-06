
;; package.el config ---------------------------------------------------------


(require 'package)
(package-initialize)

;; Here we define the repos to be used.
(setq package-archives
      '(("melpa-stable" . "http://stable.melpa.org/packages/")
	("gnu"          . "https://elpa.gnu.org/packages/")))

					; Download a copy of the package
					; archive (only for the first time).
(when (not package-archive-contents)
  (package-refresh-contents))

;; use-package ---------------------------------------------------------------

(eval-when-compile

  (unless (package-installed-p 'use-package)
    (package-install 'use-package))

  (require 'use-package)

  ;; Ensure every declared dep is installed
  (setq use-package-always-ensure t))

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


