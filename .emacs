;普通设置
(setq inhibit-startup-message t);关闭Emacs启动时的画面
(setq initial-scratch-message "")
(setq visible-bell t);关闭出错时的提示声
(setq make-backup-files nil);不产生备份文件
(setq major-mode 'text-mode);一打开就起用 text 模式
(global-font-lock-mode t);语法高亮
(auto-image-file-mode t);打开图片显示功能
(fset 'yes-or-no-p 'y-or-n-p);以 y/n代表 yes/no
(column-number-mode t);显示列号
(show-paren-mode t);显示括号匹配
(display-time-mode 1);显示时间，格式如下
(setq display-time-24hr-format t)
(setq display-time-day-and-date t)
(tool-bar-mode nil);去掉那个大大的工具栏
(scroll-bar-mode nil);去掉滚动条
;(mouse-avoidance-mode 'animate);光标靠近鼠标指针时，让鼠标指针自动让开
(setq mouse-yank-at-point t);支持中键粘贴
(transient-mark-mode t);允许临时设置标记
(setq x-select-enable-clipboard t);支持emacs和外部程序的粘贴
(setq frame-title-format '("" buffer-file-name "@emacs" ));在标题栏显示buffer名称
(setq default-fill-column 80);默认显示 80列就换行

;;for shell-mode ls problem
;;(autoload 'ansi-color-for-comint-mode-on "ansi-color" nil t)
;;(add-hook 'shell-mode-hook 'ansi-color-comint-mode-on)


;;indent
(setq c-default-style "K&R"
      c-basic-offest 2)
(setq tab-width 4)

;(setq c-mode-hook
;	(function (lambda()
;			(setq indent-tabs-mode nil)
;			(setq c-indent-level 4))))
;(setq objc-mode-hook
;	(function (lambda()
;			(setq indent-tabs-mode nil)
;			(setq c-indent-level 4))))
;(setq c++-mode-hook
;	(function (lambda()
;			(setq indent-tabs-mode nil)
;			(setq c-indent-level 4))))

;;user information
(setq user-mail-address "huf07@mails.tsinghua.edu.cn")
(setq user-full-name "hufeng")

;;color theme
(add-to-list 'load-path "/home/feng/.emacs.d/color-theme-6.6.0")
(require 'color-theme)
(eval-after-load "color-theme"
  '(progn
     (color-theme-initialize)
     (color-theme-tty-dark)))


(add-to-list 'load-path "/home/feng/.emacs.d")
;;auto-complete
(require 'auto-complete)
(global-auto-complete-mode t)

;;psvn
(require 'psvn)

;;yasnippet
(add-to-list 'load-path "/home/feng/.emacs.d/yasnippet-0.6.1c")
(require 'yasnippet)
(yas/initialize)
(yas/load-directory "~/.emacs.d/yasnippet-0.6.1c/snippets")

;;python-el
;;(load-library "init_python")

;c & c++ coding
;(add-hook 'c-mode-hook 'linux-c-mode)
;(add-hook 'c++-mode-hook 'linux-cpp-mode)
;(c-set-style "K&R")

;鼠标滚轮，默认的滚动太快，这里改为3行
 (defun up-slightly () (interactive) (scroll-up 3))
 (defun down-slightly () (interactive) (scroll-down 3))
 (global-set-key [mouse-4] 'down-slightly)
 (global-set-key [mouse-5] 'up-slightly)

 ;; Load CEDET
 (load-file "~/.emacs.d/cedet-1.0pre7/common/cedet.el")

 ;; if you plan to use projects, then you need to switch on corresponding mode - it's implemented by EDE package:
 (global-ede-mode t)

;; Enabling various SEMANTIC minor modes.  See semantic/INSTALL for more ideas.
;; Select one of the following:

;; * This enables the database and idle reparse engines
(semantic-load-enable-minimum-features)

;; * This enables some tools useful for coding, such as summary mode
;;   imenu support, and the semantic navigator
;(semantic-load-enable-code-helpers)

;; * This enables even more coding tools such as the nascent intellisense mode
;;   decoration mode, and stickyfunc mode (plus regular code helpers)
;; (semantic-load-enable-guady-code-helpers)

;; * This turns on which-func support (Plus all other code helpers)
;;(semantic-load-enable-excessive-code-helpers)

;; This turns on modes that aid in grammar writing and semantic tool
;; development.  It does not enable any other features such as code
;; helpers above.
(semantic-load-enable-semantic-debugging-helpers)

;; if you use gcc for programming in C @ C++, then Semantic can automatically find path, where syustem includ files are located. TO do this, you need to load sdemantic-gcc package with following command:
;;(require 'semantic-gcc)

;;(defconst cedet-user-include-dirs
;;  (list ".." "../include" "../inc" "../common" "../public" "../.." "../../include" "../../common" "../../public" 
;;        "/usr/include" 
;;        "/usr/include/c++/4.4"
;;        "/usr/local/include/opencv"))
;;(require 'semantic-c nil 'noerror)
;;(let ((include-dirs cedet-user-include-dirs)))

(global-semanticdb-minor-mode 1)
(semantic-add-system-include "/usr/local/include/opencv" 'c-mode)
(semantic-add-system-include "/usr/local/include/opencv" 'c++-mode)

;; to use additional features for names completion, and displaying of information for tags and classes, you also need to load the semantic-ia package. THis could be preformed with following command:
(require 'semantic-ia)


;;切换.h和.cpp文件
(require 'eassist nil 'noerror)
(global-set-key [M-f12] 'eassist-switch-h-cpp)

;;代码折叠
(require 'semantic-tag-folding nil 'noerror)
(global-semantic-tag-folding-mode 1)
(global-set-key (kbd "C-?") 'global-semantic-tag-folding-mode)
(define-key semantic-tag-folding-mode-map (kbd "C-c , _") 'semantic-tag-folding-fold-block)
(define-key semantic-tag-folding-mode-map (kbd "C-c , +") 'semantic-tag-folding-show-block)
(define-key semantic-tag-folding-mode-map (kbd "C-_") 'semantic-tag-folding-fold-all)
(define-key semantic-tag-folding-mode-map (kbd "C-+") 'semantic-tag-folding-show-all)

;;(defun my-semantic-hook ()
;;	(imenu-add-to-menubar "TAGS"))
;;(add-hook 'semantic-init-hooks 'my-semantic-hook)

;;(ede-cpp-root-project "AdaboostDetection"
;;	:name "AdaboostDetection Project"
;;	:file "~/work/project/AdaboostDetection/trunk/Makefile"
;;	:include-path '("/"
;;			"/liblinear-weights-1.51"
;;			)
;;	:system-include-path '("/usr/include/opencv"))
;;
;;(setq opencv-base-dir "/usr/include/opencv")
;;(semantic-add-system-include opencv-base-dir 'c++-mode)
;;(add-to-list 'auto-mode-alist (cons opencv-base-dir 'c++-mode))
;;(add-to-list 'semantic-lex-c-preprocessor-symbol-file (concat opencv-base-dir "/cxcore.h"))
;;(add-to-list 'semantic-lex-c-preprocessor-symbol-file (concat opencv-base-dir "/cv.h"))
;;(add-to-list 'semantic-lex-c-preprocessor-symbol-file (concat opencv-base-dir "/highgui.h"))
;;(add-to-list 'semantic-lex-c-preprocessor-symbol-file (concat opencv-base-dir "/ml.h"))
;;(add-to-list 'semantic-lex-c-preprocessor-symbol-file (concat opencv-base-dir "/cvaux.h"))

(global-set-key [(control tab)] 'semantic-ia-complete-symbol-menu)
(global-set-key [f12] 'semantic-ia-fast-jump)
;;(define-key c-mode-map [(control tab)] 'semantic-ia-complete-symbol-menu)
;;(define-key c++-mode-map [(control tab)] 'semantic-ia-complete-symbol-menu)
;;(defun my-cedet-hook ()
;;	(local-set-key [(control return)] 'semantic-ia-complete-symbol)
;;	(local-set-key "\C-c?" 'semantic-ia-complete-symbol-menu)
;;	(local-set-key "\C-c>" 'semantic-complete-analyze-inline)
;;	(local-set-key "\C-cp" 'semantic-analyze-proto-imp-toggle))
;;(add-hook 'c-mode-common-hook 'my-cedet-hook)


(global-set-key [(f4)] 'speedbar)


;load ecb
(add-to-list 'load-path "~/.emacs.d/ecb-2.40")
(require 'ecb)
(require 'ecb-autoloads)
(custom-set-variables
  ;; custom-set-variables was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(column-number-mode t)
 '(display-time-mode t)
 '(ecb-options-version "2.40")
 '(ecb-source-path (quote (("~/work/LockScreen" "LockScreen") ("~/work/MeiXiu" "MeiXiu") ("~/work/BoostDetection/trunk" "BoostDetection"))))
 '(jde-global-classpath (quote ("/home/feng/android/android-sdk-linux/platforms/android-2.1")))
 '(jde-jdk-registry (quote (("1.5.0" . "/home/feng/java/jdk1.5.0_22"))))
 '(show-paren-mode t))
(custom-set-faces
  ;; custom-set-faces was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(default ((t (:inherit nil :stipple nil :background "black" :foreground "#c0c0c0" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 89 :width normal :foundry "unknown" :family "DejaVu Sans Mono")))))

;;jdee
(add-to-list 'load-path (expand-file-name "~/.emacs.d/jdee-2.4.0.1/lisp"))
(require 'jde)

(define-key jde-mode-map [(control tab)] 'jde-complete-menu)


;;(setq jde-compile-option-classpath (quote("./" "../" "../../" "../../.." "~/java/jdk1.5.0_22/lib/dt.jar" "~/java/jdk1.5.0_22/lib/tools.jar" "~/android/android-sdk-linux/platforms/android-2.1/android.jar")))

(load "auctex.el" nil t t) 
(load "preview-latex.el" nil t t) 
;(setq TeX-auto-save t) 
;(setq TeX-parse-self t) 
;(setq-default TeX-master nil) 
;(add-hook 'LaTeX-mode-hook 'LaTeX-install-toolbar) 
;(add-hook 'LaTeX-mode-hook 'turn-on-auto-fill) 
;(add-hook 'LaTeX-mode-hook 'turn-on-reftex)

;(add-to-list 'load-path "/usr/local/share/emacs/emms-3.0")
;(require 'emms-setup)
;(emms-standard)
;(emms-default-players)


;;doxymacs
(add-to-list 'load-path "~/.emacs.d/doxymacs")
(require 'doxymacs)
(add-hook 'c-mode-common-hook 'doxymacs-mode)
;;注释高亮，针对C和C++程序
(defun my-doxymacs-font-lock-hook ()
  (if (or (eq major-mode 'c-mode) (eq major-mode 'c++-mode))
       (doxymacs-font-lock)))
(add-hook 'font-lock-mode-hook 'my-doxymacs-font-lock-hook)

;;matlab
(add-to-list 'load-path "~/.emacs.d/matlab-emacs")
(load-library "matlab-load")
;;Enable CEDET feature support for matlab mode
(matlab-cedet-setup)

;;cscope
(add-to-list 'load-path "~/.emacs.d/xcscope")
(require 'xcscope)

;;session
(setq load-path (cons(expand-file-name "~/.emacs.d/session") load-path))
(require 'session)
(add-hook 'after-init-hook 'session-initialize)

;;muse
(setq loadpath (add-to-list 'load-path "~/.emacs.d/muse-latest/lisp"))
(require 'muse-mode)
(require 'muse-publish)
(require 'muse-html)
(require 'muse-wiki nil t)
(require 'muse-project)

(define-key global-map "\C-c\C-f" 'muse-project-find-file)

;;(setq muse-html-charset-default "utf-8")
;;(setq muse-html-encoding-default "utf8")

(setq muse-project-alist
      '(("MyWiki"
	 ("~/Documents/wiki" :default "index")
	 (:base "html" :path "~/Documents/wiki/publish"))))


;;android
(add-to-list 'load-path "~/.emacs.d/android-mode")
;;(require 'android)
(require 'android-mode)

;;git
(require 'magit)

(put 'upcase-region 'disabled nil)

;;org-mode
(setq org-hide-leading-starts t)
(define-key global-map "\C-ca" 'org-agenda)
(setq org-log-done 'time)

