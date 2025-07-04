(setq package-enable-at-startup nil) ;; Prevent early package loading
(require 'package)
(add-to-list 'package-archives '("gnu" . "https://elpa.gnu.org/packages/") t)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)

(unless package-archive-contents
  (package-refresh-contents))

;; (unless (package-installed-p 'exec-path-from-shell)
;;   (package-refresh-contents)
;;   (package-install 'exec-path-from-shell))

;; Ensure these packages are installed
(setq package-selected-packages '(company go-mode lsp-mode markdown-mode bubbleberry-theme treemacs lsp-treemacs))
(dolist (pkg package-selected-packages)
  (unless (package-installed-p pkg)
    (package-install pkg)))

(when (memq window-system '(mac ns x))
  (require 'exec-path-from-shell)
  (exec-path-from-shell-initialize))


;; Setup Go with LSP
(require 'lsp-mode)
(add-hook 'go-mode-hook #'lsp)
(add-hook 'c-mode-hook #'lsp)

;; Setup theme
;; (load-theme 'catppuccin :no-confirm)
(load-theme 'inkpot :no-confirm)

;; Setup Treemacs
(require 'treemacs)
(global-set-key [f8] 'treemacs)
(require 'lsp-treemacs)
(lsp-treemacs-sync-mode 1)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages '(treemacs company exec-path-from-shell go-mode lsp-mode)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(menu-bar-mode -1)
(tool-bar-mode -1)
