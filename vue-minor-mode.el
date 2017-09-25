;;; vue-minor-mode.el --- Minor mode for .vue files allowing code block editing in separate buffers     -*- lexical-binding: t; -*-

;; Copyright (c) 2017 Paul B Davis

;; Author: Paul B Davis <paul@dangersalad.com>
;; Version: 0.0.1
;; Package-Requires: (fence-edit)
;; Keywords: mode vuejs
;; Homepage: https://github.com/dangersalad/vue-minor-mode.el

;; Fence Edit requires at least GNU Emacs 24.4.

;; This file is not part of GNU Emacs.

;;; Commentary:

;; Minor mode for vuejs single file components which allows editing
;; the blocks of code in a separate editor buffer using the
;; appropriate major mode.
;;
;; Binds `C-c '` to edit the code within the block at the point.


;;; Code:

(require 'fence-edit)

(define-minor-mode vue-minor-mode
  "Minor mode for .vue files allowing code block editing in separate buffers."
  :lighter " vuejs"
  :keymap (let ((map (make-sparse-keymap)))
            (define-key map (kbd "C-c '") 'fence-edit-code-at-point)
            map)
  (make-local-variable 'fence-edit-blocks)
  (add-to-list 'fence-edit-blocks '("^<template>$" "^</template>$" web))
  (add-to-list 'fence-edit-blocks '("^<script>$" "^</script>$" js))
  (add-to-list 'fence-edit-blocks '("^<style[ ]?\\(scoped\\)?>" "^</style>$" css))
  (add-to-list 'fence-edit-blocks '("^<style lang=\"scss\"[ ]?\\(scoped\\)?>" "^</style>$" scss))
  (add-to-list 'fence-edit-blocks '("^<style lang=\"sass\"[ ]?\\(scoped\\)?>" "^</style>$" ssass)))



(provide 'vue-minor-mode)
;;; vue-minor-mode.el ends here


