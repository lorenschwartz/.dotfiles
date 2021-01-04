;; ---------------------------------------------------------------------
;; GNU Emacs / N Λ N O - Emacs made simple
;; Copyright (C) 2020 - N Λ N O developers
;;
;; This program is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.
;;
;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.
;;
;; You should have received a copy of the GNU General Public License
;; along with this program. If not, see <http://www.gnu.org/licenses/>.
;; ---------------------------------------------------------------------

(require 'package)
(setq package-archives
      '(("melpa" . "http://melpa.org/packages/")
        ("gnu" . "http://elpa.gnu.org/packages/")
        ("org" . "http://orgmode.org/elpa/")))
(package-initialize)
(package-refresh-contents)

;; Path to nano emacs modules (mandatory)
(add-to-list 'load-path "~/nano-emacs")
(add-to-list 'load-path "~/.emacs.d/lisp")
(add-to-list 'load-path ".")
(add-to-list 'load-path "~/.emacs.d/elpa/use-package")

(when (not (package-installed-p 'use-package))
  (package-refresh-contents)
  (package-install 'use-package))

;; Configure Evil
(use-package evil
  :ensure t
  :init
  :config
  (evil-mode))

;; All-the-icons
(use-package all-the-icons
             :ensure t)

;; Use org-bullets instead of asterisks in org-mode files
(use-package org-bullets
  :ensure t
  :init
  (add-hook 'org-mode-hook 'org-bullets-mode))

;; Configure rainbow-delimiter-mode
(use-package rainbow-delimiters
  :ensure t)

;; Configure 'closure-mode
(use-package clojure-mode
  :ensure t
  :mode (("\\.clj\\'" . clojure-mode)
         ("\\.edn\\'" . clojure-mode))
  :init
  (add-hook 'clojure-mode-hook #'yas-minor-mode)
  (add-hook 'clojure-mode-hook #'linum-mode)
  (add-hook 'clojure-mode-hook #'subword-mode)
  (add-hook 'clojure-mode-hook #'smartparen-mode)
  (add-hook 'clojure-mode-hook #'rainbow-delimiters-mode)
  (add-hook 'clojure-mode-hook #'eldoc-mode))

;; Configure CIDER
(use-package cider
  :ensure t
  :defer t
  :init (add-hook 'cider-mode-hook #'clj-refactor-mode)
  :diminish subword-mode
  :config
  (setq nrepl-log-messages t
        cider-repl-display-in-current-window t
        cider-repl-use-clojure-font-lock t
        cider-prompt-save-file-on-load 'always-save
        cider-font-lock-dynamically '(macro core function var)
        nrepl-hide-special-buffers t
        cider-overlays-use-font-lock t)
  (cider-repl-toggle-pretty-printing))

;; Window layout (optional)
(require 'nano-layout)

;; Theming Command line options (this will cancel warning messages)
(add-to-list 'command-switch-alist '("-dark"   . (lambda (args))))
(add-to-list 'command-switch-alist '("-light"  . (lambda (args))))
(add-to-list 'command-switch-alist '("-default"  . (lambda (args))))

(cond
 ((member "-default" command-line-args) t)
 ((member "-dark" command-line-args) (require 'nano-theme-dark))
 (t (require 'nano-theme-light)))

;; Theme
(require 'nano-faces)
(nano-faces)

(require 'nano-theme)
(nano-theme)

;; Nano header & mode lines (optional)
(require 'nano-modeline)

;; Welcome message (optional)
(let ((inhibit-message t))
  (message "Welcome to GNU Emacs / N Λ N O edition")
  (message (format "Initialization time: %s" (emacs-init-time))))

;; Splash (optional)
(add-to-list 'command-switch-alist '("-no-splash" . (lambda (args))))
(unless (member "-no-splash" command-line-args)
  (require 'nano-splash))

(provide 'nano)

;; Org customizations
(require 'org-config)

;; Better defaults
(require 'better-defaults)

;; Packages
;; (provide 'my-packages)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   '(all-the-icons use-package yasnippet web-completion-data smartparens skewer-mode projectile powerline pos-tip pcre2el parent-mode paredit packed multiple-cursors markdown-mode magit-popup magit log4e json-snatcher json-reformat inflections inf-ruby iedit hydra highlight haml-mode gntp gh flyspell-correct flycheck flx f evil eval-sexp-fu dash-docs counsel company cider bind-map bind-key avy autothemer auto-complete anzu)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
