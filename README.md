# Personal Neovim Setup

My personal Lua-based Neovim configuration. Focused on productivity, modern UI, and developer tools  (likely for typescript development).

## Installation

1. Backup your current Neovim config: `mv ~/.config/nvim ~/.config/nvim.bak`
2. Clone this repo: `git clone https://github.com/kamusari713/nvim-config.git ~/.config/nvim`
3. Launch Neovim: `nvim` (plugins will auto-install via lazy.nvim)

## Overview

This config uses [lazy.nvim](https://github.com/folke/lazy.nvim) for plugin management, with plugins organized into enabled/disabled folders and categorized for easy maintenance. It includes LSP support, Obsidian notes tooling, Treesitter syntax, Git integration, and more.

### Screenshots

<details>
<summary>Mini-starter</summary>

![mini-starter](/overview/starter.png)
</details>

<details>
<summary>Snacks projects util</summary>

![snacks-projects-util](/overview/snacks-projects.png)
</details>

<details>
<summary>Lazygit integration</summary>

![lazygit-integration](/overview/lazygit-integration.png)
</details>

<details>
<summary>Gitsigns support</summary> 

![gitsigns](/overview/gitsigns.png)
</details>

<details>
<summary>LSP support</summary>

![lsp-support](/overview/lsp-support.png)
</details>

<details>
<summary>Fzf and grep finder</summary>

![fzf-grep-finder](overview/fzf-grep-finder.png)
</details>

<details>
<summary>Obsidian daily note taking</summary>

![obsidian-dailies](overview/obsidian-daily-notes.png)
</details>

<details>
<summary>Markdown render support</summary>

![render-markdown](overview/render-markdown.png)
</details>

<details>
<summary>Discord RPC support</summary>

![discord](overview/discord-rpc.png)
</details>

## Keymaps

<details>
<summary

### Common Keymaps
</summary>

| Mode | Key | Action | Description |
|------|-----|--------|-------------|
| Ⓝ | <kbd>Space</kbd><kbd>s</kbd> | \<cmd>wall\<CR> | Save all buffers |
| Ⓝ | <kbd>Ctrl</kbd> + <kbd>a</kbd> | ggVG | Select all |
| Ⓝ | <kbd>Ctrl</kbd> + <kbd>d</kbd> | \<C-d>zz | - |
| Ⓝ | <kbd>Ctrl</kbd> + <kbd>u</kbd> | \<C-u>zz | - |
| Ⓥ | <kbd>J</kbd> | :m '>+1\<CR>gv=gv | Move line down in Visual mode |
| Ⓥ | <kbd>K</kbd> | :m '\<-2\<CR>gv=gv | Move line up in Visual mode |
| Ⓝ | <kbd>n</kbd> | nzz | - |
| Ⓝ | <kbd>N</kbd> | Nzz | - |
| Ⓝ | <kbd>*</kbd> | *zz | - |
| Ⓝ | <kbd>#</kbd> | #zz | - |
| Ⓝ | <kbd>g</kbd><kbd>*</kbd> | g*zz | - |
| Ⓝ | <kbd>g</kbd><kbd>#</kbd> | g#zz | - |
| Ⓥ | <kbd><</kbd> | <g | - |
| Ⓥ | <kbd>></kbd> | >g | - |
| Ⓥ | <kbd>p</kbd> | "_dP | Paste without saving |
| Ⓝ,Ⓞ | <kbd>H</kbd> | ^ | Go to start of line |
| Ⓝ,Ⓞ | <kbd>L</kbd> | g_ | Go to end of line |
| Ⓝ | <kbd>Ctrl</kbd> + <kbd>i</kbd> | \<C-o> | Replace goto next |
| Ⓝ | <kbd>Ctrl</kbd> + <kbd>o</kbd> | \<C-i> | Replace goto prev |
| Ⓝ | <kbd>Esc</kbd> | \<cmd>noh\<CR> | Clear search |
</details>
<details>
<summary

### TypeScript Tools
</summary>

| Mode | Key | Action | Description |
|------|-----|--------|-------------|
| Ⓝ | <kbd>Space</kbd><kbd>r</kbd><kbd>f</kbd> | \<cmd>TSToolsRenameFile\<CR> | TS [R]ename [F]ile + Fix Imports |
| Ⓝ | <kbd>Space</kbd><kbd>i</kbd> | \<cmd>TSToolsOrganizeImports\<CR> | TS Tools Organize [I]mports |
</details>
<details>
<summary

### Refactoring.nvim
</summary>

| Mode | Key | Action | Description |
|------|-----|--------|-------------|
| Ⓝ | <kbd>Space</kbd><kbd>r</kbd><kbd>r</kbd> | require('refactoring').select_refactor { prefer_ex_cmd = true } | Refactor… |
| Ⓝ | <kbd>Space</kbd><kbd>r</kbd><kbd>e</kbd> | require('refactoring').refactor 'Extract Function' | Extract Function |
| Ⓝ | <kbd>Space</kbd><kbd>r</kbd><kbd>v</kbd> | require('refactoring').refactor 'Extract Variable' | Extract Variable |
| Ⓝ | <kbd>Space</kbd><kbd>r</kbd><kbd>I</kbd> | require('refactoring').refactor 'Inline Function' | Inline Function |
| Ⓝ | <kbd>Space</kbd><kbd>r</kbd><kbd>i</kbd> | require('refactoring').refactor 'Inline Variable' | Inline Variable |
</details>
<details>
<summary

### Gitsigns.nvim
</summary>

| Mode | Key | Action | Description |
|------|-----|--------|-------------|
| Ⓝ | <kbd>]</kbd><kbd>h</kbd> | gitsigns.nav_hunk 'next' (or vim.cmd.normal in diff) | Jump to next git [c]hange |
| Ⓝ | <kbd>[</kbd><kbd>h</kbd> | gitsigns.nav_hunk 'prev' (or vim.cmd.normal in diff) | Jump to previous git [c]hange |
| Ⓥ | <kbd>Space</kbd><kbd>g</kbd><kbd>s</kbd> | gitsigns.stage_hunk { vim.fn.line '.', vim.fn.line 'v' } | [g]it [s]tage hunk |
| Ⓥ | <kbd>Space</kbd><kbd>g</kbd><kbd>r</kbd> | gitsigns.reset_hunk { vim.fn.line '.', vim.fn.line 'v' } | [g]it [r]eset hunk |
| Ⓝ | <kbd>Space</kbd><kbd>g</kbd><kbd>s</kbd> | gitsigns.stage_hunk | [g]it [s]tage hunk |
| Ⓝ | <kbd>Space</kbd><kbd>g</kbd><kbd>r</kbd> | gitsigns.reset_hunk | [g]it [r]eset hunk |
| Ⓝ | <kbd>Space</kbd><kbd>g</kbd><kbd>S</kbd> | gitsigns.stage_buffer | [g]it [S]tage buffer |
| Ⓝ | <kbd>Space</kbd><kbd>g</kbd><kbd>u</kbd> | gitsigns.stage_hunk | [g]it [u]ndo stage hunk |
| Ⓝ | <kbd>Space</kbd><kbd>g</kbd><kbd>R</kbd> | gitsigns.reset_buffer | [g]it [R]eset buffer |
| Ⓝ | <kbd>Space</kbd><kbd>g</kbd><kbd>p</kbd> | gitsigns.preview_hunk | [g]it [p]review hunk |
| Ⓝ | <kbd>Space</kbd><kbd>g</kbd><kbd>b</kbd> | gitsigns.blame_line | [g]it [b]lame line |
| Ⓝ | <kbd>Space</kbd><kbd>g</kbd><kbd>d</kbd> | gitsigns.diffthis | [g]it [d]iff against index |
| Ⓝ | <kbd>Space</kbd><kbd>g</kbd><kbd>D</kbd> | gitsigns.diffthis '@' | [g]it [D]iff against last commit |
| Ⓝ | <kbd>Space</kbd><kbd>t</kbd><kbd>b</kbd> | gitsigns.toggle_current_line_blame | [T]oggle git show [b]lame line |
| Ⓝ | <kbd>Space</kbd><kbd>t</kbd><kbd>D</kbd> | gitsigns.preview_hunk_inline | [T]oggle git show [D]eleted |
</details>
<details>
<summary

### Todo-Comments.nvim
</summary>

| Mode | Key | Action | Description |
|------|-----|--------|-------------|
| Ⓝ | <kbd>Space</kbd><kbd>f</kbd><kbd>t</kbd> | \<cmd>TodoFzfLua\<CR> | [F]zfLua [T]odo Comments |
</details>
<details>
<summary

### Which-Key.nvim
</summary>

| Mode | Key | Action | Description |
|------|-----|--------|-------------|
| - | <kbd>Space</kbd><kbd>?</kbd> | require('which-key').show { global = false } | Buffer Local Keymaps (which-key) |
</details>
<details>
<summary

### Obsidian.nvim
</summary>

| Mode | Key | Action | Description |
|------|-----|--------|-------------|
| Ⓝ | <kbd>Space</kbd><kbd>o</kbd><kbd>d</kbd> | \<cmd>Obsidian dailies\<cr> | [O]bsidian [D]ailies |
| Ⓝ | <kbd>Space</kbd><kbd>o</kbd><kbd>n</kbd><kbd>t</kbd> | \<cmd>Obsidian today\<cr> | [O]bsidian [N]ew [T]oday |
| Ⓝ | <kbd>Space</kbd><kbd>o</kbd><kbd>n</kbd><kbd>y</kbd> | \<cmd>Obsidian yesterday\<cr> | [O]bsidian [N]ew [Y]esterday |
| Ⓝ | <kbd>Space</kbd><kbd>o</kbd><kbd>n</kbd><kbd>n</kbd> | \<cmd>Obsidian new\<cr> | [O]bsidian [N]ew [N]ote |
| Ⓝ | <kbd>Space</kbd><kbd>o</kbd><kbd>s</kbd> | \<cmd>Obsidian search\<cr> | [O]bsidian [S]earch |
| Ⓝ | <kbd>g</kbt><kbd>f</kbd> | obsidian.util.gf_passthrough() | [G]oto markdown [F]ile |
| Ⓝ | <kbd>Enter</kbd> | obsidian.util.smart_action() | Obsidian smart action |
| Ⓝ | <kbd>Tab</kbd> | require('obsidian.api').nav_link 'next' | Go to next link |
| Ⓝ | <kbd>Shift</kbd> + <kbd>Tab</kbd> | require('obsidian.api').nav_link 'prev' | Go to previous link |
</details>
<details>
<summary

### Lspsaga.nvim
</summary>

| Mode | Key | Action | Description |
|------|-----|--------|-------------|
| Ⓝ | <kbd>Space</kbd><kbd>l</kbd><kbd>h</kbd> | \<cmd>Lspsaga hover_doc\<CR> | [L]sp [H]over Doc |
| Ⓝ | <kbd>Space</kbd><kbd>l</kbd><kbd>R</kbd> | \<cmd>Lspsaga rename\<CR> | [L]sp [R]ename |
| Ⓝ | <kbd>Space</kbd><kbd>l</kbd><kbd>d</kbd> | \<cmd>Lspsaga peek_definition\<CR> | [L]sp Peek [D]efinition |
| Ⓝ | <kbd>Space</kbd><kbd>[</kbd><kbd>d</kbd> | \<cmd>Lspsaga diagnostic_jump_prev\<CR> | [D]iagnostic next |
| Ⓝ | <kbd>Space</kbd><kbd>]</kbd><kbd>d</kbd> | \<cmd>Lspsaga diagnostic_jump_next\<CR> | [D]iagnostic prev |
| Ⓝ | <kbd>g</kbd><kbd>d</kbd> | \<cmd>Lspsaga goto_definition\<CR> | [G]oto [D]efinition |
| Ⓝ | <kbd>Space</kbd><kbd>l</kbd><kbd>r</kbd> | require('fzf-lua').lsp_references() | [L]sp Peek [R]eferences |
| Ⓝ | <kbd>Space</kbd><kbd>l</kbd><kbd>e</kbd> | lua vim.diagnostic.open_float() | [L]sp Diagnostic Float [E] |
</details>
<details>
<summary

### Winshift.nvim and Windows
</summary>

| Mode | Key | Action | Description |
|------|-----|--------|-------------|
| Ⓝ | <kbd>Ctrl</kbd> + <kbd>W</kbd><kbd>m</kbd> | \<Cmd>WinShift\<CR> | Toggle WinShift mode |
| Ⓝ | <kbd>Ctrl</kbd> + <kbd>Alt</kbd> + <kbd>h</kbd> | \<cmd>WinShift left\<CR> | Move window left [h] |
| Ⓝ | <kbd>Ctrl</kbd> + <kbd>Alt</kbd> + <kbd>j</kbd> | \<cmd>WinShift down\<CR> | Move window down [j] |
| Ⓝ | <kbd>Ctrl</kbd> + <kbd>Alt</kbd> + <kbd>k</kbd> | \<cmd>WinShift up\<CR> | Move window up [k] |
| Ⓝ | <kbd>Ctrl</kbd> + <kbd>Alt</kbd> + <kbd>l</kbd> | \<cmd>WinShift right\<CR> | Move window right [l] |
| Ⓝ | <kbd>Alt</kbd> + <kbd>h</kbd> | \<C-w>h | Moving to the window left [h] |
| Ⓝ | <kbd>Alt</kbd> + <kbd>j</kbd> | \<C-w>j | Moving to the window down [j] |
| Ⓝ | <kbd>Alt</kbd> + <kbd>k</kbd> | \<C-w>k | Moving to the window up [k] |
| Ⓝ | <kbd>Alt</kbd> + <kbd>l</kbd> | \<C-w>l | Moving to the window right [l] |
| Ⓝ | <kbd>Alt</kbd> + <kbd>=</kbd> | \<C-w>+ | Resize window + (increase horizontal) |
| Ⓝ | <kbd>Alt</kbd> + <kbd>-</kbd> | \<C-w>- | Resize window - (decrease horizontal) |
| Ⓝ | <kbd>Alt</kbd> + <kbd>.</kbd> | \<C-w>\< | Resize window \< (increase vertical) |
| Ⓝ | <kbd>Alt</kbd> + <kbd>,</kbd> | \<C-w>> | Resize window > (decrease vertical) |
</details>
<details>
<summary

### Harpoon.nvim
</summary>

| Mode | Key | Action | Description |
|------|-----|--------|-------------|
| Ⓝ | <kbd>Space</kbd><kbd>a</kbd> | harpoon:list():add() | Harpoon [A]dd file |
| Ⓝ | <kbd>Space</kbd><kbd>E</kbd> | harpoon.ui:toggle_quick_menu(harpoon:list()) | Harpoon m[E]nu |
| Ⓝ | <kbd>Ctrl</kbd> + <kbd>h</kbd> | harpoon:list():select(1) | Harpoon select 1 |
| Ⓝ | <kbd>Ctrl</kbd> + <kbd>j</kbd> | harpoon:list():select(2) | Harpoon select 2 |
| Ⓝ | <kbd>Ctrl</kbd> + <kbd>k</kbd> | harpoon:list():select(3) | Harpoon select 3 |
| Ⓝ | <kbd>Ctrl</kbd> + <kbd>l</kbd> | harpoon:list():select(4) | Harpoon select 4 |
| Ⓝ | <kbd>Alt</kbd> + <kbd>i</kbd> | harpoon:list():prev() | Harpoon goto prev |
| Ⓝ | <kbd>Alt</kbd> + <kbd>o</kbd> | harpoon:list():next() | Harpoon goto next |
</details>
<details>
<summary

### Neo-Tree.nvim
</summary>

| Mode | Key | Action | Description |
|------|-----|--------|-------------|
| Ⓝ | <kbd>Space</kbd><kbd>e</kbd><kbd>f</kbd> | <cmd>Neotree toggle float<CR> | Open Neo-Tree [E]xplorer [F]loating |
| Ⓝ | <kbd>Space</kbd><kbd>e</kbd><kbd>r</kbd> | <cmd>Neotree toggle position=right<CR> | Open Neo-Tree [E]xplorer on the [R]ight |
</details>
<details>
<summary

### LSPConfig
</summary>

| Mode | Key | Action | Description |
|------|-----|--------|-------------|
| Ⓝ,Ⓥ | <kbd>Space</kbd><kbd>c</kbd><kbd>a</kbd> | require('fzf-lua').lsp_code_actions() | [C]ode [A]ctions |
| Ⓝ,Ⓥ | <kbd>Space</kbd><kbd>l</kbd><kbd>l</kbd> | \<cmd>LspRestart\<CR> | [L][L]sp Restart |
| Ⓝ | <kbd>Space</kbd><kbd>l</kbd><kbd>i</kbd> | require('fzf-lua').lsp_implementations() | [L]sp [I]mplimentations |
</details>
<details>
<summary

### Emmet
</summary>

| Mode | Key | Action | Description |
|------|-----|--------|-------------|
| Ⓝ,Ⓥ | <kbd>Space</kbd><kbd>w</kbd><kbd>e</kbd> | require('nvim-emmet').wrap_with_abbreviation | [W]rap [E]lement |
</details>

## Plugins by Category

Plugins are organized into categories under `plugins/enabled/`. Each category contains individual `.lua` files for plugin configs.

| Category     | Plugins |
|--------------|---------|
| Appearance  | colorizer, dressing, incline, mini-starter, mini-statusline, noice, render-markdown, rosepine |
| Cmp  | blink-cmp |
| LSP         | debug, lazydev, lspconfig, lspsaga, mason |
| Formatting  | conform, lint |
| Syntax      | emmet, nvim-treesitter, tailwind-tools, ts-autotag, typescript-tools |
| Editing     | autopairs, bullets, comment, refactoring, sleuth, todo-comments |
| Navigation  | flash, fzf, harpoon, neo-tree, snacks, trouble, which-key, winshift |
| Git         | gitsigns |
| Productivity| cord, img-clip, obsidian, wakatime |
| Mini        | mini-surround, mini-ai, mini-icons, mini-pairs, mini-indentscoope, mini-cursorword |
