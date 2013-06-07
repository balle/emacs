;;; test-perl.el --- Test the bash checker -*- lexical-binding: t; -*-

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

;;; Code:

(require 'ert)
(require 'dash)
(require 'flycheck)

(require 'cperl-mode nil t)

(ert-deftest checker-perl-error ()
  "Test an unused variable with the Perl checker."
  :expected-result (flycheck-testsuite-fail-unless-checker 'perl)
  (flycheck-testsuite-should-syntax-check
   "checkers/perl-error.pl" '(perl-mode cperl-mode) nil
   '(4 nil "Name \"main::x\" used only once: possible typo" error)))

(ert-deftest checker-perl-syntax-error ()
  :expected-result (flycheck-testsuite-fail-unless-checker 'perl)
  "Test a syntax error with the Perl checker."
  (flycheck-testsuite-should-syntax-check
   "checkers/perl-syntax-error.pl" '(perl-mode cperl-mode) nil
   '(4 nil "syntax error" error)))

(require 'sh-script)

;; Local Variables:
;; coding: utf-8
;; End:

;;; test-perl.el ends here
