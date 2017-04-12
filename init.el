
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
(defun load-elisp-files-in-dir (DIRPATH)
  "Loads every emacs lisp file in some DIRPATH directory."

  ;; Add `DIRPATH` to the load path if it is not already there.
  (unless (member DIRPATH load-path)
    (add-to-list 'load-path DIRPATH))

  (let (;; Paths of the elisp files in the dir.
	(files-to-load (directory-files DIRPATH
					t ; return absolute paths.
					".+\\.elc?$")))
    (dolist (file files-to-load)
      
      (unless (member file ; if the file is not already loaded.
		      ;; List of files that are already loaded:
		      (mapcar #'car load-history))
	
					; load it
	(load (file-name-sans-extension
	       (file-name-nondirectory
		file)))))))


;; Load the modules in those dirs. To omit files, change their extension or
;; remove them.
(load-elisp-files-in-dir "~/.emacs.d/config/")
(load-elisp-files-in-dir "~/.emacs.d/config/lang")
