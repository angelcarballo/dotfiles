(defun evil-autosave ()
  (if (buffer-file-name)
      (evil-save))
  )
