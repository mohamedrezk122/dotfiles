(setq gc-cons-threshold (* 100 1024 1024))
  (defun indent-org-block-automatically ()
  (when (org-in-src-block-p)
   (org-edit-special)
    (indent-region (point-min) (point-max))
    (org-edit-src-exit)))

(run-at-time 1 10 'indent-org-block-automatically)

(set-selection-coding-system 'utf-8)
(prefer-coding-system 'utf-8)
(set-language-environment "UTF-8")
(set-default-coding-systems 'utf-8)
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
(setq locale-coding-system 'utf-8)
(when (display-graphic-p)
  (setq x-select-request-type '(UTF8_STRING COMPOUND_TEXT TEXT STRING)))

(require 'package)
 ;; (setq warning-minimum-level :emergency)
 (eval-and-compile
   (setq use-package-always-ensure t)
   (setq use-package-expand-minimally t)
   (setq use-package-compute-statistics t)
   (setq use-package-enable-imenu-support t))

 (eval-when-compile
   (require 'use-package)
   (require 'bind-key))

 (add-to-list 'load-path (expand-file-name "~/.config/emacs/lisp/"))
 (add-to-list 'package-archives 
     '("MELPA" .
       "http://melpa.org/packages/"))
 (package-initialize)

(setq python-indent-guess-indent-offset nil)  
 ;; (setq python-indent-guess-indent-offset-verbose nil)
 (global-undo-tree-mode)
 ;; smooth scrolling 
 ;; (good-scroll-mode 1)

 ;; (global-set-key [next] #'good-scroll-up-full-screen)
 ;; (global-set-key [prior] #'good-scroll-down-full-screen)

 (sublimity-mode 1)

 ;;(setq sublimity-scroll-weight 5
  ;;   sublimity-scroll-drift-length 10)
 ;;(setq sublimity-scroll-vertical-frame-delay 0.01)
;; (setq sublimity-map-size 20)
 ;;(setq sublimity-map-fraction 0.3)
 ;;(setq sublimity-map-text-scale -7)

 (use-package fzf
  :config
  (setq fzf/args "-x --color bw --print-query --margin=1,0 --no-hscroll"
        fzf/executable "fzf"
        fzf/git-grep-args "-i --line-number %s"
        fzf/grep-command "grep -nrH"
        fzf/position-bottom t
        fzf/window-height 15))

  (global-set-key (kbd "C-o") 'fzf )

(use-package ranger
:ensure t
:config
(setq ranger-show-hidden t)
(setq ranger-modify-header nil)
(setq ranger-dont-show-binary t)
(setq ranger-parent-width 0.3)
(setq ranger-footer-delay 0.002)
(setq ranger-deer-show-details nil)
(setq ranger-excluded-extensions '("mkv" "iso" "mp4"))
(ranger-override-dired-mode t))

(global-set-key (kbd "C-x r") 'ranger)
(global-set-key (kbd "C-x d") 'deer)

(dolist (mode '(dired-mode-hook
              ranger-mode-hook))
(add-hook mode
     (lambda ()
     (setq-default left-margin-width 0 right-margin-width 0) 
     (display-line-numbers-mode 0)
     (dired-hide-details-mode 1))))

;; (add-hook 'prog-mode-hook 'highlight-indent-guides-mode)
  ;; (setq highlight-indent-guides-method 'character)

  (setq-default cursor-type 'bar)
  (set-cursor-color "#ffffff") 
  ;;(set-face-attribute 'default nil :height 1.2)

  ;; auto close brackets
  (electric-pair-mode t)

  (global-visual-line-mode 1)
  (window-divider-mode t)
  (tab-bar-mode t)
  ;; Turn Off Cursor Alarms
  (setq ring-bell-function 'ignore)

  ;; save history  
  (savehist-mode +1)
  (setq savehist-additional-variables '(kill-ring search-ring
  regexp-search-ring))


  ;; hover to focus
  (setq mouse-autoselect-window t)

  ;; smooth scrolling
  ;; vertical scroll
  ;; (setq scroll-step 1)
  ;; (setq scroll-margin 1)
  ;; (setq scroll-conservatively 101)
  ;; (setq scroll-up-aggressively 0.2)
  ;; (setq scroll-down-aggressively 0.2)
  ;; (setq auto-window-vscroll nil)
  ;; (setq fast-but-imprecise-scrolling nil)
  ;; (setq mouse-wheel-scroll-amount '(1 ((shift) . 1)))
  ;; (setq mouse-wheel-progressive-speed nil)
  ;; horizontal scroll
  (setq hscroll-step 1)
  (setq hscroll-margin 1)


  (pdf-tools-install)
  (setq revert-without-query '(".pdf" ".org" ".md"))
  (dolist (mode '(image-mode-hook
                  doc-view-mode-hook
                  pdf-view-mode-hook))
          (add-hook mode (lambda() (display-line-numbers-mode 0))))

  (setq-default indent-tabs-mode nil)
  (setq-default tab-width 4)
  (setq indent-line-function 'insert-tab)


  ;; highlight line 
  ;;(global-hl-line-mode nil)

  ;; gui configs
  (setq-default frame-title-format '("M-EMACS - " user-login-name "@" system-name " - %b"))
  ;; simplify yes or no prompt 
  (fset 'yes-or-no-p 'y-or-n-p)
  (setq use-dialog-box nil)
  (setq inhibit-startup-message t)
  (menu-bar-mode -1)
  (tool-bar-mode -1)
  (blink-cursor-mode -1)
  (global-display-line-numbers-mode 1)
  (column-number-mode)
  (delete-selection-mode +1)
  (save-place-mode +1) ;; save cursor place in every file

  (setq package-check-signature nil)
  (auto-save-mode t)
  (auto-save-visited-mode t)
  (setq auto-save-interval 20)
  ;; open recent files 
  (recentf-mode 1)

  ;; prettify symbols
(global-prettify-symbols-mode 1)
(defun add-pretty-lambda ()
    (setq prettify-symbols-alist
          '(("lambda" . 955)
            ("delta" . 120517)
            ("epsilon" . 120518)
            ("->" . 8594)
            ("<=" . 8804)
            (">=" . 8805))))
  (add-hook 'prog-mode-hook 'add-pretty-lambda)
  (add-hook 'org-mode-hook 'add-pretty-lambda)

  ;; stoping emacs from writing configs 
  (setq disabled-command-function nil)
  (setq custom-file "~/.config/emacs/.emacs-custom.el")
  (load custom-file 'noerror)

  ;; save all opened buffers by calling 
(defun save-all-buffers ()
       (interactive)
       (save-some-buffers t))


(defun mark-whole-line ()
       (beginning-of-line)
       (set-mark-command nil)
       (end-of-line))

(defun kill-ring-save-whole-line-or-region ()
       (interactive)
       (if (region-active-p)
        (call-interactively #'kill-ring-save) ;; then
        (save-mark-and-excursion ;; else
        (mark-whole-line)
        (kill-ring-save (region-beginning) (region-end))
        (pop-mark)
        )))

(defun new-empty-tab ()
       (interactive)
       (tab-new)
       (switch-to-buffer "*scratch*"))

(global-set-key (kbd "C-n") 'new-empty-tab)

;; (use-package company
;;    :ensure t
;;    :config
;;    (setq company-idle-delay 0)
;;    (setq company-minimum-prefix-length 3)
;;    (global-company-mode t))

;; (defun my/python-mode-hook ()
;;   (add-to-list 'company-backends 'company-jedi))

;; (add-hook 'python-mode-hook 'my/python-mode-hook)
;; (use-package company-jedi
;;     :ensure t
;;     :config
;;     (add-hook 'python-mode-hook 'jedi:setup))

;; (defun my/python-mode-hook ()
;;   (add-to-list 'company-backends 'company-jedi))

;; (add-hook 'python-mode-hook 'my/python-mode-hook)


;; (vertico-mode)


;; ;; automcompletion
;; (use-package corfu
;; :ensure t
;; ;; Optional customizations
;; :custom
;; (corfu-cycle t)                 ; Allows cycling through candidates
;; (corfu-auto t)                  ; Enable auto completion
;; (corfu-auto-prefix 2)
;; (corfu-auto-delay 0.0)
;; ;; (corfu-popupinfo-delay '(0.5 . 0.2))
;; (corfu-preview-current 'insert) ; insert previewed candidate
;; (corfu-preselect 'prompt)
;; (corfu-on-exact-match nil)      ; Don't auto expand tempel snippets
;; ;; Optionally use TAB for cycling, default is `corfu-complete'.
;; ;; :bind (:map corfu-map
;; ;;             ("M-SPC"      . corfu-insert-separator)
;; ;;             ("TAB"        . corfu-next)
;; ;;             ([tab]        . corfu-next)
;; ;;             ("S-TAB"      . corfu-previous)
;; ;;             ([backtab]    . corfu-previous)
;; ;;             ("S-<return>" . corfu-insert)
;; ;;             ("RET"        . nil))
;; :init
;; (global-corfu-mode)
;; (corfu-history-mode)
;; (corfu-popupinfo-mode) ; Popup completion info
;; :config
;; (add-hook 'eshell-mode-hook
;;           (lambda () (setq-local corfu-quit-at-boundary t
;;                                  corfu-quit-no-match t
;;                                  corfu-auto nil)
;;             (corfu-mode))))
;; yasnippets
(use-package yasnippet

  :config
  (setq yas-snippet-dirs '("~/.config/emacs/snippets"))
  (yas-global-mode 1))


;; ;; flycheck
;; (use-package flycheck
;;   :ensure t
;;   :init
;;   (global-flycheck-mode t))


;; Evil Nerd Commenter
(use-package evil-nerd-commenter
  :bind
  (("C-c M-;" . c-toggle-comment-style)
   ("C-/" . evilnc-comment-or-uncomment-lines)))


;;(use-package python-mode
;;  :ensure nil
;;  :after flycheck
;;  :mode "\\.py\\'"
;;  :custom
;;  (python-indent-offset 4)
;;  (flycheck-python-pycompile-executable "python3")
;;  (python-shell-interpreter "python3"))

(use-package treemacs
  :ensure t
  :defer t
  :init
  (display-line-numbers-mode 0)
  (with-eval-after-load 'winum
    (define-key winum-keymap (kbd "M-0") #'treemacs-select-window))
  :config
  (progn
    (treemacs-follow-mode t)
    (treemacs-filewatch-mode t)
    (treemacs-fringe-indicator-mode 'always))
  :bind
  (:map global-map
        ("C-x b"   . treemacs)))

(use-package treemacs-icons-dired
  :hook (dired-mode . treemacs-icons-dired-enable-once)
  :ensure t)

(use-package treemacs-tab-bar 
  :after (treemacs)
  :ensure t
  :config (treemacs-set-scope-type 'Tabs))

;; (require 'treemacs-all-the-icons)
;; (treemacs-load-theme "doom-colors")

(use-package treemacs-nerd-icons
  :after treemacs
  :config (treemacs-load-theme "nerd-icons"))


(add-hook 'treemacs-mode-hook (lambda() (display-line-numbers-mode 0)))

(add-to-list 'recentf-exclude "\\ido.last\\'")

(use-package smex
  :ensure t
  )

(use-package ivy
  :ensure t
  )

(use-package swiper 
  :ensure t
  )

(use-package counsel 
  :ensure t
  )

(use-package ido-vertical-mode
  :ensure t
  )

(setq ido-vertical-define-keys 'C-n-C-p-up-down-left-right)
(setq ido-enable-flex-matching t)
(setq ido-everywhere t)
(setq ivy-count-format "")
(setq smex-auto-update t)
(setq smex-flex-matching t)
(ivy-mode t )
(ido-mode 1)
(ido-vertical-mode 1 )
(use-package mini-frame
  :ensure t 
  :custom-face
  (child-frame-border ((t (:background "dark orange"))))
  ;; :hook (after-init . mini-frame-mode)
  )

(org-babel-do-load-languages
 'org-babel-load-languages
 '((python . t)))

(custom-set-variables
 '(org-babel-python-command "/usr/local/bin/python3")
 '(mini-frame-color-shift-step 0)
 '(mini-frame-show-parameters
   '((top . 0.3)
     (width . 0.7)
     (left . 0.45)
     (child-frame-border-width . 1)
     )))

(defun my-minibuffer-setup ()
  (set (make-local-variable 'face-remapping-alist)
       '((default :height 1.5
                  ))))
(add-hook 'minibuffer-setup-hook 'my-minibuffer-setup)

(use-package doom-modeline
  :custom
  (inhibit-compacting-font-caches t)
  (doom-modeline-minor-modes nil)
  (doom-modeline-icon t)
  (doom-modeline-major-mode-color-icon t)
  (doom-modeline-height 35)
  (doom-modeline-bar-width 6)
  (doom-modeline-total-line-number t)
  (doom-modeline-enable-word-count t)
  :config
  (doom-modeline-mode))

(use-package markdown-mode
  :ensure t
  :init
  (setq markdown-command "pandoc -s --mathjax")
  :config
  (setq markdown-header-scaling nil)
  (setq markdown-hide-markup nil)
  (setq markdown-fontify-code-blocks-natively t)
  (setq markdown-enable-math t)
  :bind (:map markdown-mode-map
              ("C-t" . markdown-do)
              ("C-i" . markdown-toggle-inline-images))
  :custom-face
  (markdown-header-delimiter-face ((t (:foreground "#616161" :weight normal))))
  (markdown-header-face ((t (:foreground "wheat" :weight medium :family "CMU Serif"))))
  (markdown-header-face-1 ((t (:height 1.6  :inherit markdown-header-face ))))
  (markdown-header-face-2 ((t (:height 1.4  :inherit markdown-header-face ))))
  (markdown-header-face-3 ((t (:height 1.2  :inherit markdown-header-face ))))
  (markdown-header-face-4 ((t (:height 1.15 :inherit markdown-header-face ))))
  (markdown-header-face-5 ((t (:height 1.1  :inherit markdown-header-face ))))
  (markdown-header-face-6 ((t (:height 1.05 :inherit markdown-header-face )))))

(dolist (mode '(
                ;; org-mode-hook
                term-mode-hook
                shell-mode-hook))
  (add-hook mode (lambda() (display-line-numbers-mode 0))))

(defvar nb/current-line '(0 . 0)
 "(start . end) of current line in current buffer")
(make-variable-buffer-local 'nb/current-line)

;;;;;;;;;;; markdown hide markup while not editing
(defun nb/unhide-current-line (limit)
 "Font-lock function"
 (let ((start (max (point) (car nb/current-line)))
       (end (min limit (cdr nb/current-line))))
   (when (< start end)
     (remove-text-properties start end
                     '(invisible t display "" composition ""))
     (goto-char limit)
     t)))

(defun nb/refontify-on-linemove ()
 "Post-command-hook"
 (let* ((start (line-beginning-position))
        (end (line-beginning-position 2))
        (needs-update (not (equal start (car nb/current-line)))))
   (setq nb/current-line (cons start end))
   (when needs-update
     (font-lock-fontify-block 3))))

(defun nb/markdown-unhighlight ()
 "Enable markdown concealling"
 (interactive)
 (markdown-toggle-markup-hiding 'toggle)
 (font-lock-add-keywords nil '((nb/unhide-current-line)) t)
 (add-hook 'post-command-hook #'nb/refontify-on-linemove nil t))

(add-hook 'markdown-mode-hook
  (lambda()
        (flyspell-mode 1)
        (nb/markdown-unhighlight)
        (display-line-numbers-mode 0)
        ;; (centered-window-mode t) 
        (buffer-face-mode)
        (setq-default left-margin-width 2 right-margin-width 2) 
        ))
(add-hook 'markdown-mode-hook '(lambda () (buffer-face-set '(:family "CMU Sans Serif"))))

(use-package dashboard
  :ensure t
  :config
  (dashboard-setup-startup-hook)
  (setq dashboard-banner-logo-title "Welcome to Emacs !")
  (setq dashboard-center-content t)
  (setq dashboard-items '((recents  . 10)
                    ;; (bookmarks . 5)
                    ;; (projects . 5)
                    ;; (agenda . 5)
                    ;; (registers . 5)
                    ))
(setq dashboard-startup-banner "/home/rezk/Pictures/wallpapers/devil-emacs-2.png")
  )

;; for emacs daemon frames 
(setq initial-buffer-choice (lambda () (get-buffer-create "*dashboard*")))

(use-package vterm
  :ensure t)
(setq vterm-timer-delay 0.01)
 ;; st needs this patch : st.suckless.org/patches/workingdir/
 (defun open-terminal-in-workdir ()
         (interactive)
         (call-process-shell-command
              (concat "st -d " default-directory) nil 0))

 (defun open-emacs-term-in-workdir ()
         (interactive)
         (tab-new)
         (vterm (getenv "SHELL")))

 (add-hook 'vterm-mode-hook (lambda()
 (display-line-numbers-mode 0)
 (setq-local global-hl-line-mode nil)
))
 (global-set-key (kbd "C-c t") 'open-terminal-in-workdir)
 (global-set-key (kbd "C-x t") 'open-emacs-term-in-workdir)

(defun my-delete-word (arg)
   "Delete characters forward until encountering the end of a word.
    With argument, do this that many times.
    This command does not push text to `kill-ring'."
   (interactive "p")
   (delete-region
    (point)
    (progn
      (forward-word arg)
      (point)))) 

(defun my-backward-delete-word (arg)
   "Delete characters backward until encountering the beginning of a word.
    With argument, do this that many times.
    This command does not push text to `kill-ring'."
   (interactive "p")
   (my-delete-word (- arg)))

(defun my-backward-delete-line ()
   "Delete text between the beginning of the line and the end of line .
   This command does not push text to `kill-ring'."
   (interactive)
   (delete-region (progn (beginning-of-line 1) (point))  (progn (end-of-line 1) (point))))

(defun my-custom-backward-delete-word ()
      "Remove all whitespace if the character behind the cursor is whitespace, otherwise remove a word."
       (interactive)
       (if (looking-back "[ \n]")
       ;; delete horizontal space before us and then check to see if we
       ;; are looking at a newline
        (progn (delete-horizontal-space 't)
          (while (looking-back "[ \n]")
          (backward-delete-char 1)))
          ;; otherwise, just do the normal kill word.
         (my-backward-delete-word 1)))

(global-set-key [C-backspace]           'my-custom-backward-delete-word)
(global-set-key (kbd "C-k")             'my-backward-delete-line) 
(global-set-key (kbd "C-S-k")           'kill-whole-line)
(global-set-key (kbd "M-d")             'my-delete-word )

(define-key key-translation-map (kbd "ESC") (kbd "C-g"  ))   ;; cancel command
(global-set-key (kbd "C-a") 'mark-whole-buffer)
(global-set-key (kbd "C-v") 'yank)
(global-set-key (kbd "C-z") 'undo-tree-undo)
(global-set-key (kbd "C-y") 'undo-tree-redo)
(global-set-key [?\C-x right] 'split-window-right)
(global-set-key [?\C-x left]  'split-window-left)
(global-set-key [?\C-x down]  'split-window-below)
(global-set-key (kbd "M-g") 'shrink-window-horizontally)
(global-set-key (kbd "M-l") 'enlarge-window-horizontally)
(global-set-key (kbd "M-j") 'shrink-window)
(global-set-key (kbd "M-k") 'enlarge-window)
(global-set-key (kbd "C-x C-r") 'recentf-open-files)
(global-set-key (kbd "C-x C-f") 'counsel-find-file)
(global-set-key (kbd "M-a") 'beginning-of-buffer)
(global-set-key (kbd "M-e") 'end-of-buffer)
(global-set-key (kbd "C-d") 'duplicate-line)
(global-set-key (kbd "C-s") 'save-buffer)
(global-set-key (kbd "C-q") 'save-buffers-kill-terminal)
(global-set-key (kbd "C-w") 'kill-ring-save-whole-line-or-region)
(global-set-key (kbd "C-f") 'swiper-isearch)
(global-set-key (kbd "C-=") 'text-scale-increase)
(global-set-key (kbd "C--") 'text-scale-decrease)
(global-set-key (kbd "C-u") 'kill-region)
(global-set-key (kbd "<tab>") 'indent-relative)
(global-set-key (kbd "C-+") 'text-scale-set)
(global-set-key (kbd "C-'") 'indent-rigidly-right-to-tab-stop)
(global-set-key (kbd "C-;") 'indent-rigidly-left-to-tab-stop)
(global-set-key (kbd "C-i") 'math-preview-at-point)
(global-set-key (kbd "C-p") 'math-preview-all)
(global-set-key (kbd "M-x") 'counsel-M-x)
;; (global-set-key (kbd "M-X") 'smex-major-mode-commands)
;; (global-set-key (kbd "C-c C-c M-x") 'execute-extended-command)
(global-set-key (kbd "C-\\") 'flyspell-correct-word-before-point)
(global-set-key  [mouse-3]  'flyspell-correct-word-before-point)
(global-set-key (kbd "C-x C-s") nil)
(global-set-key (kbd "C-x C-s") #'save-all-buffers)
;; (define-key isearch-mode-map "\C-f" 'isearch-repeat-forward)

(font-lock-add-keywords 'org-mode
                        '(("^ *\\([-]\\) "
                           (0 (prog1 () (compose-region (match-beginning 1) (match-end 1) "•"))))))

  ;; (add-hook 'org-mode-hook 'variable-pitch-mode)

  ;; fold all blocks by default
  (setq org-startup-folded t)
  (setq org-hide-emphasis-markers nil)
   (add-hook 'org-mode-hook
  (lambda()
   ;; (org-modern-mode)
   (org-indent-mode)
   ;;(setq-default left-margin-width 2 right-margin-width 2)
   (flyspell-mode)))

  (setq org-agenda-files   (list "~/org/")
        org-log-done 'time)
  (setq org-adapt-indentation t)

   (org-defkey org-mode-map (kbd "C-l") 'org-cycle)
   (org-defkey org-mode-map (kbd "C-p") 'org-babel-switch-to-session-with-code)
   (org-defkey org-mode-map (kbd "C-t") 'org-todo)
   (org-defkey org-mode-map (kbd "C-b") 'org-latex-export-to-pdf)

  ;;(setq org-startup-with-latex-preview nil )
  (setq org-format-latex-options (plist-put org-format-latex-options :scale 2))
  ;; (add-hook 'org-mode-hook 'org-fragtog-mode)
  (setq org-display-inline-images nil)
  (setq org-table-auto-align-in-progress nil)

  (defun org-table-auto-align (begin end length)
    (save-match-data
      (unless (or org-table-auto-align-in-progress
                  (not (org-at-table-p))
                  (and (eq this-command 'org-self-insert-command)
                       (member (this-command-keys) '(" " "+" "|" "-"))))

        (run-with-idle-timer
         0 nil
         (lambda ()
           (if (looking-back "| *\\([^|]+\\)")
               (let ((pos (string-trim-right (match-string 1))))
                 (setq org-table-auto-align-in-progress t)
                 (unwind-protect
                     (progn
                       (org-table-align)
                       (search-forward pos nil t))
                   (setq org-table-auto-align-in-progress nil)))))))))


  (define-minor-mode org-table-auto-align-mode
    "A mode for aligning Org mode tables automatically as you type."
    :lighter " OrgTblAA"
    (if org-table-auto-align-mode 
        (add-hook 'after-change-functions #'org-table-auto-align t t)
      (remove-hook 'after-change-functions #'org-table-auto-align t)))

;; (custom-set-faces
;; '(org-level-1 ((t (:inherit outline-1 :height 1.5))))
;; '(org-level-2 ((t (:inherit outline-2 :height 1.4))))
;; '(org-level-3 ((t (:inherit outline-3 :height 1.2))))
;; '(org-level-4 ((t (:inherit outline-4 :height 1.1))))
;; '(org-level-5 ((t (:inherit outline-5 :height 1.0)))))

(use-package  org-download
:after org
:defer nil
:custom
(org-download-method 'directory)
(org-download-image-dir "org-images")
(org-download-heading-lvl nil)
;; (org-image-actual-width 300)
(org-download-timestamp "org-%Y%m%d-%H%M%S_")
(org-image-actual-width 900)
(org-download-screenshot-method "xclip -selection clipboard -t image/png -o > '%s'")
:bind
("C-x v" . org-download-screenshot)
:config
(require 'org-download))

;; use listings instead of verbatim
(add-to-list 'org-latex-packages-alist '("" "listings"))
(setq org-latex-listings 'listings)
(setq org-support-shift-select 'always)

(load "ob-diagrams.el")
(require 'ob-diagrams)


  ;; (add-hook 'org-mode-hook 'org-table-auto-align-mode)
;;   (defun my/text-scale-adjust-latex-previews ()
;;   (pcase major-mode
;;     ('latex-mode 
;;      (dolist (ov (overlays-in (point-min) (point-max)))
;;        (if (eq (overlay-get ov 'category)
;;                'preview-overlay)
;;            (my/zoom-latex-preview ov))))
;;     ('org-mode
;;      (dolist (ov (overlays-in (point-min) (point-max)))
;;        (if (eq (overlay-get ov 'org-overlay-type)
;;                'org-latex-overlay)
;;            (my/zoom-latex-preview ov))))))

;; (defun my/zoom-latex-preview (ov)
;;   (overlay-put
;;    ov 'display
;;    (cons 'image 
;;          (plist-put
;;           (cdr (overlay-get ov 'display))
;;           :scale (+ 1.0 (* 0.25 text-scale-mode-amount))))))

;; (add-hook 'text-scale-mode-hook #'my/text-scale-adjust-latex-previews)

;; (setq nerd-icons-scale-factor 1.1)
(defun efs/set-font-faces ()
  (message "Setting faces!")
  (load-theme 'gruber-darker t)
  (set-frame-font "Ubuntu Mono 33" nil t)
  (let* ((variable-tuple
          (cond 
           ((x-list-fonts "Ubuntu Mono")     '(:font "Ubuntu Mono"))
           ((x-list-fonts "ETBembo")         '(:font "ETBembo"))
           ((x-list-fonts "Source Sans Pro") '(:font "Source Sans Pro"))
           ((x-list-fonts "Lucida Grande")   '(:font "Lucida Grande"))
           ((x-list-fonts "Verdana")         '(:font "Verdana"))
           ((x-family-fonts "Sans Serif")    '(:family "Sans Serif"))
           (nil (warn "Cannot find a Sans Serif Font.  Install Source Sans Pro."))))
         (base-font-color     (face-foreground 'default nil 'default))
         (headline           `(:inherit default :weight bold :foreground ,base-font-color)))

    (custom-theme-set-faces
     'user
     `(org-level-8 ((t (,@headline ,@variable-tuple))))
     `(org-level-7 ((t (,@headline ,@variable-tuple))))
     `(org-level-6 ((t (,@headline ,@variable-tuple))))
     `(org-level-5 ((t (,@headline ,@variable-tuple))))
     `(org-level-4 ((t (,@headline ,@variable-tuple :height 1.0))))
     `(org-level-3 ((t (,@headline ,@variable-tuple :height 1.0 :weight normal :foreground "#d3869b"))))
     `(org-level-2 ((t (,@headline ,@variable-tuple :height 1.1 :weight normal :foreground "#fabd2f"))))
     `(org-level-1 ((t (,@headline ,@variable-tuple :height 1.2 :weight normal :foreground "#8ec07c"))))
     `(org-document-title ((t (,@headline ,@variable-tuple :height 1.2 :underline t :weight normal))))))
  (custom-set-faces
   ;; '(variable-pitch ((t (:family "ETBembo" :height 180 :weight thin))))
   '(border-face ((t (:background "#252525"))))
   '(comint-highlight-prompt ((t (:inherit minibuffer-prompt))))
   '(default ((t (:background "#252525" :foreground "#E6DAB1"))))
   '(font-lock-builtin-face ((t (:foreground "#fabd2f"))))
   '(font-lock-comment-delimiter-face ((t (:foreground "#928374" :slant italic))))
   '(font-lock-comment-face ((t (:foreground "#928374" :slant italic))))
   '(font-lock-constant-face ((t (:foreground "#d3869b"))))
   '(font-lock-doc-face ((t (:foreground "#928374" :slant italic))))
   '(font-lock-function-call-face ((t (:foreground "#E6DAB1" :weight semi-bold))))
   '(font-lock-function-name-face ((t (:foreground "#8ec07c" :weight medium))))
   '(font-lock-keyword-face ((t (:foreground "#fa5c4b" :weight normal))))
   '(font-lock-number-face ((t (:foreground "#d3869b"))))
   '(font-lock-operator-face ((t (:foreground "#fe8019"))))
   '(font-lock-string-face ((t (:foreground "#b8bb26"))))
   '(font-lock-type-face ((t (:foreground "#8ec07c"))))
   '(font-lock-variable-name-face ((t (:foreground "#E6DAB1"))))
   '(font-lock-variable-use-face ((t (:foreground "#E6DAB1"))))
   '(fringe ((t (:background "#252525" :foreground "#252525"))))
   ;;'(highlight ((t (:background "#333333" ))))
   '(line-number-current-line ((t (:inherit line-number :foreground "dark orange"
                                            :weight medium))))
   '(link ((t (:foreground "#8ec07c" :underline t))))
   '(linum-face ((t (:background "#252525"))))
   '(markdown-highlight-face ((t (:inherit highlight :background "white"))))
   '(minibuffer-prompt ((t (:foreground "#fabd2f"  ))))
   '(ido-first-match ((t (:foreground "#fabd2f" :weight semi-bold ))))
   '(mode-line ((t (:background "#3C3835" :foreground "#E6DAB1" :height 1.1))))
   '(mode-line-buffer-id ((t (:background "#3C3835" :foreground "#E6DAB1" ))))
   '(tab-bar ((t (:background "#191919"))))
   '(tab-bar-tab ((t (:weight normal :background "#252525" :height 150))))
   '(tab-bar-tab-group-current ((t (:inherit tab-bar-tab :box nil :weight bold))))
   '(tab-bar-tab-inactive ((t (:weight normal :height 150))))
   '(whitespace-newline ((t (:background "#181818" :foreground "#252525"))))
   '(org-block ((t ( :foreground "#E6DAB1" :extend t))))
   '(org-block-begin-line ((t (:foreground "#fabd2f"  :extend t))))
   '(org-block-end-line   ((t (:foreground "#fabd2f"  :extend t))))

   )
  (setq default-frame-alist
        '((background-color . "#252525")
          (foreground-color . "#E6DAB1"))))

(if (daemonp)
    (add-hook 'after-make-frame-functions
              (defun my/theme-init-daemon (frame)
                (with-selected-frame frame
                  (efs/set-font-faces))
                ;; Run this hook only once.
                (remove-hook 'after-make-frame-functions
                             #'my/theme-init-daemon)
                (fmakunbound 'my/theme-init-daemon)))
  (efs/set-font-faces))

(setq make-backup-files nil) ; stop creating ~ files
(icomplete-mode 1)

;; for moving/ dragging blocks or lines with M-(any arrow)
(drag-stuff-global-mode 1)
(drag-stuff-define-keys)



;; Run SageMath by M-x run-sage instead of M-x sage-shell:run-sage
(sage-shell:define-alias)

;; Turn on eldoc-mode in Sage terminal and in Sage source files
(add-hook 'sage-shell-mode-hook #'eldoc-mode)
(add-hook 'sage-shell:sage-mode-hook #'eldoc-mode)

(setq org-babel-default-header-args:sage '((:session . t)
                                           (:results . "output")))

(with-eval-after-load "org"
  (define-key org-mode-map (kbd "C-c c") 'ob-sagemath-execute-async))

(setq org-confirm-babel-evaluate nil)
(setq org-export-babel-evaluate nil)
(setq org-startup-with-inline-images nil)
;; (add-hook 'org-babel-after-execute-hook 'org-display-inline-images)
