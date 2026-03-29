# nvim config ✍️ 

My editor, my rules.  
Lua-based config built for TypeScript, Vue, Go, Python, and whatever else needs taming.

---

![Starter screenshot](screenshots/starter.png)

---

## what's inside

| | |
|---|---|
| Plugin manager | vim.pack |
| Completion | blink-cmp |
| LSP | mason.nvim + nvim-lspconfig |
| Fuzzy finder | snacks.picker |
| Syntax | treesitter |
| Git | lazygit + gitsigns |
| Notes | obsidian.nvim |
| Theme | Rosé Pine Dawn |


---

## setup
```bash
mv ~/.config/nvim ~/.config/nvim.bak
git clone https://github.com/kovs713/nvim-config.git ~/.config/nvim
nvim
```

plugins auto-install via vim.pack on first launch.

### requirements
```
neovim 0.12.0+, git, node.js
```

optional: `ripgrep` (faster search), `fd` (better file finding), `imagemagick` (image previews)

---

## what it does

**navigation** — fuzzy files, quick switching, fast jumps, file browser, undo tree

**intelligence** — LSP with auto-installed servers, completion, diagnostics, treesitter highlighting

**editing** — auto-pairs, auto-tags, smart comments, inline git diffs, refactoring, markdown lists

**formatting** — auto-format on save: prettier, stylua, gofumpt, ruff. linting: eslint, golangci-lint

**ui** — clean dashboard, minimal statusline, notifications, transparent bg, pretty markdown

**extras** — obsidian notes, WakaTime, Discord RPC, image previews

---

## languages

TypeScript · JavaScript · Vue · React · Go · Python · Lua · HTML · CSS · Tailwind · GraphQL · Markdown

all get LSP, treesitter, and auto-formatting out of the box.

---

## screenshots

<details>
<summary>lsp support</summary>
<p align="center"><img src="/screenshots/lsp-support.png"/></p>
</details>

<details>
<summary>snacks projects</summary>
<p align="center"><img src="/screenshots/snacks-projects.png"/></p>
</details>

<details>
<summary>lazygit integration</summary>
<p align="center"><img src="/screenshots/lazygit-integration.png"/></p>
</details>

<details>
<summary>markdown render</summary>
<p align="center"><img src="/screenshots/render-markdown.png"/></p>
</details>

<details>
<summary>discord rpc</summary>
<p align="center"><img src="/screenshots/discord-rpc.png"/></p>
</details>

---

<div align="center">
  <a href="https://github.com/neovim/neovim/releases/tag/stable">
    <img src="https://img.shields.io/badge/Neovim-0.12.0-blueviolet.svg?style=flat-square&logo=Neovim&logoColor=green"/>
  </a>
  <img alt="Linux" src="https://img.shields.io/badge/Linux-%23.svg?style=flat-square&logo=linux&color=FCC624&logoColor=black">
  <img src="https://img.shields.io/github/commit-activity/m/kovs713/nvim-config?style=flat-square">
  <img src="https://img.shields.io/github/license/kovs713/nvim-config?style=flat-square&logo=GNU&label=License">
</div>
