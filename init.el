
;; package.el config.

(require 'package)
(package-initialize)

					; Here we define the repos to be used.
(setq package-archives
      '(("melpa-stable" . "http://stable.melpa.org/packages/")
	("gnu"          . "https://elpa.gnu.org/packages/")))

					; Download a copy of the package
					; archive (only for the first time).
(when (not package-archive-contents)
  (package-refresh-contents))

;; use-package for managing dependencies.

					; Install `use-package` (if not
					; present)
(unless (package-installed-p 'use-package)
  (package-install 'use-package))

(require 'use-package)

					; Set ":ensure t" for every required
					; package.
(setq use-package-always-ensure t)

;; Configuration modules

(add-to-list 'load-path "~/.emacs.d/config/")
(add-to-list 'load-path "~/.emacs.d/config/lang")

(load "declutter")
(load "editing")
(load "style")

(load "lisp")
(load "web")
