;;; packages.el --- gdperson layer packages file for Spacemacs.
;;
;; Copyright (c) 2012-2017 Sylvain Benner & Contributors
;;
;; Author: 王辉 <wanghui62@ZBMAC-4087953a0>
;; URL: https://github.com/syl20bnr/spacemacs
;;
;; This file is not part of GNU Emacs.
;;
;;; License: GPLv3

;;; Commentary:

;; See the Spacemacs documentation and FAQs for instructions on how to implement
;; a new layer:
;;
;;   SPC h SPC layers RET
;;
;;
;; Briefly, each package to be installed or configured by this layer should be
;; added to `gdperson-packages'. Then, for each package PACKAGE:
;;
;; - If PACKAGE is not referenced by any other Spacemacs layer, define a
;;   function `gdperson/init-PACKAGE' to load and initialize the package.

;; - Otherwise, PACKAGE is already referenced by another Spacemacs layer, so
;;   define the functions `gdperson/pre-init-PACKAGE' and/or
;;   `gdperson/post-init-PACKAGE' to customize the package as it is loaded.

;;; Code:

(defconst gdperson-packages
  '(
    helm
    helm-ag
    projectile
    expand-region
    cmake-ide
    )
  )

(defun gdperson/post-init-expand-region ()
  (with-eval-after-load 'expand-region
    (when (configuration-layer/package-used-p 'helm-ag)
      (defadvice er/prepare-for-more-expansions-internal
          (around helm-ag/prepare-for-more-expansions-internal activate)
        ad-do-it
        (let ((new-msg (concat (car ad-return-value)
                               ", H to highlight in buffers"
                               ", / to search in project, "
                               "f to search in files, "
                               "b to search in opened buffers"))
              (new-bindings (cdr ad-return-value)))
          (cl-pushnew
           '("H" (lambda ()
                   (call-interactively
                    'gdperson/highlight-dwim)))
           new-bindings)
          (cl-pushnew
           '("/" (lambda ()
                   (call-interactively
                    'spacemacs/helm-project-smart-do-search-region-or-symbol)))
           new-bindings)
          (cl-pushnew
           '("f" (lambda ()
                   (call-interactively
                    'spacemacs/helm-files-smart-do-search-region-or-symbol)))
           new-bindings)
          (cl-pushnew
           '("b" (lambda ()
                   (call-interactively
                    'spacemacs/helm-buffers-smart-do-search-region-or-symbol)))
           new-bindings)
          (setq ad-return-value (cons new-msg new-bindings)))))))

;;; packages.el ends here
