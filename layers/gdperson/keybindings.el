
;; A complementary binding to the apropos-command (C-h a)
(define-key 'help-command "A" 'apropos)
(define-key 'help-command (kbd "C-f") 'find-function)
(define-key 'help-command (kbd "C-k") 'find-function-on-key)
(define-key 'help-command (kbd "C-v") 'find-variable)
(define-key 'help-command (kbd "C-l") 'find-library)
(define-key 'help-command (kbd "C-i") 'info-display-manual)

(global-set-key (kbd "C-M-\\") 'indent-region-or-buffer)
(global-set-key [remap fill-paragraph] #'endless/fill-or-unfill)
(global-set-key (kbd "M-s o") 'gdperson/occur-dwim)
;; some easy functions for navigate functions
;;C-M-a beginning-of-defun
;;C-M-e end-of-defun
;;C-M-h mark-defun
(global-set-key (kbd "C-s-h") 'mark-defun)
(global-set-key (kbd "C-M-;") 'comment-region)
(global-set-key (kbd "C-M-,") 'uncomment-region)

(global-set-key (kbd "s-l") 'goto-line)
(global-set-key (kbd "C-`") 'toggle-input-method)
(spacemacs/set-leader-keys "oy" 'youdao-dictionary-search-at-point+)

(bind-key* "C-c /" 'company-files)
(bind-key* "C-=" 'er/expand-region)
(bind-key* "M-u" 'dakra-upcase-dwim)
(bind-key* "M-l" 'dakra-downcase-dwim)
(bind-key* "M-c" 'dakra-capitalize-dwim)
