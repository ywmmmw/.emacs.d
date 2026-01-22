(use-package treemacs
  :ensure t
  :defer t
  :bind (
    ("C-x m" . 'treemacs)
  )
  :config
  (progn
    (setq
     treemacs-no-png-images t)
  )
)

(provide 'init-treemacs)
