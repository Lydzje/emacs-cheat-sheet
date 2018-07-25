;; ==============================================
;; GRAPHICAL STUFF
;; ==============================================
(menu-bar-mode 0)
(tool-bar-mode 0)
(scroll-bar-mode 0)
(setq inhibit-startup-screen t)
(when (version<= "26.0.502" emacs-version)
  (global-display-line-numbers-mode))

(add-to-list 'custom-theme-load-path "~/.emacs.d/themes")
(custom-set-variables
 '(ansi-color-faces-vector
   [default default default italic underline success warning error])
 '(ansi-color-names-vector
   ["#454545" "#d65946" "#6aaf50" "#baba36" "#598bc1" "#ab75c3" "#68a5e9" "#bdbdb3"])
 '(custom-enabled-themes (quote (granger)))
 '(custom-safe-themes
   (quote
    ("3b11ab02a8b96f4f4eb67aec91dfc8afc3364f2605eabb54198763325dc8ae7e" "de2b53d3fb8d65566acd9f30a9972380d81b6ff69880c86ae01d253ee4d3e2a3" "72a81c54c97b9e5efcc3ea214382615649ebb539cb4f2fe3a46cd12af72c7607" default)))
 '(fringe-mode 10 nil (fringe))
 '(main-line-color1 "#222232")
 '(main-line-color2 "#333343")
 '(package-selected-packages (quote (magit popup ace-window)))
 '(powerline-color1 "#222232")
 '(powerline-color2 "#333343"))
(custom-set-faces)

;; ==============================================
;; EDITING
;; ==============================================
(global-unset-key [(control z)])
(global-set-key [(control z)] 'undo)


;; ==============================================
;; NAVIGATION
;; ==============================================
(add-to-list 'load-path "~/.emacs.d/packages/")
(global-set-key (kbd "M-o") 'ace-window)
(setq aw-dispatch-always t)


;; ==============================================
;; MISCELLANEOUS
;; ==============================================
(setq read-file-name-completion-ignore-case t)
(require 'package)
;; MAGIT
(add-to-list 'package-archives
             '("melpa-stable" . "http://stable.melpa.org/packages/") t)
(global-set-key (kbd "M-g") 'magit-status)

