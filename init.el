(setq package-archives '(("gnu"    . "https://mirrors.tuna.tsinghua.edu.cn/elpa/gnu/")
                         ("nongnu" . "https://mirrors.tuna.tsinghua.edu.cn/elpa/nongnu/")
                         ("melpa"  . "https://mirrors.tuna.tsinghua.edu.cn/elpa/melpa/")))

(package-initialize)

(eval-when-compile
  ;; Following line is not needed if use-package.el is in ~/.emacs.d
  ;; (add-to-list 'load-path "~/.emacs.d/")
  (add-to-list 'load-path (expand-file-name "lisp" user-emacs-directory)) ;; 设定源码加载路径
  (require 'use-package))

;; 内置功能调整
(require 'init-builtin)

;; 样式
(require 'init-theme)

;; 插件包
(require 'init-packages)

;;自定义配置
(setq custom-file (expand-file-name "custom.el" user-emacs-directory))
(load custom-file)

(provide 'init)
;;; init.el ends here
