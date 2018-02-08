;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Packages
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(require 'package)

(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))
(add-to-list 'package-archives '("org" . "http://orgmode.org/elpa/"))
(add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/"))


;; Add .emacs/lib folder to the load path
(add-to-list 'load-path (expand-file-name "lib" user-emacs-directory))

;; Load custom functions
(load "evil-split.el")
(load "copy-path.el")
(load "evil-autosave.el")

;; Activate installed packages
(package-initialize)

;; Fetch the list of packages available
(unless package-archive-contents
  (package-refresh-contents))

;; Actual list of packages to install
(setq package-list '(
                     ace-jump-mode
                     ag
                     base16-theme
                     diminish
                     evil
                     evil-args
                     evil-commentary
                     evil-exchange
                     evil-indent-textobject
                     evil-leader
                     evil-magit
                     evil-numbers
                     evil-replace-with-register
                     evil-surround
                     evil-terminal-cursor-changer
                     evil-visualstar
                     exec-path-from-shell
                     flyspell
                     feature-mode
                     git-gutter
                     google-this
                     helm
                     helm-ag
                     helm-projectile
                     key-chord
                     magit
                    markdown-mode
                     navigate
                     projectile
                     rbenv
                     rspec-mode
                     solarized-theme
                     sublime-themes
                     yaml-mode
                     ))

; install the missing packages
(dolist (package package-list)
  (unless (package-installed-p package)
    (package-install package)))

;; Load env vars from shell (usefull for getting right PATH on Mac)
(when (memq window-system '(mac ns))
  (exec-path-from-shell-initialize))


(require 'diminish)
(require 'dired-x)
(require 'evil)
(require 'evil-args)
(require 'evil-exchange)
(require 'evil-magit)
(require 'evil-numbers)
(require 'evil-replace-with-register)
(require 'evil-surround)
(require 'evil-textobj-entire)
(require 'helm-projectile)
(require 'key-chord)
(require 'navigate)
(require 'rbenv)
(require 'rspec-mode)
(require 'smart-tab)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Package initialization & settings
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Enable key-chord for piano style bindings
(require 'key-chord)
(key-chord-mode 1)

;; Enable evil-visualstar
(global-evil-visualstar-mode)

;; Projectile settings
(setq projectile-use-git-grep 1)

;; Enable helm-projectile
(helm-projectile-on)

;; Use <SPC> as leader
(setq evil-leader/in-all-states 1)
(global-evil-leader-mode)
(evil-leader/set-leader "<SPC>")

;; Enalbe replace-with-register
(setq evil-replace-with-register-key (kbd "gr"))
(evil-replace-with-register-install)

;; Enable evil mode
(evil-mode t)

;; Enable evil commentary
(evil-commentary-mode)

;; Enable evil exchange
(evil-exchange-install)

;; Enable smart-tab
(global-smart-tab-mode 1)

;; Setup the silver searcher
(setq ag-executable "/usr/local/bin/ag")

;; Setup projectile
(projectile-mode)
(projectile-discover-projects-in-directory (expand-file-name "~/src" ))

;; Setup rbenv
(global-rbenv-mode)

;; Hide common minor modes
(eval-after-load "undo-tree" '(diminish 'undo-tree-mode))

;; Enable cursor changer on terminal emacs
(unless (display-graphic-p)
  (require 'evil-terminal-cursor-changer)
  (evil-terminal-cursor-changer-activate)
  )

;; Setup rspec-mode
(setq rspec-use-spring-when-possible nil)
(setq rspec-command-options "--fail-fast")

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; General settings
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Enable server to allow emacsclient
(server-start)

;; Don't litter my init file
(setq custom-file (expand-file-name "custom.el" user-emacs-directory))
(load custom-file 'noerror)

;; Store all backup and autosave files in the tmp dir
(setq backup-directory-alist
      `((".*" . ,temporary-file-directory)))
(setq auto-save-file-name-transforms
      `((".*" ,temporary-file-directory t)))

;; Remove trailing whitespace on save
(add-hook 'before-save-hook
          (lambda () (delete-trailing-whitespace))
          )

;; Autosave files
(add-hook 'evil-insert-state-exit-hook 'evil-autosave)

;; Spaces instead of tabs
(setq-default indent-tabs-mode nil)

;; If there is a tab, make it the size of 2 spaces
(setq-default tab-width 2)

;; Helm options
(setq helm-buffers-fuzzy-matching t
      helm-M-x-fuzzy-match t
      helm-recentf-fuzzy-match t)

;; Consider _ part of words
(with-eval-after-load 'evil
    (defalias #'forward-evil-word #'forward-evil-symbol))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; UI and GUI settings
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Show matching parens
(show-paren-mode t)

;; Sane scrolling
(setq scroll-margin 5
      scroll-conservatively 9999
      scroll-step 1)

;; Load theme
;; (load-theme 'spolsky t)
;; (load-theme 'solarized-dark t)
;; (load-theme 'base16-tomorrow-night t)
(load-theme 'base16-gruvbox-light-medium t)

;; Default font size
(set-face-attribute 'default nil :height 150)

;; Short yes or no
(fset 'yes-or-no-p 'y-or-n-p)

;; Cleanup UI
(setq inhibit-splash-screen t
      inhibit-startup-echo-area-message t
      inhibit-startup-message t)

;; Hide toolbarand menubar
(tool-bar-mode -1)
(menu-bar-mode -1)

;; Hide scrollbars
(when (boundp 'scroll-bar-mode)
  (scroll-bar-mode -1))

;; Remember cursor position
(setq save-place-file "~/.emacs.d/saveplace")
(setq-default save-place t)
(require 'saveplace)

;; Start the commit window in insert mode
(add-hook 'with-editor-mode-hook 'evil-insert-state)

;; Add Evil bindings to accept/cancel commit
(evil-define-key 'normal with-editor-mode-map
  (kbd "RET") 'with-editor-finish
  [escape] 'with-editor-cancel)

;; Show line numbers
(global-linum-mode)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Non-leader mappings
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(key-chord-define evil-insert-state-map "jk" 'evil-normal-state)

;; Unimpaired style mappings
(define-key evil-normal-state-map (kbd "[b") 'previous-buffer)
(define-key evil-normal-state-map (kbd "]b") 'next-buffer)
(define-key evil-normal-state-map (kbd "[c") 'git-gutter:previous-hunk)
(define-key evil-normal-state-map (kbd "]c") 'git-gutter:next-hunk)

;; Ace jump
(define-key evil-normal-state-map (kbd "s") 'ace-jump-mode)

;; Zoom
(define-key evil-normal-state-map (kbd "s--") 'text-scale-decrease)
(define-key evil-normal-state-map (kbd "s-=") 'text-scale-increase)

;; Autocompletion/Indenting
(global-set-key (kbd "TAB") 'smart-tab)

;; Dired
(define-key dired-mode-map "%" 'find-file)
(define-key dired-mode-map "-" 'dired-up-directory)

;; Indent new lines
(define-key global-map (kbd "RET") 'newline-and-indent)

;; Exit normal mode with C-g
(define-key evil-insert-state-map (kbd "C-g") 'evil-normal-state)

;; Navigate using visual lines
(define-key evil-normal-state-map (kbd "j") 'evil-next-visual-line)
(define-key evil-normal-state-map (kbd "k") 'evil-previous-visual-line)

;; Use H/L to move to the start/end of line
(define-key evil-normal-state-map (kbd "H") 'evil-first-non-blank)
(define-key evil-normal-state-map (kbd "L") 'evil-end-of-visual-line)

;; Vim motions on helm buffers
(define-key helm-map (kbd "C-j") 'helm-next-line)
(define-key helm-map (kbd "C-k") 'helm-previous-line)
(define-key helm-map (kbd "C-d") 'helm-buffer-run-kill-buffers)
(define-key helm-map (kbd "C-w") 'helm-delete-minibuffer-contents)

;; evil-textobj-entire mappings
(define-key evil-outer-text-objects-map evil-textobj-entire-key 'evil-entire-entire-buffer)
(define-key evil-inner-text-objects-map evil-textobj-entire-key 'evil-entire-entire-buffer)

;; evil-args mappings
(define-key evil-inner-text-objects-map "a" 'evil-inner-arg)
(define-key evil-outer-text-objects-map "a" 'evil-outer-arg)

;; flyspell
(define-key evil-normal-state-map (kbd "zf") 'flyspell-auto-correct-word)
(define-key evil-normal-state-map (kbd "]s") 'flyspell-goto-next-error)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Leader mappings
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(evil-leader/set-key
  "<SPC>" 'helm-projectile-switch-to-buffer
  "/" 'helm-projectile-grep
  "?" 'projectile-grep
  "-" 'evil-numbers/dec-at-pt
  "=" 'evil-numbers/inc-at-pt

  "h" 'evil-window-left
  "j" 'evil-window-down
  "k" 'evil-window-up
  "l" 'evil-window-right

  "at" 'eshell

  "bb" 'helm-buffers-list
  "bd" 'kill-this-buffer
  "be" 'eval-buffer
  "bn" 'next-buffer
  "bp" 'previous-buffer

  "df" 'describe-function

  "ei" 'dired-jump
  "ep" 'projectile-dired

  "fd" 'helm-projectile-find-dir
  "ff" 'helm-projectile-find-file
  "fr" 'helm-projectile-recentf
  "fs" 'save-buffer

  "gd" 'magit-diff
  "gl" 'magit-log-buffer-file
  "gL" 'magit-log-all
  "gr" 'magit-checkout-file
  "gs" 'magit-status
  "gg" 'google-this

  "pp" 'helm-projectile-switch-project

  "q"  'evil-window-delete

  "sa" 'rspec-verify-all
  "se" 'rspec-run-last-failed
  "sf" 'rspec-verify-matching
  "sc" 'rspec-verify-method
  "sl" 'rspec-rerun

  "tg" 'git-gutter-mode
  "ts" 'flyspell-mode

  "wd" 'delete-window
  "wo" 'delete-other-windows
  "ws" 'split-window-below-and-switch
  "wv" 'split-window-right-and-switch
  "ww" 'other-window

  "x"  'helm-M-x
  )
