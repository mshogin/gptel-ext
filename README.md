# gptel-ext

Custom GPTel configurations and functions for Emacs.

## Description

This package provides convenient functions for composing prompts and configuring LLM settings, especially useful in org-mode. It extends the functionality of [GPTel](https://github.com/karthink/gptel) with additional customization options and helper functions.

## Features

- Customizable LLM model selection
- System message configuration
- Prompt composition utilities
- Role and task-specific prompt templates
- Org-mode integration

## Installation

### Manual Installation

1. Clone this repository:
   ```bash
   git clone https://github.com/mshogin/gptel-ext.git
   ```

2. Add the following to your Emacs configuration:
   ```elisp
   (add-to-list 'load-path "/path/to/gptel-ext")
   (require 'mshogin)
   ```

### Using straight.el

```elisp
(straight-use-package
 '(gptel-ext :type git :host github :repo "mshogin/gptel-ext"))
```

## Requirements

- Emacs 27.1 or later
- GPTel 0.9.8 or later

## Usage

```elisp
;; Set the LLM model
(mshogin-set-llm 'gpt-4)

;; Set the system message
(mshogin-set-system "You are a technical expert")

;; Compose and send a prompt
(gptel-request
  (mshogin-join-prompts
    (mshogin-prompt-role)
    (mshogin-prompt-task)
    "Your specific question here"))
```

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## Author

Mike Shogin <mshogin@gmail.com>