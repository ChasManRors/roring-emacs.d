;;-*-coding: emacs-mule;-*-
(define-abbrev-table 'Buffer-menu-mode-abbrev-table '())

(define-abbrev-table 'Custom-mode-abbrev-table '())

(define-abbrev-table 'apropos-mode-abbrev-table '())

(define-abbrev-table 'awk-mode-abbrev-table '())

(define-abbrev-table 'c++-mode-abbrev-table '())

(define-abbrev-table 'c-mode-abbrev-table '())

(define-abbrev-table 'calendar-mode-abbrev-table '())

(define-abbrev-table 'comint-mode-abbrev-table '())

(define-abbrev-table 'completion-list-mode-abbrev-table '())

(define-abbrev-table 'conf-colon-mode-abbrev-table '())

(define-abbrev-table 'conf-javaprop-mode-abbrev-table '())

(define-abbrev-table 'conf-ppd-mode-abbrev-table '())

(define-abbrev-table 'conf-space-mode-abbrev-table '())

(define-abbrev-table 'conf-unix-mode-abbrev-table '())

(define-abbrev-table 'conf-windows-mode-abbrev-table '())

(define-abbrev-table 'conf-xdefaults-mode-abbrev-table '())

(define-abbrev-table 'emacs-lisp-mode-abbrev-table '())

(define-abbrev-table 'fundamental-mode-abbrev-table '())

(define-abbrev-table 'global-abbrev-table
  '(
    ("abbrev-t" "# jQuery
abbrev jqclick		# jQuery script tag with sample $( function() { click

# RAILS3 
abbrev rhgemfile	# Rails3 Gemfile example
abbrev rhva		# content validation
" nil 0)
    ("cheat" "	Cheat Sheet for Global Abbreviations

# jQuery
jqclick		# jQuery script tag with sample $( function() { click

# RAILS3 
rhgemfile	# Rails3 Gemfile example
rhva		# content validation
hm		# has_many
" nil 3)
    ("def" "	def
	end" nil 7)
    ("hm" "has_many :books, :through => :authorships" nil 4)
    ("jqclick" "        <script type=\"text/javascript\">
            $( function() {
                $('#testButton').click( function() {
                    $('#xyz').addClass('important');
                });
            });
        </script>" nil 6)
    ("rhgemfile" "source 'http://rubygems.org'

gem 'rails', '3.0.3'
gem 'sqlite3-ruby', '1.3.2', :require => 'sqlite3'
gem 'gravatar_image_tag', '1.0.0.pre2'
gem 'will_paginate', '3.0.pre2'

group :development do
  gem 'rspec-rails', '2.3.0'
  gem 'annotate-models', '1.0.4'
  gem 'faker', '0.3.1'
end

group :test do
  gem 'rspec', '2.3.0'
  gem 'webrat', '0.7.1'
  gem 'spork', '0.8.4'
  gem 'factory_girl_rails', '1.0'
end" nil 4)
    ("rhva" "validates :content, :length => { :maximum => 140 }" nil 9)
   ))

(define-abbrev-table 'grep-mode-abbrev-table '())

(define-abbrev-table 'html-mode-abbrev-table '())

(define-abbrev-table 'idl-mode-abbrev-table '())

(define-abbrev-table 'java-mode-abbrev-table '())

(define-abbrev-table 'js-mode-abbrev-table '())

(define-abbrev-table 'lisp-mode-abbrev-table '())

(define-abbrev-table 'message-mode-abbrev-table '())

(define-abbrev-table 'objc-mode-abbrev-table '())

(define-abbrev-table 'org-mode-abbrev-table '())

(define-abbrev-table 'outline-mode-abbrev-table '())

(define-abbrev-table 'pike-mode-abbrev-table '())

(define-abbrev-table 'prog-mode-abbrev-table '())

(define-abbrev-table 'rhtml-mode-abbrev-table '())

(define-abbrev-table 'ruby-mode-abbrev-table '())

(define-abbrev-table 'select-tags-table-mode-abbrev-table '())

(define-abbrev-table 'sgml-mode-abbrev-table '())

(define-abbrev-table 'sh-mode-abbrev-table '())

(define-abbrev-table 'shell-mode-abbrev-table '())

(define-abbrev-table 'snippet-mode-abbrev-table '())

(define-abbrev-table 'special-mode-abbrev-table '())

(define-abbrev-table 'speedbar-mode-abbrev-table '())

(define-abbrev-table 'text-mode-abbrev-table '())

(define-abbrev-table 'vc-git-log-view-mode-abbrev-table '())

(define-abbrev-table 'yaml-mode-abbrev-table '())

