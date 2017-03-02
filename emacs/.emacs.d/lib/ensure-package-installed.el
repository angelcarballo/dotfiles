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
