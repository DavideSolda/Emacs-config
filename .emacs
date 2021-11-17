(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes (quote (tsdh-dark)))
 '(package-selected-packages
   (quote
    (counsel consuel ace-window org-bullets which-key try use-package org-ehtml))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;; setting variables
(setq inhibit-startup-screen t)
;; (menu-bar-mode -1)
(toggle-scroll-bar -1)
(tool-bar-mode -1)


;; bug fixed contactiong melpa
(setq package-enable-at-startup nil)
(setq package-check-signature nil)


(require 'package)

(add-to-list 'package-archives
	     '("melpa" . "https://melpa.org/packages/"))


(package-initialize)

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))
(use-package try
  :ensure t)
(use-package which-key
  :ensure t
  :config (which-key-mode))

;; org-mode stuff

(use-package org-bullets
  :ensure t
  :config
  (add-hook 'org-mode-hook (lambda() (org-bullets-mode 1))))


;; for auto completation in the bottom bar
(setq indo-enamble-flex-matching t) 
(setq ido-everywhere t)
(ido-mode 1)
(use-package counsel
  :ensure t)

(use-package swiper
  :ensure try
  :bind (("C-s" . swiper)
	 ("C-r" . swiper)
	 ("C-c C-r" . ivy-resume)
	 ("M-x" . counsel-M-x)
	 ("C-x C-f" . counsel-find-file))
  :config
  (progn
    (ivy-mode 1)
    (setq ivy-use-virtual-buffers t)
    (setq ivy-display-style 'fancy)
    (define-key read-expression-map (kbd "C-r") ' counsel-expression-history)
    ))

;; more interactive buffer frame
(defalias 'list-buffers 'ibuffer-other-window)


;; to move in frame configuations
;;(winner-mode 1)
;;(windmove-default-keybindings)

(use-package ace-window
  :ensure t
  :init
  (progn
    (global-set-key [remap other-window] 'ace-window)
    ))
