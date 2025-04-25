;;; mshogin.el --- Custom GPTel configurations and functions -*- lexical-binding: t; -*-

;; Author: Mike Shogin <mshogin@gmail.com>
;; Version: 0.1
;; Package-Requires: ((gptel "0.9.8") (emacs "27.1"))
;; Keywords: convenience, tools

;; This file is NOT part of GNU Emacs.

;;; Commentary:
;; Custom configurations and functions for GPTel.
;; This package provides convenient functions for composing prompts
;; and configuring LLM settings, especially useful in org-mode.

;;; Code:

(require 'gptel)

(defgroup mshogin nil
  "Custom configurations for GPTel."
  :group 'gptel)

(defcustom mshogin-default-model gptel-model
  "Default model to use for LLM requests."
  :type 'symbol
  :group 'mshogin)

(defcustom mshogin-default-system-message gptel--system-message
  "Default system message to use for LLM requests."
  :type 'string
  :group 'mshogin)

(defun mshogin-set-llm (model)
  "Set the LLM model to use.
MODEL should be a symbol representing a valid model name."
  (setq gptel-model model))

(defun mshogin-set-system (message)
  "Set the system message for the LLM.
MESSAGE should be a string containing the system message."
  (setq gptel--system-message message))

(defun mshogin-join-prompts (&rest prompts)
  "Join multiple PROMPTS with newlines between them.
Each prompt can be a string or nil.  Nil values are ignored."
  (string-join (seq-filter #'stringp prompts) "\n\n"))

(defun mshogin-prompt-role ()
  "Return a role-specific prompt.
This is a template function - customize it for your needs."
  "You are a software architect with extensive experience in designing scalable systems.")

(defun mshogin-prompt-task ()
  "Return a task-specific prompt.
This is a template function - customize it for your needs."
  "Please analyze the following from an architectural perspective.")

;; Example usage in org-mode:
;;
;; #+begin_src elisp :results silent
;;   (mshogin-set-llm 'gpt-4)
;;   (mshogin-set-system "You are a technical expert")
;;   (gptel-request
;;     (mshogin-join-prompts
;;       (mshogin-prompt-role)
;;       (mshogin-prompt-task)
;;       "tell me more about the architecture"))
;; #+end_src

(provide 'mshogin)
;;; mshogin.el ends here
