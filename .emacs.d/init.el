; Hide the welcome message.
(setq inhibit-startup-message t)
; Visible bell instead of beeping.
(setq-default visible-bell t)
; Enable standard shortcuts (CUA mode).
(cua-mode t)
(setq cua-auto-tabify-rectangles nil) ;; Don't tabify after rectangle commands
(transient-mark-mode 1) ;; No region when it is not highlighted
(setq cua-keep-region-after-copy t) ;; Standard Windows behaviour
; Keyboard shortcuts for managing splits.
(global-set-key (kbd "C-|") 'split-window-right)
(global-set-key (kbd "C-_") 'split-window-below)
(global-set-key (kbd "C-W") 'delete-window)
(global-set-key (kbd "C-S-<left>") 'windmove-left)
(global-set-key (kbd "C-S-<right>") 'windmove-right)
(global-set-key (kbd "C-S-<up>") 'windmove-up)
(global-set-key (kbd "C-S-<down>") 'windmove-down)
(global-set-key (kbd "C-R") 'eval-buffer)
; Hide the toolbar.
(tool-bar-mode -1)
; Set Consolas as the default font.
(set-face-attribute 'default nil :family "Consolas" :height 110)
; Change the background for the statusbar/modeline.
(set-face-background 'mode-line "#F0F0FF")

(load-theme 'wombat)
(custom-set-faces
  '(term-color-blue ((t (:foreground "#607CF0"))))
)

(add-to-list 'load-path "~/.emacs.d/lisp/")
(setq fakecygpty-program "C:/do/cygwin/bin/fakecygpty.exe")
(setq facecygpty-qkill-program "C:/do/cygwin/bin/fakecygpty.exe")
(require 'fakecygpty)
(fakecygpty-activate)

;; Make sure that the bash executable can be found
(setq explicit-shell-file-name "C:/do/cygwin/bin/zsh.exe")
(setq shell-file-name explicit-shell-file-name)
(add-to-list 'exec-path "C:/do/cygwin/bin")
