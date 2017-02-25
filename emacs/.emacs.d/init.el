(require 'package)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Packages
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(add-to-list 'package-archives '("org" . "http://orgmode.org/elpa/"))
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))
(add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/"))

(setq package-enable-at-startup nil)

;; Add .emacs/lib folder to the load path
(add-to-list 'load-path (expand-file-name "lib" user-emacs-directory))

(defun ensure-package-installed (&rest packages)
  " Ensure all packages are installed
  Return a list of installed packages or nil for every skipped package."
  (mapcar
   (lambda (package)
     (if (package-installed-p package)
         nil
       (package-install package)
       )
     )
   packages)
  )

;; Make sure to have downloaded archive description.
(or (file-exists-p package-user-dir)
    (package-refresh-contents))

;; Activate installed packages
(package-initialize)

;; Actual list of packages to install
(ensure-package-installed 'ag
                          'base16-theme
                          'sublime-themes
                          'evil
                          'evil-args
                          'evil-commentary
                          'evil-exchange
                          'evil-indent-textobject
                          'evil-leader
                          'evil-magit
                          'evil-numbers
                          'evil-surround
                          'evil-visualstar
                          'google-this
                          'git-gutter
                          'helm
                          'helm-ag
                          'helm-projectile
                          'magit
                          'markdown-mode
                          'projectile
                          'solarized-theme
                          )

(require 'evil)
(require 'evil-args)
(require 'evil-exchange)
(require 'evil-magit)
(require 'evil-numbers)
(require 'evil-surround)
(require 'evil-textobj-entire)
(require 'helm-projectile)
(require 'smart-tab)

;; Enable evil-surround
(global-evil-surround-mode 1)

;; Enable evil-visualstar
(global-evil-visualstar-mode)

;; Enable helm-projectile
(helm-projectile-on)

;; Use <SPC> as leader
(setq evil-leader/in-all-states 1)
(global-evil-leader-mode)
(evil-leader/set-leader "<SPC>")

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

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; General settings
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Don't litter my init file
(setq custom-file (expand-file-name "custom.el" user-emacs-directory))
(load custom-file 'noerror)

;; Disable backup files
(setq make-backup-files nil)

;; Remove trailing whitespace on save
(add-hook 'before-save-hook
          (lambda () (delete-trailing-whitespace))
          )

;; Spaces instead of tabs
(setq-default indent-tabs-mode nil)

;; If there is a tab, make it the size of 2 spaces
(setq-default tab-width 2)

;; Helm options
(setq helm-buffers-fuzzy-matching t
      helm-M-x-fuzzy-match t
      helm-recentf-fuzzy-match t)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; UI and GUI settings
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Show line numbers
(linum-mode)

;; Show matching parens
(show-paren-mode t)

;; Sane scrolling
(setq scroll-margin 5
      scroll-conservatively 9999
      scroll-step 1)

;; Load theme
(load-theme 'spolsky t)

;; Default font size
(set-face-attribute 'default nil :height 160)

;; Short yes or no
(fset 'yes-or-no-p 'y-or-n-p)

;; Cleanup UI
(setq inhibit-splash-screen t
      inhibit-startup-echo-area-message t
      inhibit-startup-message t)

;; Hide toolbar
(tool-bar-mode -1)

;; Hide menubar
(menu-bar-mode -1)

;; Hide scrollbars
(when (boundp 'scroll-bar-mode)
  (scroll-bar-mode -1))

;; Remember cursor position
(setq save-place-file "~/.emacs.d/saveplace")
(setq-default save-place t)
(require 'saveplace)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Non-leader mappings
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Unimpaired style mappings
(define-key evil-normal-state-map (kbd "[b") 'previous-buffer)
(define-key evil-normal-state-map (kbd "]b") 'next-buffer)
(define-key evil-normal-state-map (kbd "[c") 'git-gutter:previous-hunk)
(define-key evil-normal-state-map (kbd "]c") 'git-gutter:next-hunk)


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
(define-key evil-normal-state-map (kbd "H") 'evil-beginning-of-visual-line)
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


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Leader mappings
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(evil-leader/set-key
  "<SPC>" 'helm-projectile-switch-to-buffer
  "/" 'projectile-ag
  "-" 'evil-numbers/dec-at-pt
  "=" 'evil-numbers/inc-at-pt

  "at" 'ansi-term

  "bb" 'helm-buffers-list
  "bd" 'kill-buffer
  "be" 'eval-buffer
  "bn" 'next-buffer
  "bp" 'previous-buffer

  "df" 'describe-function

  "e" 'dired

  "fd" 'helm-projectile-find-dir
  "ff" 'helm-projectile-find-file
  "fr" 'helm-projectile-recentf
  "fs" 'save-buffer

  "gd" 'magit-diff
  "gs" 'magit-status
  "gg" 'google-this

  "pp" 'helm-projectile-switch-project

  "q"  'delete-window

  "tg" 'git-gutter-mode

  "wd" 'delete-window
  "wo" 'delete-other-windows
  "ws" 'split-window-below
  "wv" 'split-window-right
  "ww" 'other-window

  "x"  'helm-M-x
  )
