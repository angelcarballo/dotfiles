;; Functions related to current file path

(defun copy-current-buffer-absolute-path ()
  "Copy the file absolute path to the kill-ring"
  (interactive)
  (setq path (buffer-file-name))
  (message "%s copied" path)
  (kill-new path)
  )

(defun copy-current-project-root-path ()
  "Copy the current project path to the kill-ring"
  (interactive)
  (setq path (projectile-project-root))
  (message "%s copied" path)
  (kill-new path)
  )

(defun copy-current-buffer-directory ()
  "Copy the file directory path to the kill-ring"
  (interactive)
  (setq path (file-name-directory buffer-file-name))
  (message "%s copied" path)
  (kill-new path)
  )

;; WIP
(defun copy-current-buffer-relative-path ()
  "Copy the current project's absolute path to the kill-ring"
  (interactive)
  ;; (setq project-path-width (string-width projectile-project-root))
  (setq project-path-width
        (string-width
         (locate-dominating-file default-directory ".git")))
  (setq absolute-path-width
        (string-width buffer-file-name))
  (setq path (subseq buffer-file-name project-path-width absolute-path-width))
  (message "%s copied" path)
  (kill-new path)
  )
