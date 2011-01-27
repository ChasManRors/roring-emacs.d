;;; Commentary:
;;
;; IMPORTANT:
;;
;; Correct use of this package in C-derived (and maybe other) modes depends on
;; the following bug being fixed:
;;
;; http://lists.gnu.org/archive/html/emacs-devel/2007-08/msg00303.html
;;
;; It will only work correctly in Emacs 22.2 and later!
;;
;;
;; Add the following to your .emacs file:
;; (require 'tempo-snippets)
;;
;; Then use `tempo-define-snippet' instead of `tempo-define-template'.  The
;; arguments can remain the same.  Insertion works like for any tempo-template
;; with `tempo-template-your-template-name'.
;;
;; When adding lisp forms in your templates that use `tempo-lookup-named', make
;; sure they don't have side-effects, because they will be evaluated every time
;; the variables change.
;;
;;
;; Here are two examples:
;;
;; (tempo-define-snippet "java-class"
;;   '("class " (p "Class: " class) " {\n\n"
;;     > "public " (s class) "(" p ") {\n" > p n
;;     "}" > n n "}" > n))
;;
;; (tempo-define-snippet "java-get-set"
;;   '("private " (p "Type: " type) " _" (p "Name: " var) ";\n\n"
;;     > "public " (s type) " get" (upcase-initials (tempo-lookup-named 'var))
;;     "() {\n"
;;     > "return _" (s var)  ";\n" "}" > n n
;;     > "public set" (upcase-initials (tempo-lookup-named 'var))
;;     "(" (s type) " value) {\n"
;;     > "_" (s var) " = value;\n" "}" > n))
;;
;; Note the forms in the second example.  It calls `upcase-initials' every time
;; you change the first variable name.
;;
;; You can navigate between input forms with `tempo-snippets-next-field' and
;; `tempo-snippets-previous-field'.  When the point is on an input field, those
;; commands are bound to M-n and M-p by default.  You can use
;; `tempo-snippets-keymap' to bind keys for input fields.
;;
;; If you want to add a snippet to your abbrev table, you can do
;; M-x tempo-snippets-add-mode-abbrev or M-x tempo-snippets-add-global-abbrev.
;;
;;
