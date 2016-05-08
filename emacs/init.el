(require 'package)

(add-to-list 'package-archives '("org" . "http://orgmode.org/elpa/"))
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))
(add-to-list 'package-archives '("melpa-stable" . "http://stable.melpa.org/packages/"))
(add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/"))

(setq package-enable-at-startup nil)

(defun ensure-package-installed (&rest packages)
  "Assure every package is installed, ask for installation if it’s not.
   Return a list of installed packages or nil for every skipped package."
  (mapcar
   (lambda (package)
     (if (package-installed-p package)
         nil
       (if (y-or-n-p (format "Package %s is missing. Install it? " package))
           (package-install package)
         package)))
   packages))

;; Make sure to have downloaded archive description.
(or (file-exists-p package-user-dir)
    (package-refresh-contents))

;; Activate installed packages
(package-initialize)

(ensure-package-installed 'projectile
			  'evil
			  'evil-leader
			  'evil-surround
			  'evil-visualstar
			  'evil-magit
			  'evil-indent-textobject
			  'helm
			  'helm-projectile
			  'solarized-theme
			  'monokai-theme
			  'inf-ruby
			  'rspec-mode
        'yasnippet
        'rinari
			  'magit)

;; Indent new lines
(define-key global-map (kbd "RET") 'newline-and-indent)

;; Disable backup files
(setq make-backup-files nil)

;; Show matching parens
(show-paren-mode t)

;; Remove trailing whitespace on save
(add-hook 'before-save-hook
	  (lambda () (delete-trailing-whitespace)))

;; Spaces instead of tabs
(setq-default indent-tabs-mode nil)

;; If there is a tab, make it the size of 2 spaces
(setq-default tab-width 2)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Hippie expand.  Groovy vans with tie-dyes.

(setq hippie-expand-try-functions-list
      '(try-expand-dabbrev
        try-expand-dabbrev-all-buffers
        try-expand-dabbrev-from-kill
        try-complete-file-name
        try-complete-lisp-symbol))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Smart Tab
;; Borrowed from snippets at
;; http://www.emacswiki.org/emacs/TabCompletion
;; TODO: Take a look at https://github.com/genehack/smart-tab

(defvar smart-tab-using-hippie-expand t
  "turn this on if you want to use hippie-expand completion.")

(defun smart-tab (prefix)
  "Needs `transient-mark-mode' to be on. This smart tab is
  minibuffer compliant: it acts as usual in the minibuffer.
  In all other buffers: if PREFIX is \\[universal-argument], calls
  `smart-indent'. Else if point is at the end of a symbol,
  expands it. Else calls `smart-indent'."
  (interactive "P")
  (labels ((smart-tab-must-expand (&optional prefix)
                                  (unless (or (consp prefix)
                                              mark-active)
                                    (looking-at "\\_>"))))
    (cond ((minibufferp)
           (minibuffer-complete))
          ((smart-tab-must-expand prefix)
           (if smart-tab-using-hippie-expand
               (hippie-expand prefix)
             (dabbrev-expand prefix)))
          ((smart-indent)))))

(defun smart-indent ()
  "Indents region if mark is active, or current line otherwise."
  (interactive)
  (if mark-active
    (indent-region (region-beginning)
                   (region-end))
    (indent-for-tab-command)))
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(global-set-key (kbd "TAB") 'smart-tab)

;; Enable evil-surround
(require 'evil-surround)
(global-evil-surround-mode 1)

;; Enable evil-visualstar
(global-evil-visualstar-mode)

;; Enable helm-projectile
(require 'helm-projectile)
(helm-projectile-on)

;; Navigate using visual lines
(define-key evil-normal-state-map (kbd "j") 'evil-next-visual-line)
(define-key evil-normal-state-map (kbd "k") 'evil-previous-visual-line)

;; Use <SPC> as leader
(setq evil-leader/in-all-states 1)
(global-evil-leader-mode)
(evil-leader/set-leader "<SPC>")

;; Enable evil mode
(require 'evil)
(evil-mode t)

;; Enable evil-magit
(require 'evil-magit)

;; Enable ruby/rails rinari plugin
(require 'rinari)

;; Sane scrolling
(setq scroll-margin 5
scroll-conservatively 9999
scroll-step 1)

;; Load theme
(load-theme 'monokai t)

;; Short yes or no
(fset 'yes-or-no-p 'y-or-n-p)

;; Use visualbell
(setq visible-bell t)

;; Cleanup UI
(setq inhibit-splash-screen t
      inhibit-startup-echo-area-message t
      inhibit-startup-message t)

;; Maximize frame
(set-frame-parameter nil 'fullscreen 'fullboth)

;; Hide toolbar
(tool-bar-mode -1)

;; Remember cursor position
(setq save-place-file "~/.emacs.d/saveplace")
(setq-default save-place t)
(require 'saveplace)

;; Show line numbers
(global-linum-mode t)

(defun kill-other-buffers ()
  "Kill all buffers but the current one. Don't mess with special buffers."
  (interactive)
  (dolist (buffer (buffer-list))
    (unless (or (eql buffer (current-buffer)) (not (buffer-file-name buffer)))
      (kill-buffer buffer))))

;; Leader mappings
(evil-leader/set-key
  "at" 'ansi-term
  "bb" 'helm-projectile-switch-to-buffer
  "bd" 'kill-buffer
  "bD" 'kill-other-buffers
  "bn" 'next-buffer
  "bp" 'previous-buffer
  "cy" 'clipboard-kill-region
  "cp" 'clipboard-yank
  "df" 'describe-function
  "pp" 'helm-projectile-switch-project
  "fd" 'helm-projectile-find-dir
  "ff" 'helm-projectile-find-file
  "fr" 'helm-projectile-recentf
  "fs" 'save-buffer
  "gs" 'magit-status
  "q"  'kill-buffer-and-window
  "R"  'eval-buffer
  "wc"  'delete-window
  "wo"  'delete-other-windows
  "wv"  'split-window-right
  "ws"  'split-window-below
  "ww"  'other-window
  "x"  'helm-M-x
  )

;; Non-leader mappings

;; Easier split navigation
(define-key evil-normal-state-map (kbd "C-h") 'evil-window-left)
(define-key evil-normal-state-map (kbd "C-j") 'evil-window-down)
(define-key evil-normal-state-map (kbd "C-k") 'evil-window-up)
(define-key evil-normal-state-map (kbd "C-l") 'evil-window-right)

;; Copy/paste osx style
(define-key evil-insert-state-map (kbd "M-c") 'clipboard-kill-region)
(define-key evil-insert-state-map (kbd "M-v") 'clipboard-yank)


;; ESC quits everything
(defun minibuffer-keyboard-quit ()
  "Abort recursive edit.
In Delete Selection mode, if the mark is active, just deactivate it;
then it takes a second \\[keyboard-quit] to abort the minibuffer."
  (interactive)
  (if (and delete-selection-mode transient-mark-mode mark-active)
      (setq deactivate-mark  t)
    (when (get-buffer "*Completions*") (delete-windows-on "*Completions*"))
    (abort-recursive-edit)))
(define-key evil-normal-state-map [escape] 'keyboard-quit)
(define-key evil-visual-state-map [escape] 'keyboard-quit)
(define-key minibuffer-local-map [escape] 'minibuffer-keyboard-quit)
(define-key minibuffer-local-ns-map [escape] 'minibuffer-keyboard-quit)
(define-key minibuffer-local-completion-map [escape] 'minibuffer-keyboard-quit)
(define-key minibuffer-local-must-match-map [escape] 'minibuffer-keyboard-quit)
(define-key minibuffer-local-isearch-map [escape] 'minibuffer-keyboard-quit)
(global-set-key [escape] 'evil-exit-emacs-state)
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
