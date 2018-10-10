
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
    (global-set-key (kbd "<S-return>") 'toggle-frame-fullscreen))

(use-package helm
  :diminish helm-mode
  :bind (("C-x C-f" . helm-find-files)
         ("C-p"     . helm-find-files)
         ("M-x"     . helm-M-x)
         ("C-x b"   . helm-mini) 
         ("M-y"     . helm-show-kill-ring)
         :map helm-map
         ("<tab>"   . helm-execute-persistent-action))
  :init
  (setq helm-buffers-fuzzy-matching t
        helm-recentf-fuzzy-match    t)
  (helm-mode 1))

(use-package helm-ag
  :config
  (setq helm-ag-base-command "rg --nocolor --nogroup --ignore-case"))

;; org-mode ------------------------------------------------------------------

;; Keep the same size on different files.
(custom-set-faces
  '(org-document-title ((t (:inherit org-document-title :height 1.0))))
  '(org-level-1        ((t (:inherit outline-1          :height 1.0))))
  '(org-level-2        ((t (:inherit outline-2          :height 1.0))))
  '(org-level-3        ((t (:inherit outline-3          :height 1.0))))
  '(org-level-4        ((t (:inherit outline-4          :height 1.0))))
  '(org-level-5        ((t (:inherit outline-5          :height 1.0)))))

;; Mac Os --------------------------------------------------------------------

(if (string-equal system-type "darwin")
    (progn
  ;; Don't modify the behavior of the right option key so I can
  ;; write in German or Spanish.
      (setq ns-right-alternate-modifier 'none)))

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
  (load-theme 'dracula)
  (set-background-color "#222"))

;; System --------------------------------------------------------------------

(defun my/add-to-path-front
    (dir)
    "Add a directory 'dir to both the PATH and exec-path"
    (progn
      (setenv "PATH" (concat dir ";" (getenv "PATH")))
      (add-to-list 'exec-path dir)))

; Mac Os: add Brew paths:
(if (string-equal system-type "darwin")
    (progn
      (my/add-to-path-front "/usr/local/sbin")
      (my/add-to-path-front "/usr/local/bin")))

;; Lang: Python --------------------------------------------------------------

(use-package elpy
  :init
  (add-hook 'python-mode-hook 'elpy-mode))

;; Lang: Lisp ----------------------------------------------------------------

(use-package paredit)

;;(use-package parinfer
;;  :ensure t
;;  :bind (("C-," . parinfer-toggle-mode))
;;  :init
;;  (progn
;;    (setq parinfer-extensions
;;          '(defaults       ; should be included.
;;             ;pretty-parens  ; different paren styles for different modes.
;;             evil))           ; If you use Evil.
;;             ;smart-tab      ; C-b & C-f jump positions and smart shift with tab & S-tab.
;;             ;smart-yank))   ; Yank behavior depend on mode.
;;    (dadd-hook 'clojure-mode-hook #'parinfer-mode)
;;    (add-hook 'emacs-lisp-mode-hook #'parinfer-mode)
;;    (add-hook 'common-lisp-mode-hook #'parinfer-mode)
;;    (add-hook 'scheme-mode-hook #'parinfer-mode)
;;    (add-hook 'lisp-mode-hook #'parinfer-mode)))
