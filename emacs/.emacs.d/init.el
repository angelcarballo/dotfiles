;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Packages
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(setq package-enable-at-startup nil)
(setq straight-use-package-by-default t)

(defvar bootstrap-version)
(let ((bootstrap-file
       (expand-file-name "straight/repos/straight.el/bootstrap.el" user-emacs-directory))
      (bootstrap-version 6))
  (unless (file-exists-p bootstrap-file)
    (with-current-buffer
        (url-retrieve-synchronously
         "https://raw.githubusercontent.com/radian-software/straight.el/develop/install.el"
         'silent 'inhibit-cookies)
      (goto-char (point-max))
      (eval-print-last-sexp)))
  (load bootstrap-file nil 'nomessage))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; General settings
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Don't wrap lines by default
(set-default 'truncate-lines t)

;; Give help buffers focus, they're annoying to close otherwise
(setq help-window-select t)

;; Load env vars from shell (usefull for getting right PATH on Mac)
(use-package exec-path-from-shell)
(when (memq window-system '(mac ns))
  (exec-path-from-shell-initialize))

;; Remember cursor position
(save-place-mode 1)

;; Display line numbers in every buffer
(global-display-line-numbers-mode 1)

;; Don't litter my init file
(setq custom-file (expand-file-name "custom.el" user-emacs-directory))
(load custom-file 'noerror)

;; Store all backup and autosave files in the tmp dir
(setq backup-directory-alist
      `((".*" . ,temporary-file-directory)))
(setq auto-save-file-name-transforms
      `((".*" ,temporary-file-directory t)))

;; Spaces instead of tabs
(setq-default indent-tabs-mode nil)

;; If there is a tab, make it the size of 2 spaces
(setq-default tab-width 2)

;; Enable recursive minibuffers
(setq enable-recursive-minibuffers t)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Custom functions
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defun acg-kill-buffer-file-name ()
  "Copy the current buffer file name to the clipboard."
  (interactive)
  (when-let ((filename (if (eq major-mode 'dired-mode)
                           default-directory
                         (buffer-file-name))))
    (message (file-name-nondirectory (kill-new filename)))))

(defun acg-kill-buffer-file-path-absolute ()
  "Copy the current buffer file absolute path to the clipboard."
  (interactive)
  (when-let ((filename (if (eq major-mode 'dired-mode)
                           default-directory
                         (buffer-file-name))))
    (message (kill-new filename))))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Look & Feel
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Don't show the splash screen
(setq inhibit-startup-message t)

;; Always follow symlinks when opening files
(setq vc-follow-symlinks t)

;; Show matching parens
(show-paren-mode t)

;; Sane scrolling
(setq scroll-margin 5
      scroll-conservatively 9999
      scroll-step 1)

;; Remove default UI elements
(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)

;; Start maximised
(add-to-list 'default-frame-alist '(fullscreen . maximized))

;; Font and theme
(set-face-attribute 'default nil :font "Iosevka Term" :height 180)

(use-package catppuccin-theme
  :config
  (load-theme 'catppuccin-mocha))

(use-package mood-line
  :config
  (mood-line-mode))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Navigation
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(setq dired-listing-switches "-agho")

;; Auto refresh buffers
(global-auto-revert-mode 1)

;; Also auto refresh dired, but be quiet about it
(setq global-auto-revert-non-file-buffers t)
(setq auto-revert-verbose nil)

(use-package rg) 

(use-package projectile
  :config
  (setq projectile-sort-order 'recentf)
  (setq projectile-enable-caching t)
  (setq projectile-project-search-path '("~/src/"))
  :init
  (projectile-mode +1))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Version Control
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(use-package magit)

(use-package git-gutter
  :config
  (global-git-gutter-mode +1))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Completion
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(use-package vertico
  :init
  (vertico-mode))

(use-package marginalia
  :init
  (marginalia-mode))

;; Persist history over Emacs restarts. Vertico sorts by history position.
(use-package savehist
  :init
  (savehist-mode))

(use-package orderless
  :init
  ;; Configure a custom style dispatcher (see the Consult wiki)
  ;; (setq orderless-style-dispatchers '(+orderless-dispatch)
  ;;       orderless-component-separator #'orderless-escapable-split-on-space)
  (setq completion-styles '(orderless basic)
        completion-category-defaults nil
        completion-category-overrides '((file (styles partial-completion)))))

(use-package consult)

(use-package company
  :init
  (setq company-backends '((company-capf company-dabbrev-code company-files)))
  :config
  (add-hook 'after-init-hook 'global-company-mode)
  (add-hook 'after-init-hook 'company-tng-mode))

(use-package smartparens
  :config
  (smartparens-global-mode 1))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; LSP
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(use-package eglot
  :config
  (setq eglot-extend-to-xref t))

(add-hook 'elixir-mode-hook 'eglot-ensure)
(add-to-list 'eglot-server-programs '(elixir-mode "~/src/elixir-ls/release/language_server.sh"))

(setq eldoc-echo-area-use-multiline-p nil)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Evil
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(use-package evil
  :init
  (setq evil-want-keybinding nil)
  (setq evil-want-integration t)
  (setq evil-want-C-u-scroll t)
  (setq evil-undo-system 'undo-redo)
  :config
  (evil-mode 1))

(use-package evil-collection
  :after evil
  :init
  (setq evil-collection-setup-minibuffer t)
  :config
  (evil-collection-init))

(use-package evil-escape
  :after evil)
(setq-default evil-escape-key-sequence "kj")
(evil-escape-mode)

(use-package evil-surround
  :after evil
  :config
  (global-evil-surround-mode 1))

(use-package evil-commentary
  :after evil
  :config
  (evil-commentary-mode))

(use-package evil-visualstar
  :config
  (global-evil-visualstar-mode))

(use-package evil-indent-plus)

(use-package evil-args
  :config
  (require 'evil-args)
  (define-key evil-inner-text-objects-map "a" 'evil-inner-arg)
  (define-key evil-outer-text-objects-map "a" 'evil-outer-arg))

(use-package evil-indent-plus
  :config
  (evil-indent-plus-default-bindings))

(use-package evil-textobj-entire
  :config
  (define-key evil-outer-text-objects-map "e" 'evil-entire-entire-buffer)
  (define-key evil-inner-text-objects-map "e" 'evil-entire-entire-buffer))

(use-package evil-lion
  :config
  (evil-lion-mode))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Spell checker
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(require 'flyspell)
(add-hook 'text-mode-hook 'flyspell-mode)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Web search
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(use-package google-this
  :config
  (google-this-mode 1))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Key mappings
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(use-package general)
(require 'general)

;; Define SPC as leader
(general-create-definer leader-define-key
  :prefix "SPC")

(leader-define-key
  :keymaps 'normal
  "/" 'projectile-ripgrep
  "*" 'consult-ripgrep
  "SPC" 'consult-buffer
  "bb" 'projectile-switch-to-buffer
  "bo" 'projectile-switch-to-buffer-other-window
  "cfn" 'acg-kill-buffer-file-name
  "cfp" 'acg-kill-buffer-file-path-absolute
  "dp" 'projectile-dired
  "do" 'projectile-dired-other-window
  "dd" 'dired-jump
  "eb" 'eval-buffer
  "fa" 'projectile-toggle-between-implementation-and-test
  "fD" 'find-dired
  "fF" 'find-file
  "ff" 'projectile-find-file
  "fo" 'projectile-find-file-other-window
  "fp" 'projectile-switch-project
  "gb" 'magit-blame-addition
  "gd" 'magit-diff-buffer-file
  "gs" 'magit
  "gr" 'magit-file-checkout
  "p" 'yank-pop
  "q" 'evil-quit
  "Q" 'evil-quit-all
  "tw" 'toggle-truncate-lines
  "tn" 'tab-new
  "ws" 'google-this
  "wv" 'split-window-horizontally
  )

(leader-define-key
  :keymaps 'visual
  "ws" 'google-this-region
  )

(general-define-key
 :states 'normal
 "C-l" 'evil-switch-to-windows-last-buffer
 "C-]" 'xref-find-definitions
 "K" 'eldoc
 ;; Use H/L to move to the start/end of line
 "H" 'evil-first-non-blank
 "L" 'evil-end-of-visual-line
 ;; Unimpaired style
 "[c" 'git-gutter:previous-hunk
 "]c" 'git-gutter:next-hunk
 "]i" 'flymake-goto-next-error
 "[i" 'flymake-goto-prev-error
 "[b" 'previous-buffer
 "]b" 'next-buffer
 "]w" 'tab-next
 "[w" 'tab-previous)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Language support
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(use-package markdown-mode
  :mode ("README\\.md\\'" . gfm-mode)
  :init (setq markdown-command "multimarkdown"))

(use-package elixir-mode)
(use-package exunit)

(add-hook 'elixir-mode-hook 'exunit-mode)
(add-hook 'elixir-mode-hook 'flymake-mode)
(add-hook 'elixir-mode-hook 'eglot-ensure)

(leader-define-key
  :keymaps 'elixir-mode-map
  :states 'normal
  "ta" 'exunit-verify-all
  "tc" 'exunit-verify-single
  "tf" 'exunit-verify
  "tl" 'exunit-rerun
  "tt" 'exunit-toggle-file-and-test
  "tu" 'exunit-verify-all-in-umbrella)


;; init.el ends here
