-- Dreamwave window look for Omarchy 4 (Lua Hyprland config).
-- A port of this theme's hyprland.conf, which older Omarchy versions read:
-- lavender border, round corners, see-through blurred windows, dimmed
-- inactive windows and soft overshooting animations.

local active_border_color = "rgba(f5eafdee)"
local inactive_border_color = "rgba(595959aa)"

hl.config({
  general = {
    gaps_in = 0,
    gaps_out = 10,
    border_size = 3,
    col = {
      active_border = active_border_color,
      inactive_border = inactive_border_color,
    },
  },

  group = {
    col = {
      border_active = active_border_color,
      border_inactive = inactive_border_color,
    },
  },

  decoration = {
    rounding = 16,

    dim_inactive = true,
    dim_strength = 0.2,

    active_opacity = 0.85,
    inactive_opacity = 0.75,

    shadow = {
      enabled = true,
      range = 1,
      render_power = 1,
      color = "rgba(d3d3d3cc)",
    },

    blur = {
      enabled = true,
      size = 3,
      passes = 3,
      new_optimizations = true,
      ignore_opacity = true,
    },
  },
})

hl.curve("overshot", { type = "bezier", points = { { 0.05, 0.9 }, { 0.1, 1.05 } } })
hl.curve("smoothOut", { type = "bezier", points = { { 0.5, 0 }, { 0.99, 0.99 } } })
hl.curve("smoothIn", { type = "bezier", points = { { 0.5, -0.5 }, { 0.68, 1.5 } } })

hl.animation({ leaf = "windows", enabled = true, speed = 5, bezier = "overshot", style = "slide" })
hl.animation({ leaf = "windowsOut", enabled = true, speed = 3, bezier = "smoothOut" })
hl.animation({ leaf = "windowsIn", enabled = true, speed = 3, bezier = "smoothOut" })
hl.animation({ leaf = "windowsMove", enabled = true, speed = 4, bezier = "smoothIn", style = "slide" })
hl.animation({ leaf = "border", enabled = true, speed = 5, bezier = "default" })
hl.animation({ leaf = "fade", enabled = true, speed = 5, bezier = "smoothIn" })
hl.animation({ leaf = "fadeDim", enabled = true, speed = 5, bezier = "smoothIn" })
hl.animation({ leaf = "workspaces", enabled = true, speed = 6, bezier = "default" })

-- Frosted bar, launcher/menus, notifications and OSD (the theme's Waybar,
-- Walker, Mako and SwayOSD blur rules, under the Omarchy shell's names).
hl.layer_rule({
  match = { namespace = "^(omarchy-bar|omarchy-menu|omarchy-notifications|omarchy-osd)$" },
  blur = true,
  ignore_alpha = 0.1,
})
