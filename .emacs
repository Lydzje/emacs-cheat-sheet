;; ==============================================
;; GRAPHICAL STUFF
;; ==============================================
(menu-bar-mode 0)
(tool-bar-mode 0)
(scroll-bar-mode 0)
(setq inhibit-startup-screen t)
(setq use-dialog-box nil)
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
 '(custom-enabled-themes (quote (granger)))
 '(custom-safe-themes
   (quote
    ("8e4f53b832f5d9ecfdb5faaf68ecfb33d8ac070518dbefde35755e4d7ce61e27" "f8c36b81e754f0421c937a10c1b7cb1e8c2d36ab728a021f1eb90bed38450240" "a16fc5777b99f592e47c9c9f9f09ee098e27bbc87c6540486368fa363f9ccae8" "3b11ab02a8b96f4f4eb67aec91dfc8afc3364f2605eabb54198763325dc8ae7e" "de2b53d3fb8d65566acd9f30a9972380d81b6ff69880c86ae01d253ee4d3e2a3" "72a81c54c97b9e5efcc3ea214382615649ebb539cb4f2fe3a46cd12af72c7607" default)))
 '(fringe-mode 10 nil (fringe))
 '(main-line-color1 "#222232")
 '(main-line-color2 "#333343")
 '(package-selected-packages
   (quote
    (markdown-preview-mode markdown-mode lua-mode drag-stuff magit popup ace-window)))
 '(powerline-color1 "#222232")
 '(powerline-color2 "#333343"))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )


;; ==============================================
;; EDITING
;; ==============================================
(global-unset-key [(control z)])
(global-set-key [(control z)] 'undo)


;; ==============================================
;; NAVIGATION
;; ==============================================
(add-to-list 'load-path "~/.emacs.d/packages/")
(setq aw-dispatch-always t)
(global-set-key (kbd "M-o") 'ace-window)
(global-set-key (kbd "M-n") 'next-line)
(global-set-key (kbd "M-p") 'previous-line)

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


;; ==============================================
;; PROGRAMMING LANGUAGES SUPPORT
;; ==============================================
(setq lua-indent-level 2)


;; ==============================================
;; MISCELLANEOUS
;; ==============================================
(setq read-file-name-completion-ignore-case t)
(require 'package)

;; MAGIT
(add-to-list 'package-archives
             '("melpa-stable" . "http://stable.melpa.org/packages/") t)
(global-set-key (kbd "M-g") 'magit-status)
