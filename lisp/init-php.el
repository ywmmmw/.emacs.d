;;; package --- Summary
;;; Commentary:
;;; Code:


(use-package php-mode :ensure t)

;; (use-package web-mode
;;   :ensure t
;;   :mode (
;; 	 ".php$"
;; 	 ".html?$"
;; 	 )
;;   :custom
;;   (web-mode-markup-indent-offset 4)
;;   (web-mode-css-indent-offset 4)
;;   (web-mode-code-indent-offset 4)
;;   )

(use-package php-cs-fixer
  :ensure t
 )

(provide 'init-php)


