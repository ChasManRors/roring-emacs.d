;;; Commentary:

;;
;; The muli-project-roots define the projects managed by
;; multi-project.  The project lists are composed of the name, project
;; directory, name of sub directory found within the project directory
;; for cursor placement, and the TAGS file to use.  If the TAGS entry
;; is missing, multi-project will look in the project directory for a
;; TAGS file.  To use multi-project just add the following lines
;; within your .emacs file:
;; 
;; (require 'multi-project)
;; (setq multi-project-roots '(("proj1" "C:/devenv/proj1/trunk" "Proj1SubDir"
;; 			     "C:/devenv/proj1/trunk/TAGS")
;; 			    ("proj2" "C:/devenv/proj2/trunk" "Proj2SubDir")
;; 			    ("remote" "ellis@host:")))
;;
;; The multi-project-compilation-command variable can be set to a function
;; that provides a customized compilation command.  For example,
;;
;; (defun my-compilation-command (project-list)
;;   (cond ((string-match "proj1" (car project-list))
;; 	 (concat "ant -f " (nth 1 project-list) "/" (nth 2 project-list)
;; 		 "/build.xml"))
;; 	(t
;; 	 (concat "make -C " (nth 1 project-list) "/" (nth 2 project-list)))))
;;
;; (setq multi-project-compilation-command 'my-compilation-command)
;;
;; The following bindings are created for multi-project
;; C-xpj - Project jump              Displays a list of projects
;; C-xpc - Project compile           Run the compilation command for a project
;; C-xpa - Anchor a project          Stores the project to be retrieved via
;;                                   multi-project-last
;; C-xpl - Last project from Anchor  Jumps to the project stored via the anchor
;; C-xpf - MultiProject Find file    Interactively search project files
;;
;; When displaying the list of projects the following bindings are present:
;; s     - Search projects:          Searches from the list of possible projects
;; C-n   - Next project              Move the cursor to the next project
;; C-p   - Previous project          Move the cursor to the previous project
;; a     - Anchor a project          Makes the project available to last project
;; r     - Reset search              Resets the project search
;; q     - quit
;;

