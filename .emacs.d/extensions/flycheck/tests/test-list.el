;;; test-list.el --- Tests for error lists -*- lexical-binding: t; -*-

;; Copyright (c) 2013 Sebastian Wiesner <lunaryorn@gmail.com>
;;
;; Author: Sebastian Wiesner <lunaryorn@gmail.com>
;; URL: https://github.com/lunaryorn/flycheck

;; This file is not part of GNU Emacs.

;; This program is free software: you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.

;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with this program.  If not, see <http://www.gnu.org/licenses/>.

;;; Commentary

;; Test error listing

;;; Code:

(require 'ert)
(require 'flycheck)


(ert-deftest flycheck-list-buffer-label ()
  (with-temp-buffer
    (rename-buffer "Foo")
    (should (string= (flycheck-list-buffer-label (current-buffer))
                     "#<buffer Foo>")))
  (with-temp-buffer
    (set-visited-file-name (expand-file-name "foo/bar" flycheck-testsuite-dir)
                           :no-query)
    (cd flycheck-testsuite-dir)
    (should (string= (flycheck-list-buffer-label (current-buffer)) "foo/bar"))))

(ert-deftest flycheck-list-error-label ()
  (with-temp-buffer
    (rename-buffer "Foo")
    (should (string= (flycheck-list-error-label (flycheck-error-new-at 1 1))
                     "#<buffer Foo>")))
  (with-temp-buffer
    (set-visited-file-name (expand-file-name "foo/bar" flycheck-testsuite-dir)
                           :no-query)
    (cd flycheck-testsuite-dir)
    (should (string= (flycheck-list-error-label (flycheck-error-new-at 1 1))
                     "foo/bar")))
  (with-temp-buffer
    (cd flycheck-testsuite-dir)
    (let* ((filename (expand-file-name "spam/with/eggs" flycheck-testsuite-dir))
           (err (flycheck-error-new-at 1 1 'warning "Foo" :filename filename)))
      (should (string= (flycheck-list-error-label err) "spam/with/eggs")))))

(ert-deftest flycheck-list-add-header ()
  (with-temp-buffer
    (rename-buffer "Foo")
    (flycheck-list-add-header (current-buffer))
    (should (string= (buffer-string)
                     (format "

\C-l
*** #<buffer Foo>: Syntax and style errors (Flycheck v%s)
"
                             (flycheck-version)))))
  (with-temp-buffer
    (set-visited-file-name (expand-file-name "spam/with/eggs" flycheck-testsuite-dir)
                           :no-query)
    (cd flycheck-testsuite-dir)
    (flycheck-list-add-header (current-buffer))
    (should (string= (buffer-string)
                     (format "

\C-l
*** spam/with/eggs: Syntax and style errors (Flycheck v%s)
"
                             (flycheck-version))))))

(ert-deftest flycheck-list-add-errors ()
  (let (buf1 buf2)
    (with-temp-buffer
      (setq buf1 (current-buffer))
      (cd (expand-file-name ".." flycheck-testsuite-dir))
      (rename-buffer "Spam")
      (with-temp-buffer
        (setq buf2 (current-buffer))
        (set-visited-file-name (expand-file-name "spam/with/eggs" flycheck-testsuite-dir)
                               :no-query)
        (cd flycheck-testsuite-dir)
        (with-temp-buffer
          (let ((errors (list (flycheck-error-new-at 4 nil 'warning "Warning 1"
                                                     :buffer buf1 :checker 'emacs-lisp)
                              (flycheck-error-new-at 6 10 'error "Error 1"
                                                     :buffer buf2 :checker 'ruby)
                              (flycheck-error-new-at 15 8 'error "Error 2"
                                                     :buffer buf1 :checker 'python-flake8
                                                     :filename (expand-file-name "foo/bar" flycheck-testsuite-dir)))))
            (flycheck-list-add-errors errors))
          (should (string= (buffer-string) "\
#<buffer Spam>:4:warning: Warning 1 (emacs-lisp)
spam/with/eggs:6:10:error: Error 1 (ruby)
foo/bar:15:8:error: Error 2 (python-flake8)
")))))))

(ert-deftest flycheck-list-errors ()
  (with-temp-buffer
    (should-not flycheck-mode)
    (let ((err (should-error (flycheck-list-errors)
                             :type flycheck-testsuite-user-error-type)))
      (should (string= (cadr err) "Flycheck mode not enabled"))))
  (should-not (get-buffer flycheck-error-list-buffer))
  (unwind-protect
      (flycheck-testsuite-with-resource-buffer "many-errors-for-error-list.el"
        (emacs-lisp-mode)
        (flycheck-testsuite-buffer-sync)
        (flycheck-list-errors)
        (let ((list-buffer (get-buffer flycheck-error-list-buffer)))
          (should list-buffer)
          ;; The list buffer should not be selected!
          (should-not (eq (current-buffer) list-buffer)))
        (with-current-buffer flycheck-error-list-buffer
          ;; Point must be on the beginning of the header line
          (should (looking-at "^*** many-errors-for-error-list\\.el:"))
          ;; Test the contents of the error buffer
          (should (string= (buffer-string) (format "

\C-l
*** many-errors-for-error-list.el: Syntax and style errors (Flycheck v%s)
many-errors-for-error-list.el:7:warning: You should have a section marked \";;; Code:\" (emacs-lisp-checkdoc)
many-errors-for-error-list.el:7:1:warning: `message' called with 0
    args to fill 1 format field(s) (emacs-lisp)
many-errors-for-error-list.el:9:2:warning: princ called with 0
    arguments, but requires 1-2 (emacs-lisp)
many-errors-for-error-list.el:14:1:warning: the function
    `i-do-not-exist' is not known to be defined. (emacs-lisp)
"
                                                   (flycheck-version))))
          ;; Test navigation
          (compilation-next-error 1)
          (should (looking-at "^many-errors-for-error-list.el:7:warning:"))
          (compilation-next-error 1)
          (should (looking-at "^many-errors-for-error-list.el:7:1:warning:"))
          (compilation-next-error 1)
          (should (looking-at "^many-errors-for-error-list.el:9:2:warning:"))
          (compilation-next-error 1)
          (should (looking-at "^many-errors-for-error-list.el:14:1:warning:"))
          (should-error (compilation-next-error 1))))
    (-when-let (buffer (get-buffer flycheck-error-list-buffer))
      (kill-buffer buffer))))



;; Local Variables:
;; coding: utf-8
;; End:

;;; test-list.el ends here
