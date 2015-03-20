;;; flycheck-mlint.el --- Flycheck checker using Matlab mlint

;; Copyright (C) 2015 Andrzej Pronobis
;; Author: Andrzej Pronobis <a.pronobis@gmail.com>

;; This file is not part of GNU Emacs.

;; This program is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.

;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with this program.  If not, see <http://www.gnu.org/licenses/>.

;;; Commentary:

;; This is extension for Flycheck.
;; To use, add the following to your init:
;; (eval-after-load 'flycheck
;;   '(require 'flycheck-matlab-mlint))

;;; Code:

(require 'flycheck)

;; Taken from mlint.el by Eric M. Ludlam
(defvar flycheck-matlab-mlint-platform
  (cond ((eq system-type 'darwin)
         (if (string-match "i386" system-configuration)
             (let ((mt (getenv "MACHTYPE")))
               (if (and (stringp mt) (string= "x86_32" mt))
                   ;; This hack is bad since an Emacs started from
                   ;; the doc doesn't have this variable, thus by defaulting
                   ;; to checking the 32 bit (not common anymore) version,
                   ;; we'll get the right answer most of the time.
                   "maci" "maci64"))
           "mac"))
        ((eq system-type 'gnu/linux)
         (cond ((string-match "64\\|i686" system-configuration)
                "glnxa64")
               (t "glnx86")))
        ((eq system-type 'solaris)
         "sol2")
        ((eq system-type 'hpux)
         "hpux")
        ((eq system-type 'windows-nt)
         ;; Thought about checking the env PROCESSOR_ARCHITEW6432,
         ;; but this said AMD on my Intel, which seemed suspicious.
         (let ((proc (getenv "PROCESSOR_IDENTIFIER")))
           (if (and (stringp proc) (string-match "64" proc))
               "win64"
             "win32")))
        (t "unknown"))
  "Platform we are running mlint on.")

(defvar flycheck-matlab-mlint-executable-path
  (executable-find
   (concat
    (file-name-as-directory flycheck-matlab-mlint-platform)
    "mlint"))
  "Default full executable path.")

(flycheck-def-executable-var matlab-mlint "<platform>/mlint")

(flycheck-define-command-checker 'matlab-mlint
  "A Matlab checker based on mlint."
  :command `(,flycheck-matlab-mlint-executable-path source)
  :error-patterns
  '((warning line-start "L " line " (C " (1+ digit)  "): " (message) line-end))
  :modes '(matlab-mode))

(add-to-list 'flycheck-checkers 'matlab-mlint 'append)

(provide 'flycheck-matlab-mlint)
;;; flycheck-matlab-mlint.el ends here
