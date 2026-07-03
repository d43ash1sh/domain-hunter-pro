# Contributing to Domain Hunter Pro

Thank you for your interest in contributing to **Domain Hunter Pro**! We welcome all contributions to make this domain checker more powerful, faster, and feature-rich.

To maintain code quality and ensure a smooth review process, please follow these guidelines.

## Code of Conduct

By participating in this project, you agree to treat all contributors with respect, constructiveness, and professional courtesy.

## How to Contribute

### 1. Fork & Clone
1. Fork the repository on GitHub.
2. Clone your fork locally:
   ```bash
   git clone https://github.com/YOUR_USERNAME/domain-hunter-pro.git
   cd domain-hunter-pro
   ```

### 2. Create a Feature Branch
Create a branch with a descriptive name:
```bash
git checkout -b feature/your-awesome-feature
```

### 3. Guidelines for Bash Scripting
To maintain reliability and portability:
* **Shell Safety:** Always use `set -euo pipefail` at the top of your scripts.
* **Linting:** Ensure your changes pass `shellcheck` with zero warnings. You can run it locally:
  ```bash
  shellcheck domain-hunter-pro.sh
  ```
* **TLD Additions:** If adding new TLDs, make sure they are widely used and supported by both RDAP and fallback WHOIS mechanisms.
* **Cross-Platform:** Keep terminal escape colors within standard ANSI sequences (compatible with both standard Linux terminal and macOS Terminal).

### 4. Commit Messages
Write clear, concise commit messages. We recommend using semantic commits, for example:
* `feat: add support for bulk domain lists`
* `fix: correct whois parser regex for .io domains`
* `docs: update roadmap checkmarks`

### 5. Submit a Pull Request
1. Push your branch to GitHub:
   ```bash
   git push origin feature/your-awesome-feature
   ```
2. Open a Pull Request (PR) from your branch to the main repository's `main` branch.
3. Provide a detailed summary of your changes in the PR description.
4. Verify that the automated **ShellCheck CI workflow** passes.

## Reporting Issues

If you find a bug or have a feature request, please search existing issues before opening a new one. Provide:
* Your OS version (Linux distro or macOS)
* Shell version (`bash --version`)
* Detailed steps to reproduce
* Expected vs actual behavior

Thank you for making Domain Hunter Pro better!
