;;; c++-sport-mode.el --- A minor mode for sport programming in C++

;;; Commentary:
;;

;;; code:

(defun compile-buffer()
  (interactive)
  (delete-other-windows)
  (save-buffer)
  (compile (concat "g++ -std=c++14 -Werror -DLOCAL -O2 -o " (file-name-sans-extension buffer-file-name) " " buffer-file-name)))

(defun debug-buffer()
  (interactive)
  (compile-buffer)
  (delete-other-windows)
  (split-window-vertically)
  (next-multiframe-window)
  (gud-gdb (concat "gdb --fullname " (file-name-sans-extension buffer-file-name) )))

(define-minor-mode c++-sport-mode
  "Sport mode in C++"
  :lighter " c++-sport"
  :keymap (let ((map (make-sparse-keymap)))
            (define-key map [f5] 'compile-buffer)
            (define-key map [f6] 'debug-buffer)
            map))

(add-hook 'c++-mode-hook 'c++-sport-mode)

(provide 'c++-sport-mode)
;;; c++-sport-mode ends here
