(cua-mode 1)

(use-package flycheck
  :init
  (global-flycheck-mode))

(use-package aggressive-indent-mode
  (global-aggressive-indent-mode 1)
  (add-to-list 'aggressive-indent-excluded-modes 'haskell-mode))
