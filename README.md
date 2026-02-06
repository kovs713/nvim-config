<div align="center">
  <p>
    <img alt="Linux" src="https://img.shields.io/badge/Linux-%23.svg?style=flat-square&#x26;logo=linux&#x26;color=FCC624&#x26;logoColor=black">
    <a href="https://github.com/neovim/neovim/releases/tag/stable">
        <img src="https://img.shields.io/badge/Neovim-0.11.5-blueviolet.svg?style=flat-square&logo=Neovim&logoColor=green" alt="Neovim minimum version"/>
    </a>
    <img src="https://img.shields.io/github/languages/top/kovs713/nvim-config" alt="Top languages">
    <a href="https://github.com/kovs713/nvim-config/graphs/commit-activity">
        <img src="https://img.shields.io/github/commit-activity/m/kovs713/nvim-config?style=flat-square">
    </a>
    <a href="https://github.com/kovs713/nvim-config/blob/master/LICENSE.md">
        <img src="https://img.shields.io/github/repo-size/kovs713/nvim-config?style=flat-square">
    </a>
    <img src="https://img.shields.io/github/license/kovs713/nvim-config?style=flat-square&#x26;logo=GNU&#x26;label=License" alt="License">
  </p>
</div>

# Neovim Config

My personal Lua-based Neovim configuration. Focused on productivity, modern UI, and developer tools  (likely for TypeScript development).

## Installation

1. Backup your current Neovim config: `mv ~/.config/nvim ~/.config/nvim.bak`
2. Clone this repo: `git clone https://github.com/kovs713/nvim-config.git ~/.config/nvim`
3. Launch Neovim: `nvim` (plugins will auto-install via lazy.nvim)

## Overview

This config uses [lazy.nvim](https://github.com/folke/lazy.nvim) for plugin management, with plugins organized into enabled/disabled folders and categorized for easy maintenance. It includes LSP support, Obsidian notes tooling, Treesitter syntax, Git integration, and more.

### Requirements
- Neovim v0.11.5
- Git (for repo management).
- Node.js (for some LSP servers like TypeScript).
- Optional: ripgrep (for faster searching), fd (for file finding), ImageMagick (for image previews).

### Screenshots

<details>
<summary>Mini-starter</summary>
<p align="center">
  <img src="/overview/starter.png" alt="mini-starter" />
</p>
</details>

<details>
<summary>Snacks projects util</summary>
<p align="center">
  <img src="/overview/snacks-projects.png" alt="snacks-projects-util" />
</p>
</details>

<details>
<summary>Lazygit integration</summary>
<p align="center">
  <img src="/overview/lazygit-integration.png" alt="lazygit-integration" />
</p>
</details>

<details>
<summary>Gitsigns support</summary> 
<p align="center">
  <img src="/overview/gitsigns.png" alt="gitsigns" />
</p>
</details>

<details>
<summary>LSP support</summary>
<p align="center">
  <img src="/overview/lsp-support.png" alt="lsp-support" />
</p>
</details>

<details>
<summary>Fzf and grep finder</summary>
<p align="center">
  <img src="overview/fzf-grep-finder.png" alt="fzf-grep-finder" />
</p>
</details>

<details>
<summary>Obsidian daily note taking</summary>
<p align="center">
  <img src="overview/obsidian-daily-notes.png" alt="obsidian-dailies" />
</p>
</details>

<details>
<summary>Markdown render support</summary>
<p align="center">
  <img src="overview/render-markdown.png" alt="render-markdown" />
</p>
</details>

<details>
<summary>Discord RPC support</summary>
<p align="center">
  <img src="overview/discord-rpc.png" alt="discord" />
</p>
</details>

## License
MIT License - see [LICENSE](LICENSE.md) for details.
