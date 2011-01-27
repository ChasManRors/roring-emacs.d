;; emacs configuration

(push "/usr/local/bin" exec-path)
(add-to-list 'load-path "~/.emacs.d")

(setq make-backup-files nil)
(setq auto-save-default nil)
(setq-default tab-width 2)
(setq-default indent-tabs-mode nil)
(setq inhibit-startup-message t)

(fset 'yes-or-no-p 'y-or-n-p)

(delete-selection-mode -1)
;(wrap-region-global-mode (quote toggle))
(scroll-bar-mode -1)
(tool-bar-mode -1)
(blink-cursor-mode t)
(show-paren-mode t)
(column-number-mode t)
(set-fringe-style -1)
(tooltip-mode -1)

(set-frame-font "Menlo-16")
(load-theme (quote wheatgrass))

(defun ruby-mode-hook ()
  (autoload 'ruby-mode "ruby-mode" nil t)
  (add-to-list 'auto-mode-alist '("Capfile" . ruby-mode))
  (add-to-list 'auto-mode-alist '("Gemfile" . ruby-mode))
  (add-to-list 'auto-mode-alist '("Rakefile" . ruby-mode))
  (add-to-list 'auto-mode-alist '("\\.rake\\'" . ruby-mode))
  (add-to-list 'auto-mode-alist '("\\.rb\\'" . ruby-mode))
  (add-to-list 'auto-mode-alist '("\\.ru\\'" . ruby-mode))
  (add-hook 'ruby-mode-hook '(lambda ()
                               (setq ruby-deep-arglist t)
                               (setq ruby-deep-indent-paren nil)
                               (setq c-tab-always-indent nil)
                               (require 'inf-ruby)
                               (require 'ruby-compilation)
                               (define-key ruby-mode-map (kbd "M-r" 'run-rails-test-or-ruby-buffer))
                               imenu-add-menubar-index)))  ;; test
(defun rhtml-mode-hook ()
  (autoload 'rhtml-mode "rhtml-mode" nil t)
  (add-to-list 'auto-mode-alist '("\\.erb\\'" . rhtml-mode))
  (add-to-list 'auto-mode-alist '("\\.rjs\\'" . rhtml-mode))
  (add-to-list 'auto-mode-alist '("\\.rhtml\\'" . rhtml-mode))
  (add-hook 'rhtml-mode '(lambda ()
                           (define-key rhtml-mode-map (kbd "M-s") 'save-buffer))))

(defun yaml-mode-hook ()
  (autoload 'yaml-mode "yaml-mode" nil t)
  (add-to-list 'auto-mode-alist '("\\.yml$" . yaml-mode))
  (add-to-list 'auto-mode-alist '("\\.yaml$" . yaml-mode)))

(defun css-mode-hook ()
  (autoload 'css-mode "css-mode" nil t)
  (add-hook 'css-mode-hook '(lambda ()
                              (setq css-indent-level 2)
                              (setq css-indent-offset 2))))
(defun is-rails-project ()
  (when (textmate-project-root)
    (file-exists-p (expand-file-name "config/environment.rb" (textmate-project-root)))))

(defun run-rails-test-or-ruby-buffer ()
  (interactive)
  (if (is-rails-project)
      (let* ((path (buffer-file-name))
             (filename (file-name-nondirectory path))
             (test-path (expand-file-name "test" (textmate-project-root)))
             (command (list ruby-compilation-executable "-I" test-path path)))
        (pop-to-buffer (ruby-compilation-do filename command)))
    (ruby-compilation-this-buffer)))

(require 'package)
(setq package-archives (cons '("tromey" . "http://tromey.com/elpa/") 
                             package-archives))
(package-initialize)

(add-to-list 'load-path "~/.emacs.d/el-get/el-get")
(require 'el-get)

(require 'wrap-region)
(wrap-region-global-mode t)

(setq el-get-sources
      '((:name ruby-mode
               :type elpa
               :load "ruby-mode.el"
               :after (lambda () (ruby-mode-hook)))
        (:name inf-ruby :type elpa)
        (:name ruby-compilation :type elpa)
        (:name css-mode
               :type elpa
               :after (lambda () (css-mode-hook)))
        (:name textmate
               :type git
               :url "git://github.com/defunkt/textmate.el"
               :load "textmate.el")
        (:name rvm
               :type git
               :url "http://github.com/djwhitt/rvm.el.git"
               :load "rvm.el"
               :compile ("rvm.el")
               :after (lambda() (rvm-use-default)))
        (:name rhtml
               :type git
               :url "https://github.com/eschulte/rhtml.git"
               :features rhtml-mode
               :after (lambda () (rhtml-mode-hook)))
        (:name yaml-mode
               :type git
               :url "http://github.com/yoshiki/yaml-mode.git"
               :features yaml-mode
               :after (lambda () (yaml-mode-hook)))
))
(el-get 'sync)

;;; Added by Charles Magid ;;;

;; fuzzy selection
(require 'ido) 
(ido-mode t) 

;; ex: window (c-x 2) undo/redo
(winner-mode t)

;; set a key for commenting region of code
(global-set-key "" (quote comment-or-uncomment-region)) ;; Not (quote comment-region)

;; simple code fold toggling, makes indenting more meaningful
; See: http://emacs.wordpress.com/2007/01/16/quick-and-dirty-code-folding/
(defun jao-selective-display () 
  "Activate selective display based on the column at point"
  (interactive)
  (set-selective-display
   (if selective-display
       nil
     (+ 1 (current-column)))))
; WARNING (global-set-key "." (quote jao-selective-display)) 
; no good because prefix in some modes
; [C-c C-space] 
(global-set-key (quote [3 67108896]) (quote jao-selective-display))  

;; add lorem-ipsum anywhere M-x Lorem-ipsum-insert-...
(require 'lorem-ipsum)

;; add ability to highlight anywhere M-x markerpen-mark-region
(load "markerpen")
(markerpen8)

;; insert mathematical approximation to PI
(defun insert-pi ()  "Insert pi at point."  (interactive)
  (insert "3.14159265358979323846264338327950288419716939937510582097494459230781640628620"))

;; insert date
(defun insert-date () "Insert according to locale's date and time format." (interactive)
  (insert (format-time-string "%c" (current-time))))

;; colorize log files with ansi control characters
(defun colorize-log() "colorize the damn buffer" (interactive)
  (eval-expression (quote (ansi-color-apply-on-region (point-min) (point-max))) nil))

; WARNING comment this out when running headless emacs
;; allow opening of files in running emacs
(server-start) ;;; Use C-x # to close an emacsclient buffer.

; WARNING must have space before closeing double quote
;; surround variables internal to string with "{}"
(fset 'ruby-var-in-str
   [?\C-  ?\C-s ?  ?\C-b ?\{ ?\C-f escape ?\C-b ?# escape ?\C-f escape ? ])

;; flash screen for c-g do not ring bell
(set-variable (quote visible-bell) t nil)

;; turn on abbrv mode in the languages modes.
(dolist (hook '( conf-mode-hook ruby-mode-hook rhtml-mode-hook yaml-mode-hook html-mode-hook css-mode-hook javascript-mode-hook )) (add-hook hook (lambda () (abbrev-mode 1))))

;; show ruby methods in menubar
(eval-after-load 'ruby-mode
  '(add-hook 'ruby-mode-hook 'imenu-add-menubar-index))

;; allow this prefix for org-mode
(define-key global-map "\C-ca" 'org-agenda)

;; add useful snippets
(add-to-list 'load-path "~/.emacs.d/yasnippet-read-only")
(require 'yasnippet) ;; not yasnippet-bundle
(yas/initialize)
(setq yas/root-directory '("~/.emacs.d/mysnippets" ; Develop in 
                           "~/.emacs.d/yasnippet-read-only/snippets"
                           "~/.emacs.d/rails-snippets"))
;; Map `yas/load-directory' to every element
(mapc 'yas/load-directory yas/root-directory)
(setq yas/prompt-functions (quote (yas/ido-prompt)))
