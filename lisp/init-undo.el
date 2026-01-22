(use-package undo-tree
  :ensure t
  :hook (after-init . global-undo-tree-mode))
  :init
  (setq undo-tree-auto-save-history t)
  (setq undo-tree-history-directory-alist '(("." . "~/.emacs.d/undo")))


(provide 'init-undo)
