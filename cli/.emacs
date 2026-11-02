;;; .emacs --- Roman Asendorf's personal Emacs startup script

;; Adapted from: 2006 Marshall T. Vandegrift

;;; Commentary:

;; This file contains startup code needed to load the rest of the
;; Emacs configuration from the .emacs.el.d directory, plus the Emacs
;; "customization" system preferences.

;; Customize my world!
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(abbrev-mode t t)
 '(asm-comment-char 33)
 '(browse-url-browser-function 'browse-url-generic)
 '(browse-url-generic-args nil)
 '(c++-font-lock-extra-types
   '("\\sw+_t" "\\([iof]\\|str\\)+stream\\(buf\\)?" "ios" "string" "rope" "list"
     "slist" "deque" "vector" "bit_vector" "set" "multiset" "map" "multimap"
     "hash\\(_\\(m\\(ap\\|ulti\\(map\\|set\\)\\)\\|set\\)\\)?" "stack" "queue"
     "priority_queue" "type_info" "iterator" "const_iterator" "reverse_iterator"
     "const_reverse_iterator" "reference" "const_reference"
     "[A-Z]\\sw*[a-z]\\sw+"))
 '(c-backslash-column 32)
 '(c-font-lock-extra-types
   '("FILE" "bfd" "\\sw+_t" "Lisp_Object" "KG[^_]\\sw+"
     "[A-Z][a-z0-9]*\\(?:_[A-Z][a-z0-9]*\\)*"
     "\\(?:\\(?:[A-Z]\\|\\(?:[A-Z]+[a-z0-9]+I?\\)+\\)_\\)*\\(?:[A-Z][a-z0-9]*\\)+[a-z0-9]\\(?:[A-Z][a-z0-9]*\\)*\\(?:_\\(?:[euft_]\\|[0-9]+\\)\\)?"))
 '(case-fold-search t)
 '(column-number-mode t)
 '(compilation-error-screen-columns t)
 '(compilation-scroll-output nil)
 '(compilation-window-height nil)
 '(compile-auto-highlight nil)
 '(compile-command "make")
 '(current-language-environment "UTF-8")
 '(default-buffer-file-coding-system 'utf-8 t)
 '(default-file-name-encoding-system 'utf-8)
 '(default-input-method "ucs")
 '(default-keyboard-coding-system 'utf-8 t)
 '(default-mime-charset 'utf-8)
 '(default-terminal-coding-system 'utf-8 t)
 '(delete-selection-mode nil nil (delsel))
 '(display-buffer-reuse-frames nil)
 '(ebrowse--indentation 2)
 '(ecb-compilation-buffer-names
   '(("*Kill Ring*") ("*Calculator*") ("*vc*") ("*vc-diff*") ("*Apropos*")
     ("*Backtrace*") ("*Help*") ("*shell*") ("*bsh*") ("*Messages*")
     ("*compilation*") ("*grep*")))
 '(ecb-compile-window-enlarge-by-select t)
 '(ecb-compile-window-height 5)
 '(ecb-compile-window-temporally-enlarge 'both)
 '(ecb-compile-window-width 'edit-window)
 '(ecb-enlarged-compilation-window-max-height 'best)
 '(ecb-eshell-auto-activate nil)
 '(ecb-layout-name "left7")
 '(ecb-layout-nr 9)
 '(ecb-non-semantic-parsing-function nil)
 '(ecb-options-version "2.32")
 '(ecb-other-window-behavior 'edit-and-compile)
 '(ecb-other-window-jump-behavior 'edit-and-compile)
 '(ecb-primary-secondary-mouse-buttons 'mouse-1--C-mouse-1)
 '(ecb-select-edit-window-on-redraw t)
 '(ecb-source-path '(("/" "/")))
 '(ecb-tip-of-the-day nil)
 '(ecb-tree-buffer-style 'image)
 '(ecb-tree-image-icons-directories
   '("/usr/share/emacs/site-lisp/ecb/ecb-images/default/height-17"
     (ecb-directories-buffer-name
      . "/usr/share/emacs/site-lisp/ecb/ecb-images/directories/height-17")
     (ecb-sources-buffer-name
      . "/usr/share/emacs/site-lisp/ecb/ecb-images/sources/height-14_to_21")
     (ecb-methods-buffer-name
      . "/usr/share/emacs/site-lisp/ecb/ecb-images/methods/height-14_to_21")))
 '(ecb-wget-setup (cons "wget" 'cygwin))
 '(ediff-window-setup-function 'ediff-setup-windows-plain)
 '(fast-lock-cache-directories '("~/.emacs-flc"))
 '(fast-lock-save-events '(kill-buffer kill-emacs))
 '(fill-column 80)
 '(flyspell-abbrev-p t)
 '(flyspell-use-global-abbrev-table-p t)
 '(flyspell-use-meta-tab nil)
 '(font-lock-support-mode 'jit-lock-mode t)
 '(footnote-section-tag-regexp "Footnotes\\(\\[.\\]\\)?: *")
 '(footnote-use-message-mode nil)
 '(global-font-lock-mode t nil (font-lock))
 '(grep-command "grep -n -e ")
 '(help-char 26)
 '(help-event-list '(help f1))
 '(ido-decorations
   '("{" "}" " | " " | ..." "[" "]" " [No match]" " [Matched]" " [Not readable]"
     " [Too big]"))
 '(ido-enable-tramp-completion t)
 '(ido-enabled ''both t)
 '(ido-everywhere t)
 '(ido-mode 'both nil (ido))
 '(ido-show-dot-for-dired t)
 '(ido-use-filename-at-point 'guess)
 '(indent-tabs-mode nil)
 '(inhibit-startup-screen t)
 '(ispell-program-name "aspell")
 '(iswitchb-case t)
 '(iswitchb-default-method 'samewindow)
 '(iswitchb-define-mode-map-hook '(llasram/iswitchb-extra-keys))
 '(iswitchb-mode nil)
 '(kill-whole-line t)
 '(lazy-lock-defer-on-the-fly t)
 '(lj-update-mode-hook '(force-flyspell-mode))
 '(lpr-switches nil)
 '(ls-lisp-dirs-first t)
 '(makefile-mode-hook
   '(semantic-default-make-setup (lambda nil (setq tab-width 4))) t)
 '(mime-charset-coding-system-alist
   '((x-unknown . undecided) (unknown . undecided) (cp874 . tis-620)
     (windows-874 . tis-620) (iso-2022-jp-3 . iso-2022-7bit-ss2)
     (us-ascii . raw-text)))
 '(mm-body-charset-encoding-alist
   '((utf-16 . base64) (utf-16be . base64) (utf-16le . base64)
     (utf-8 . quoted-printable) (iso-8859-1 . quoted-printable)))
 '(mm-coding-system-priorities '(utf-8 iso-8859-1))
 '(mm-decrypt-option 'always)
 '(mm-discouraged-alternatives '("text/html"))
 '(mm-text-html-renderer 'html2text)
 '(mm-verify-option 'always)
 '(mml-signencrypt-style-alist
   '(("smime" separate) ("pgp" combined) ("pgpauto" combined) ("pgpmime" combined)))
 '(mmm-submode-decoration-level 2)
 '(mouse-avoidance-mode nil nil (avoid))
 '(mouse-wheel-mode t nil (mwheel))
 '(mouse-yank-at-point t)
 '(muse-html-encoding-default 'utf-8)
 '(nxml-slash-auto-complete-flag t)
 '(pc-select-selection-keys-only t)
 '(pc-selection-mode t)
 '(ps-run-x '("gs" "-r72" "-sPAPERSIZE=a4"))
 '(psgml-html-build-new-buffer nil)
 '(read-mail-command 'gnus)
 '(read-quoted-char-radix 16)
 '(ruby-electric-expand-delimiters-list nil)
 '(save-place t nil (saveplace))
 '(scroll-bar-mode 'right)
 '(scroll-conservatively 0)
 '(scroll-down-aggressively t)
 '(scroll-step 0)
 '(search-exit-option t)
 '(select-enable-clipboard nil)
 '(send-mail-function 'sendmail-send-it)
 '(set-buffer-file-coding-system 'utf-8)
 '(set-default-font "-misc-fixed-medium-r-normal--13-*-75-*-*-*-*-*")
 '(set-language-environment 'utf-8)
 '(set-terminal-coding-system 'utf-8)
 '(size-indication-mode t)
 '(tab-width 4)
 '(temp-buffer-max-height (lambda (buffer) (/ (- (frame-height) 2) 3)))
 '(temp-buffer-resize-mode t nil (help))
 '(text-mode-hook
   '(turn-on-auto-fill (lambda nil (flyspell-mode))
                       (lambda nil (local-set-key "\211" 'ispell-complete-word))))
 '(tool-bar-mode nil nil (tool-bar))
 '(tooltip-mode nil nil (tooltip))
 '(user-full-name "Mibu Kyoshiro")
 '(user-mail-address "mibukyoshiro@me.com")
 '(vc-cvs-diff-switches nil)
 '(vc-diff-switches nil)
 '(vc-rcs-diff-switches nil)
 '(vc-sccs-diff-switches nil)
 '(woman-use-own-frame nil))

;; Some window system only preferences, getting speedbar left to the main window
;;(if window-system
;;    (progn (set-frame-position (selected-frame) (. 120) (. 120))))
;;(if window-system
;;    (progn (set-frame-width (selected-frame) 101)
;;(set-frame-height (selected-frame) 52)))

;; Themeing if i like
;;(if (require 'color-theme nil t) (color-theme-initialize) (color-theme-tty-dark))

;; Customize my face!

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:stipple nil :background "#ffffff" :foreground "#000000" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight regular :height 120 :width normal :foundry "GOOG" :family "Noto Sans"))))
 '(font-lock-comment-face ((((class color) (background light)) (:foreground "Firebrick"))))
 '(highlight-beyond-fill-column-face ((t (:background "red"))))
 '(ido-first-match ((t (:foreground "darkred"))))
 '(ido-only-match ((((class color)) (:foreground "darkred"))))
 '(ido-subdir ((((min-colors 88) (class color)) (:foreground "blue"))))
 '(info-header-node ((t (:inherit info-node))))
 '(info-header-xref ((t (:inherit info-xref))))
 '(info-menu-star ((((class color)) (:foreground "red1"))))
 '(info-node ((t (:foreground "blue" :slant italic :weight bold))))
 '(info-xref ((t (:foreground "magenta4" :weight bold))))
 '(mmm-code-submode-face ((t (:box (:line-width 1 :color "Purple")))))
 '(mmm-comment-submode-face ((t (:foreground "#ff0000" :box (:line-width 1 :color "ff0000")))))
 '(mmm-default-submode-face ((t (:background "#dddddd"))))
 '(mmm-output-submode-face ((t (:box (:line-width 1 :color "#0000a0")))))
 '(yaml-tab-face ((((class color)) (:background "red" :inverse-video unspecified)))))
(server-start)
