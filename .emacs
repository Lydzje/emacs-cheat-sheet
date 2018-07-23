;; ==============================================
;; GRAPHICAL STUFF
;; ==============================================
(menu-bar-mode 0)
(tool-bar-mode 0)
(setq inhibit-startup-screen t)
(when (version<= "26.0.502" emacs-version)
  (global-display-line-numbers-mode))

;; ==============================================
;; MISCELLANEOUS
;; ==============================================
(setq pcomplete-ignore-case t)
(setq vc-follow-symlinks nil)
