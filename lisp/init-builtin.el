;; 快速打开配置文件
(defun open-init-file()
  (interactive)
  (find-file "~/.emacs.d/init.el"))

;; 自动打开文件的外部修改
(global-auto-revert-mode 1)

;; 创建备份文件夹
(make-directory "~/.emacs.d/autosaves/" t)
(make-directory "~/.emacs.d/backups/" t)

;; 修改备份文件的位置
(custom-set-variables
  '(auto-save-file-name-transforms '((".*" "~/.emacs.d/autosaves/" t)))
  '(backup-directory-alist '((".*" . "~/.emacs.d/backups/"))))

;; 'yes or no' replace to 'y or n'
(fset 'yes-or-no-p 'y-or-n-p)

;; 高亮当前行
;;(global-hl-line-mode 1)

;; 关闭启动帮助画面
(setq inhibit-splash-screen 1)


; 自动补全括号
(electric-pair-mode t)

; 编程模式下，光标在括号上时高亮另一个括号
(add-hook 'prog-mode-hook #'show-paren-mode)

; 在 Mode line 上显示列号
(column-number-mode t)

; 选中文本后输入文本会替换文本（更符合我们习惯了的其它编辑器的逻辑）
(delete-selection-mode t)

; 编程模式下，可以折叠代码块
(add-hook 'prog-mode-hook #'hs-minor-mode)

;关闭 Tool bar
(tool-bar-mode -1)
(menu-bar-mode -1)


(provide 'init-builtin)
