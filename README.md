# Dreamwave Theme 

A cohesive, lo-fi, dreamy blue and violet theme for your terminal and editor.
Designed for Neovim, Alacritty, btop, and Hyprland Walker menus, Dreamwave provides a calm, readable, and visually immersive aesthetic inspired by vaporwave and late-night coding sessions.

![image alt](https://github.com/RiO7MAKK3R/omarchy-dreamwave-theme/blob/main/preview1.png)
![image alt](https://github.com/RiO7MAKK3R/omarchy-dreamwave-theme/blob/main/preview3.png)
![image alt](https://github.com/RiO7MAKK3R/omarchy-dreamwave-theme/blob/main/preview2.png)
---

### Theme Concept

**Lo-fi Tranquility:** Designed for comfort during long coding sessions  
**Dreamy Blues & Violets:** Gentle neon gradients that soothe, not distract  
**Focus in Stillness:** Clear, readable text on a soft dark base  

---

### Features

- **Dreamy Blur & Glow:** Subtle glassy transparency for menus and status bars  
- **Lo-fi Gradients:** Gentle color flow for CPU, memory, and net graphs in `btop`  
- **Readable Syntax:** Balanced contrast for Neovim highlighting  
- **Unified Palette:** Seamless experience across Alacritty, Neovim, Walker, and btop  
- **Soft Transitions:** No harsh edges — designed for relaxation and focus  

---

### Components Included

| Component | Description |
|------------|-------------|
| **Neovim** | Custom Lua colorscheme with blue-violet gradients |
| **Alacritty** | Terminal palette mixing blues, violets, and soft magentas |
| **btop** | Lofi gradients for all meters and panels |
| **Walker (Hyprland)** | Frosted-blue panels with glowing selection pills |

---

### Installation

Install using:
```bash
omarchy-theme-install https://github.com/RiO7MAKK3R/omarchy-dreamwave-theme.git
```
OR 

Copy the dreamwave directory to your Omarchy/Hyprland themes folder

### Suggested Font

JetBrains Mono or Iosevka Nerd Font —
Clean, modern, and slightly rounded — perfect for the Dreamwave aesthetic.

### Wallpaper Suggestions

Look for images featuring:

Soft blue-violet nightscapes

Lo-fi rain or skyline aesthetics

Vaporwave gradients (purple → blue → pink)

Minimal silhouettes with blur or bokeh

### Notes

Optimized for low-light and night-time setups

TrueColor / transparency support recommended (termguicolors enabled)

Complements Hyprland + Waybar + Mako environments

Use alongside blur + rounded corners for full Dreamwave feel

---

### Omarchy 4 port

Omarchy 4 reads a theme's look from `colors.toml`, `hyprland.lua` and
`shell.*.toml` instead of `hyprland.conf`, `waybar.css`, `walker.css` and
`mako.ini` (kept for older versions). This fork adds:

| File | What it does |
|------|--------------|
| `colors.toml` | The Dreamwave palette for every app Omarchy themes |
| `hyprland.lua` | Lavender border, rounding 16, see-through blurred windows, dimmed inactive windows, overshoot animations, blurred bar/menus/notifications |
| `foot.ini` | See-through foot background so Hyprland blurs behind it |
| `shell.*.toml` | Bar, launcher, menu, notification, OSD and lock colours |
| `extras/local.pill-bar/` | Bar plugin that draws an outlined pill behind each bar widget |
| `extras/hooks/20-dreamwave-pill-bar` | Theme hook: pill bar for Dreamwave, stock bar for other themes |

`omarchy theme install` drops Lua and terminal configs from themes cloned from
a repo, so to get the full look, clone the repo and link it in as your own
theme:

```bash
git clone https://github.com/mkerciku/omarchy-dreamwave-theme.git ~/Projects/Themes/omarchy-dreamwave-theme
ln -s ~/Projects/Themes/omarchy-dreamwave-theme ~/.config/omarchy/themes/dreamwave
cp -r ~/Projects/Themes/omarchy-dreamwave-theme/extras/local.pill-bar ~/.config/omarchy/plugins/
omarchy hook install theme-set ~/Projects/Themes/omarchy-dreamwave-theme/extras/hooks/20-dreamwave-pill-bar
omarchy theme set dreamwave
omarchy bar use local.pill-bar
```

A linked theme runs its Lua unrestricted, so review upstream changes before
pulling them into the clone.
