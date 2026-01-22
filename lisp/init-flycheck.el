;;; package --- Summary
;;; Commentary:
;;; Code:
(use-package flycheck
  :ensure t
  :hook (after-init . global-flycheck-mode)
  :init (setq flycheck-global-modes
              '(not text-mode outline-mode fundamental-mode lisp-interaction-mode
                    org-mode diff-mode shell-mode eshell-mode term-mode vterm-mode)
              flycheck-emacs-lisp-load-path 'inherit
              ;; Only check while saving and opening files
              flycheck-check-syntax-automatically '(save mode-enabled))
  )

(use-package flycheck-pos-tip
  :ensure t
  :defines flycheck-pos-tip-timeout
  :hook (global-flycheck-mode . flycheck-pos-tip-mode)
  :config (setq flycheck-pos-tip-timeout 30))

(provide 'init-flycheck)
;;; init-flycheck.el ends here
