;; ==============================================
;; GRAPHICAL STUFF
;; ==============================================
(menu-bar-mode 0)
(tool-bar-mode 0)
(scroll-bar-mode 0)
(setq inhibit-startup-screen t)
(setq use-dialog-box nil)
(add-hook 'prog-mode-hook
	  (lambda () (idle-highlight-mode t)))
(when (version<= "26.0.502" emacs-version)
  (global-display-line-numbers-mode))

(add-to-list 'custom-theme-load-path "~/.emacs.d/themes")
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector
   [default default default italic underline success warning error])
 '(ansi-color-names-vector
   ["#454545" "#d65946" "#6aaf50" "#baba36" "#598bc1" "#ab75c3" "#68a5e9" "#bdbdb3"])
 '(case-fold-search t)
 '(custom-enabled-themes (quote (granger)))
 '(custom-safe-themes
   (quote
    ("eeae1f1e944b3517c90456b13e31a3786d22b24166540255484f3371ab2a0dcc" "f146ffc1b0aec42c5e4d0eaaed45f28bac0183baed8313437368bf37f8fa4411" "a36622434f21e7aace2a71a6cfedbe86dd9e012f584db4a88e11b03108270902" "3220f7e765c699bc04bb2ad9ee3a7ed78bb2490bc9e7a173a77f74b995d0defc" "0e3a7d1a41005bef2c37bf0e1bf3f780c375e675bb57bb6edb4d3e4278329785" "8e4f53b832f5d9ecfdb5faaf68ecfb33d8ac070518dbefde35755e4d7ce61e27" "f8c36b81e754f0421c937a10c1b7cb1e8c2d36ab728a021f1eb90bed38450240" "a16fc5777b99f592e47c9c9f9f09ee098e27bbc87c6540486368fa363f9ccae8" "3b11ab02a8b96f4f4eb67aec91dfc8afc3364f2605eabb54198763325dc8ae7e" "de2b53d3fb8d65566acd9f30a9972380d81b6ff69880c86ae01d253ee4d3e2a3" "72a81c54c97b9e5efcc3ea214382615649ebb539cb4f2fe3a46cd12af72c7607" default)))
 '(fringe-mode 10 nil (fringe))
 '(magit-todos-ignore-case t)
 '(magit-todos-scanner (quote magit-todos--scan-with-rg))
 '(main-line-color1 "#222232")
 '(main-line-color2 "#333343")
 '(package-selected-packages
   (quote
    (php-mode emmet-mode company-web company-lua company-c-headers yasnippet-snippets yasnippet flycheck idle-highlight-mode expand-region pcre2el hl-todo f el-get anaphora a ripgrep swiper ac-html-csswatcher ivy multiple-cursors company projectile markdown-preview-mode markdown-mode lua-mode drag-stuff magit popup ace-window)))
 '(powerline-color1 "#222232")
 '(powerline-color2 "#333343"))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(idle-highlight ((t (:background "#5C88AD" :foreground "black"))))
 '(region ((t (:background "#0000FF" :foreground "white")))))

(add-to-list 'load-path "~/.emacs.d/packages/")
(package-initialize)


;; ==============================================
;; EDITING
;; ==============================================
(global-unset-key [(control z)])
(global-set-key [(control z)] 'undo)
(global-unset-key (kbd "M-r"))
(global-set-key (kbd "M-r") 'query-replace)

;; EXPAND_REGION
(global-set-key (kbd "M-,") 'er/expand-region)

;; MULTIPLE_CURSORS
(global-unset-key (kbd "M-c"))
(global-set-key (kbd "M-c") 'mc/edit-lines)
(global-unset-key (kbd "M-<down-mouse-1>"))
(global-set-key (kbd "M-<mouse-1>") 'mc/add-cursor-on-click)


;; ==============================================
;; NAVIGATION
;; ==============================================
(setq aw-dispatch-always t)
(global-set-key (kbd "M-o") 'ace-window)
(global-set-key (kbd "M-n") 'next-line)
(global-set-key (kbd "M-p") 'previous-line)

;; BUFFER_MOVE
(require 'buffer-move)

;; LINE_ABOVE
(defun line-above ()
  (interactive)
  (move-beginning-of-line nil)
  (newline-and-indent)
  (forward-line -1)
  (indent-according-to-mode))
(global-set-key (kbd "<C-S-return>") 'line-above)

;; LINE_BELOW
(defun line-below ()
  (interactive)
  (move-end-of-line nil)
  (newline-and-indent)
  (forward-line 0)
  (indent-according-to-mode))
(global-set-key (kbd "<C-return>") 'line-below)

;; DRAG_STUFF
(require 'drag-stuff)
(drag-stuff-mode t)
(drag-stuff-global-mode 1)
(drag-stuff-define-keys)

;; ACE_JUMP
(add-to-list 'load-path "~/.emacs.d/packages/ace-jump-mode.el/in/")
(autoload
  'ace-jump-mode
  "ace-jump-mode"
  "Emacs quick move minor mode"
  t)
(define-key global-map (kbd "M-s") 'ace-jump-mode)

;; GOTO_LINE
(global-unset-key (kbd "M-l"))
(global-set-key (kbd "M-l") 'goto-line)

;; PROJECTILE
(global-unset-key (kbd "C-o"))
(global-set-key (kbd "C-o") 'projectile-find-file)

;; IVY_FAMILY
(add-hook 'after-init-hook 'ivy-mode)
(global-set-key (kbd "C-s") 'swiper)


;; ==============================================
;; PROGRAMMING LANGUAGES SUPPORT
;; ==============================================
(add-hook 'after-init-hook 'global-company-mode)
(yas-global-mode 1)

(eval-after-load 'company
  '(add-to-list
    'company-backends '(company-c-headers
			company-lua
			company-web-html
			)))

(add-hook 'sgml-mode-hook 'emmet-mode)
(global-set-key (kbd "<C-return>") 'line-below)

(require 'company-web-html)

(setq lua-indent-level 2)


;; ==============================================
;; MISCELLANEOUS
;; ==============================================
(setq read-file-name-completion-ignore-case t)
(setq select-enable-clipboard t)
(electric-pair-mode 1)

(require 'package)
;;(add-to-list 'package-archives
;;             '("melpa-stable" . "http://stable.melpa.org/packages/") t)
(add-to-list 'package-archives
             '("melpa" . "http://melpa.org/packages/") t)

;;(add-to-list 'package-archives
;;	     '("melpa" . "http://melpa.milkbox.net/packages/") t)

;; MAGIT
(global-set-key (kbd "M-g") 'magit-status)
(add-to-list 'load-path "~/.emacs.d/packages/magit-todos.el/in/")
(require 'magit-todos)
(add-hook 'after-init-hook 'magit-todos-mode)

;; FLYCHECK
(add-hook 'after-init-hook #'global-flycheck-mode)
(setq-default flycheck-disabled-checkers '(emacs-lisp-checkdoc emacs-lisp))
(add-to-list 'display-buffer-alist
             `(,(rx bos "*Flycheck errors*" eos)
              (display-buffer-reuse-window
               display-buffer-in-side-window)
              (side            . bottom)
              (reusable-frames . visible)
              (window-height   . 0.20)))

;; RESHAPING_WINDOWS
(global-set-key (kbd "<C-up>") 'enlarge-window)
(global-set-key (kbd "<C-down>") 'shrink-window)
(global-set-key (kbd "<C-left>") 'enlarge-window-horizontally)
(global-set-key (kbd "<C-right>") 'shrink-window-horizontally)
