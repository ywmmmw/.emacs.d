(with-eval-after-load 'dired
  ;; --- 1. 基础视觉精简 ---
  ;; -a: 显示隐藏文件  -l: 列表格式  -h: 易读的大小单位
  ;; -g: 隐藏所有者信息 -o: 隐藏组信息 (节省 TUI 横向空间)
  ;; --group-directories-first: 文件夹排在前面
  (setq dired-listing-switches "-algho --group-directories-first")
  
  ;; 默认开启详情隐藏模式，只看文件名
  (add-hook 'dired-mode-hook 'dired-hide-details-mode)
  
  ;; --- 2. 方案 A：单 Buffer 跳转逻辑 ---
  ;; 允许执行 dired-find-alternate-file (默认是禁用的)
  (put 'dired-find-alternate-file 'disabled nil)

  ;; 重新绑定TAB键：进入目录并关闭当前目录 Buffer
  (define-key dired-mode-map (kbd "TAB") 'dired-find-alternate-file)

  ;; 重新绑定 backspace 键：返回上级目录并关闭当前目录 Buffer
  (define-key dired-mode-map (kbd "DEL")
    (lambda () (interactive) (find-alternate-file "..")))
  (define-key dired-mode-map [backspace]
    (lambda () (interactive) (find-alternate-file "..")))

  ;; --- 3. 操作功能性增强 ---
  ;; 智能双栏目标：如果左右开了两个 Dired，拷贝/移动时自动选对侧为目标
  (setq dired-dwim-target t)

  ;; 开启 Dired-X 扩展功能（内置）
  (require 'dired-x)
  ;; 默认隐藏特定的文件（如 .pyc, .o, .git 等）
  ;; 按 M-o 可以随时切换显示/隐藏这些文件
  (setq dired-omit-files "^\\..*\\|(?i)^#.*#$\\|(?i)^\\..*\\.swp$")
  (add-hook 'dired-mode-hook 'dired-omit-mode))

(use-package dired-preview
  :ensure t
  :after dired
  :custom
  (dired-preview-delay 0.7)           ; 延迟预览，防止快速移动时卡顿
  (dired-preview-max-size 10240)      ; 超过 10KB 的文件不预览
  ;; 过滤掉在 TUI 下可能乱码的二进制文件
  (dired-preview-ignored-extensions-regexp "\\.\\(png\\|jpg\\|jpeg\\|pdf\\|gz\\|zip\\|exe\\|7z\\)$")
  :config
  ;; 预览窗口布局：显示在右侧，宽度占 60%

  (defun my-dired-preview-to-the-right ()
  "My preferred `dired-preview-display-action-alist-function'."
  '((display-buffer-in-side-window)
    (side . right)
    (window-width . 0.6)))

  (setq dired-preview-display-action-alist #'my-dired-preview-to-the-right)
  
  ;; 开启全局预览模式
  (dired-preview-global-mode 1))

(provide 'init-dired)
