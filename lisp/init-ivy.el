(use-package counsel
  :ensure t
  :bind (("C-s"   . swiper-isearch)
         ("C-r"   . swiper-isearch-backward))
  :hook ((after-init . ivy-mode)
         (ivy-mode . counsel-mode))
  :init
  (setq enable-recursive-minibuffers t) ; Allow commands in minibuffers

  (setq ivy-use-selectable-prompt t
        ivy-use-virtual-buffers t    ; Enable bookmarks and recentf
        ivy-height 10
        ivy-fixed-height-minibuffer t
        ivy-count-format "(%d/%d) "
        ivy-on-del-error-function nil
        ivy-initial-inputs-alist nil)
 
  (setq swiper-action-recenter t)

  (setq counsel-find-file-at-point t
        counsel-yank-pop-separator "\n────────\n")

  (when (executable-find "rg")
    (setq counsel-grep-base-command "rg -S --no-heading --line-number --color never %s %s"))
  )

(use-package ivy-prescient
  :ensure t
  :hook ((after-init . ivy-mode)
         (ivy-mode . ivy-prescient-mode))
    )


(provide 'init-ivy)
