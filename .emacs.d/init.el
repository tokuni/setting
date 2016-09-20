;;;; Configurations for Emacs
;;;;;;;                                       Takaaki ISHIKAWA  <takaxp@ieee.org>
;;;;;;; Cite: http://www.mygooglest.com/fni/dot-emacs.html (GREAT!)

;(load "~/.emacs.d/acl2-doc.el")
;(load "~/.emacs.d/emacs-acl2.el")


(line-number-mode t) 
(column-number-mode t)


(show-paren-mode t)
(transient-mark-mode t)

;(load-file "/MYCOMPILEDIRECTORY/ssreflect-1.5/pg-ssr.el")
(setq coq-prog-name "/home/shi/.opam/4.02.3/bin/coqtop")
:
;(load-file "/usr/share/emacs/site-lisp/ProofGeneral/generic/proof-site.el")

(load "~/.emacs.d/lisp/PG/generic/proof-site")
;(defvar acl2-skip-shell t)
;(defvar *acl2-shell* "*inferior-acl2*")
;(defvar inferior-acl2-program "acl2")
;(load-file "/home/shi/.emacs.d/lisp/PG/acl2/acl2.el")


(require 'package)
(add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/") t)
(add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/"))
(package-initialize)
;ほかん
(require 'auto-complete-config)
(ac-config-default)
(add-to-list 'ac-modes 'text-mode) ;; text-modeでも自動的に有効
(add-to-list 'ac-modes 'fundamental-mode)  ;; fundamental-mode
(add-to-list 'ac-modes 'org-mode)
(add-to-list 'ac-modes 'yatex-mode)
(ac-set-trigger-key "TAB")
(setq ac-use-menu-map t)    ;; 補完メニュー表示時にC-n/C-pで移動
(setq ac-use-fuzzy t)     ;; 曖昧な物マッチ


;必須設定
;(add-to-list 'load-path "~/.emacs.d/elpa/sly")
(require 'sly-autoloads)
(require 'sly)
(setq inferior-lisp-program "sbcl")

;(setq sly-lisp-implementations
;      '((sbcl ("sbcl" "--core" "sbcl.core-for-sly"))))

;(setq sly-lisp-implementations
;     '((sbcl ("sbcl" "--core" "sbcl.core-with-slynk")
;            :init (lambda (port-file _)
;                   (format "(slynk:start-server %S)\n" port-file)))))

(require 'ac-slime)
(add-hook 'slime-mode-hook 'set-up-slime-ac)
(add-hook 'slime-repl-mode-hook 'set-up-slime-ac)
(eval-after-load "auto-complete"
  '(add-to-list 'ac-modes 'slime-repl-mode))




(use-package clojure-mode
	call dein#add('Shougo/vimproc.vim')
			 :init
			 (add-hook 'clojure-mode-hook #'yas-minor-mode)
			 (add-hook 'clojure-mode-hook #'subword-mode))

(use-package cider
			 :init
			 (add-hook 'cider-mode-hook #'clj-refactor-mode)
			 (add-hook 'cider-mode-hook #'company-mode)
			 (add-hook 'cider-mode-hook #'eldoc-mode)
			 (add-hook 'cider-repl-mode-hook #'company-mode)
			 (add-hook 'cider-repl-mode-hook #'eldoc-mode)
			 :diminish subword-mode
			 :config
			 (setq nrepl-log-messages t
				   cider-repl-display-in-current-window t
				   cider-repl-use-clojure-font-lock t
				   cider-prompt-save-file-on-load 'always-save
				   cider-font-lock-dynamically '(macro core function var)
				   cider-overlays-use-font-lock t)
			 (cider-repl-toggle-pretty-printing))

(use-package clj-refactor
			   :diminish clj-refactor-mode
			     :config (cljr-add-keybindings-with-prefix "C-c j"))

;haskell
(require 'haskell-mode)
(require 'haskell-cabal)
(add-to-list 'auto-mode-alist '("\\.hs$" . haskell-mode))
(add-to-list 'auto-mode-alist '("\\.lhs$" . literate-haskell-mode))
(add-to-list 'auto-mode-alist '("\\.cabal\\'" . haskell-cabal-mode))

:ocaml
(add-to-list 'auto-mode-alist '("\\.ml[iylp]?" . tuareg-mode))
(autoload 'tuareg-mode "tuareg" "Major mode for editing OCaml code" t)
(autoload 'tuareg-run-ocaml "tuareg" "Run an inferior OCaml process." t)
(autoload 'ocamldebug "ocamldebug" "Run the OCaml debugger" t)


