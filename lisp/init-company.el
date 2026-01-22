(use-package company
  :ensure t
  :bind (:map company-mode-map
         ("<backtab>" . company-yasnippet)
         :map company-active-map
         ("C-p" . company-select-previous)
         ("C-n" . company-select-next)
         ("<tab>" . company-complete-common-or-cycle)
         ("<backtab>" . my-company-yasnippet)
         :map company-search-map
         ("C-p" . company-select-previous)
         ("C-n" . company-select-next))
  :hook (after-init . global-company-mode)
)

(use-package company-prescient
  :ensure t
  :hook ((after-init . global-company-mode)
	 (global-company-mode . company-prescient-mode))
  )

(provide 'init-company)
