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
    ("72a81c54c97b9e5efcc3ea214382615649ebb539cb4f2fe3a46cd12af72c7607" default)))
 '(fringe-mode 10 nil (fringe))
 '(main-line-color1 "#222232")
 '(main-line-color2 "#333343")
 '(powerline-color1 "#222232")
 '(powerline-color2 "#333343"))
(custom-set-faces)

;; ==============================================
;; MISCELLANEOUS
;; ==============================================
(setq pcomplete-ignore-case t)
(setq vc-follow-symlinks nil)
