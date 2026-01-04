# Copyright (c) 2010 Aldo Cortesi
# Copyright (c) 2010, 2014 dequis
# Copyright (c) 2012 Randall Ma
# Copyright (c) 2012-2014 Tycho Andersen
# Copyright (c) 2012 Craig Barnes
# Copyright (c) 2013 horsik
# Copyright (c) 2013 Tao Sauvage
#
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:
#
# The above copyright notice and this permission notice shall be included in
# all copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
# SOFTWARE.

# NJS edited with lots of copying and or inspiration from:
# https://codeberg.org/justaguylinux/qtile-setup/src/branch/main/qtile/config.py
# and
# https://gitlab.com/dwt1/dotfiles/-/blob/master/.config/qtile/config.py

from libqtile import bar, layout, qtile, widget
from libqtile.config import Click, Drag, Group, Key, Match, Screen
from libqtile.lazy import lazy

# NJS: gruvbox colorscheme
# from: https://github.com/egujito/qtile/blob/master/gruvbox.py
colors_gb  = ["#282828", # background
          "#b85651", # red
          "#bd6f3e", # orange
          "#c18f41", # yellow
          "#8f9a52", # green
          "#72966c", # aqua
          "#68948a", # blue
          "#ab6c7d"] # purple
bg = 0
red = 1
orange = 2
yellow = 3
green = 4
aqua = 5
blue = 6
purple = 7


mod = "mod4"
terminal = "alacritty"
browser = "firefox"

keys = [
    # A list of available commands that can be bound to keys can be found
    # at https://docs.qtile.org/en/latest/manual/config/lazy.html
    # Switch between windows
    Key([mod], "h", lazy.layout.left(), desc="Move focus to left"),
    Key([mod], "l", lazy.layout.right(), desc="Move focus to right"),
    Key([mod], "j", lazy.layout.down(), desc="Move focus down"),
    Key([mod], "k", lazy.layout.up(), desc="Move focus up"),
    Key([mod], "space", lazy.layout.next(), desc="Move window focus to other window"),
    # Move windows between left/right columns or move up/down in current stack.
    # Moving out of range in Columns layout will create new column.
    Key([mod, "shift"], "h", lazy.layout.shuffle_left(), desc="Move window to the left"),
    Key([mod, "shift"], "l", lazy.layout.shuffle_right(), desc="Move window to the right"),
    Key([mod, "shift"], "j", lazy.layout.shuffle_down(), desc="Move window down"),
    Key([mod, "shift"], "k", lazy.layout.shuffle_up(), desc="Move window up"),
    # Grow windows. If current window is on the edge of screen and direction
    # will be to screen edge - window would shrink.
    Key([mod, "control"], "h", lazy.layout.grow_left(), desc="Grow window to the left"),
    Key([mod, "control"], "l", lazy.layout.grow_right(), desc="Grow window to the right"),
    Key([mod, "control"], "j", lazy.layout.grow_down(), desc="Grow window down"),
    Key([mod, "control"], "k", lazy.layout.grow_up(), desc="Grow window up"),
    Key([mod], "n", lazy.layout.normalize(), desc="Reset all window sizes"),
    # Toggle between split and unsplit sides of stack.
    # Split = all windows displayed
    # Unsplit = 1 window displayed, like Max layout, but still with
    # multiple stack panes
    Key(
        [mod, "shift"],
        "Return",
        lazy.layout.toggle_split(),
        desc="Toggle between split and unsplit sides of stack",
    ),
    Key([mod], "Return", lazy.spawn(terminal), desc="Launch terminal"),

    # NJS: start rofi (from JustAGuyLinux with theme selection and show icons removed)
    Key([mod], "space", lazy.spawn("rofi -show drun -modi drun -line-padding 4 -hide-scrollbar"), desc="Launch Rofi"),
    # NJS: other launchers (from JustAGuyLinux for GIMP and added Inkscape, Nemo etc.)
    Key([mod], "g", lazy.spawn("gimp"), desc="Launch GIMP"),
    Key([mod], "i", lazy.spawn("inkscape"), desc="Launch Inkscape"),
    Key([mod], "n", lazy.spawn("nemo"), desc="Launch Nemo"),
    Key([mod], "c", lazy.spawn("galculator"), desc="Launch Galculator"),
    # NJS: shortcut for browser
    Key([mod], "b", lazy.spawn(browser), desc="Launch web browser"),
    # NJS: power off / reboot etc script from JustAGuyLinux - stored in misc_scripts github
    Key([mod], "x", lazy.spawn("/home/njs/Documents/github/misc_scripts/power"), desc="Power menu"),

    # Toggle between different layouts as defined below
    Key([mod], "Tab", lazy.next_layout(), desc="Toggle between layouts"),
    Key([mod], "w", lazy.window.kill(), desc="Kill focused window"),
    Key(
        [mod],
        "f",
        lazy.window.toggle_fullscreen(),
        desc="Toggle fullscreen on the focused window",
    ),
    Key([mod], "t", lazy.window.toggle_floating(), desc="Toggle floating on the focused window"),
    Key([mod, "control"], "r", lazy.reload_config(), desc="Reload the config"),
    Key([mod, "control"], "q", lazy.shutdown(), desc="Shutdown Qtile"),
    Key([mod], "r", lazy.spawncmd(), desc="Spawn a command using a prompt widget"),
    # NJS: add backlight controls (JustAGuyLinux)
    Key([], "XF86MonBrightnessUp", lazy.spawn("xbacklight +10"), desc="Brightness up"),
    Key([], "XF86MonBrightnessDown", lazy.spawn("xbacklight -10"), desc="Brightness down"),

    # NJS: add control of monitors from DT
    # Switch focus of monitors
    Key([mod], "period", lazy.next_screen(), desc='Move focus to next monitor'),
    Key([mod], "comma", lazy.prev_screen(), desc='Move focus to prev monitor'),
]

# Add key bindings to switch VTs in Wayland.
# We can't check qtile.core.name in default config as it is loaded before qtile is started
# We therefore defer the check until the key binding is run by using .when(func=...)
for vt in range(1, 8):
    keys.append(
        Key(
            ["control", "mod1"],
            f"f{vt}",
            lazy.core.change_vt(vt).when(func=lambda: qtile.core.name == "wayland"),
            desc=f"Switch to VT{vt}",
        ),
    )


groups = [Group(i) for i in "123456"] # NJS unlikely to use more than 6 groups!

for i in groups:
    keys.extend(
        [
            # mod + group number = switch to group
            Key(
                [mod],
                i.name,
                lazy.group[i.name].toscreen(),
                desc=f"Switch to group {i.name}",
            ),
            # mod + shift + group number = switch to & move focused window to group
            #Key(
            #    [mod, "shift"],
            #    i.name,
            #    lazy.window.togroup(i.name, switch_group=True),
            #    desc=f"Switch to & move focused window to group {i.name}",
            #),
            # Or, use below if you prefer not to switch to that group.
            # # mod + shift + group number = move focused window to group
            # NJS prefer this
            Key(
                [mod, "shift"],
                i.name,
                lazy.window.togroup(i.name),
                desc=f"move focused window to group {i.name}",
            ),
        ],
    )

# NJS: layout_theme from DT (https://gitlab.com/dwt1/dotfiles/-/blob/master/.config/qtile/config.py), edited for gruvbox theme in .config

layout_theme = {"border_width": 2,
                "margin": 10,
                "border_focus": colors_gb[purple],
                "border_normal": colors_gb[bg],
                }

layouts = [
    layout.MonadTall(**layout_theme),
    layout.MonadWide(**layout_theme),
    layout.Max(**layout_theme),
    # Try more layouts by unleashing below layouts.
    # layout.Tile(**layout_theme),
    # layout.Columns(border_focus_stack=["#d75f5f", "#8f3d3d"], border_width=4),
    # layout.Stack(num_stacks=2),
    # layout.Bsp(),
    # layout.Matrix(),
    # layout.RatioTile(),
    # layout.Tile(),
    # layout.TreeTab(),
    # layout.VerticalTile(),
    # layout.Zoomy(),
]

# NJS: edit colors and font as per DT
widget_defaults = dict(
    font="Ubuntu Bold",
    fontsize=12,
    padding=3,
    background=colors_gb[bg],
)
extension_defaults = widget_defaults.copy()

# NJS: replace original screen calls with DTs init_widgets_list and calling for each screen
#screens = [
#    Screen(
#        bottom=bar.Bar(
def init_widgets_list():
# NJS: styling inspired by DT but with gruvbox colors
    widgets_list = [
        widget.CurrentLayout(
            foreground = colors_gb[yellow],
            padding = 5,
            ),
        widget.GroupBox(
            fontsize = 11,
            margin_y = 5,
            margin_x = 14,
            padding_y = 0,
            padding_x = 2,
            borderwidth = 3,
            #active = colors[8],
            #inactive = colors[9],
            rounded = False,
            highlight_color = colors_gb[purple],
            highlight_method = "line",
            this_current_screen_border = colors_gb[bg],
            #this_screen_border = colors [4],
            #other_current_screen_border = colors[7],
            #other_screen_border = colors[4]
            ),
        widget.Prompt(
            font = "Ubuntu Mono",
            fontsize=14,
            foreground = colors_gb[yellow],
            ),
        widget.WindowName(
            foreground = colors_gb[aqua],
            padding = 8,
            max_chars = 40,
            ),
        widget.Chord(
            chords_colors={
                "launch": ("#ff0000", "#ffffff"),
            },
            name_transform=lambda name: name.upper(),
        ),#

        # NJS: widgets taken from DT's config with colors changed
        widget.CPU(
                 foreground = colors_gb[orange],
                 padding = 8,
                 format = 'Cpu: {load_percent}%',
                 ),
        widget.Memory(
                 foreground = colors_gb[yellow],
                 padding = 8,
                 format = '{MemUsed: .0f}{mm}',
                 fmt = 'Mem: {}',
                 ),
        # NJS: volume from JustaGuy Linux config
        widget.Volume(
            fmt="{}",
            mute_command="pamixer -t",
            volume_up_command="pamixer -i 2",
            volume_down_command="pamixer -d 2",
            get_volume_command="pamixer --get-volume-human",
            check_mute_command="pamixer --get-mute",
            check_mute_string="true",
            foreground = colors_gb[green],
            padding=2,
        ),
        # NJS: add battery icom
        widget.BatteryIcon(
                padding = 4,
                ),
        # NB Systray is incompatible with Wayland, consider using StatusNotifier instead
        # widget.StatusNotifier(),
        # NJS: add bluetooth
        widget.Bluetooth(
                foreground = colors_gb[blue],
                padding = 8,
                ),
        widget.Clock(
                foreground = colors_gb[purple],
                padding = 8,
                format="%Y-%m-%d %a %I:%M %p",
                ),
        widget.Systray(padding=6),
        # widget.QuickExit(),
        ]
    return widgets_list

# NJS: start copy from DT config for multi-screens
def init_widgets_screen1():
    widgets_screen1 = init_widgets_list()
    return widgets_screen1

# NJS: second monitor
def init_widgets_list_screen2():
# NJS: styling inspired by DT but with gruvbox colors
    widgets_list = [
        widget.CurrentLayout(
            foreground = colors_gb[yellow],
            fontsize = 8,
            padding = 5,
            ),
        widget.GroupBox(
            fontsize = 8,
            margin_y = 3,
            margin_x = 8,
            padding_y = 0,
            padding_x = 1,
            borderwidth = 2,
            #active = colors[8],
            #inactive = colors[9],
            rounded = False,
            highlight_color = colors_gb[purple],
            highlight_method = "line",
            this_current_screen_border = colors_gb[bg],
            #this_screen_border = colors [4],
            #other_current_screen_border = colors[7],
            #other_screen_border = colors[4]
            ),
        widget.Prompt(
            font = "Ubuntu Mono",
            fontsize=10,
            foreground = colors_gb[yellow],
            ),
        widget.WindowName(
            foreground = colors_gb[aqua],
            fontsize = 8,
            padding = 4,
            max_chars = 40,
            ),
        widget.Chord(
            chords_colors={
                "launch": ("#ff0000", "#ffffff"),
            },
            name_transform=lambda name: name.upper(),
        ),
        ]
    return widgets_list

def init_widgets_screen2():
    widgets_screen2 = init_widgets_list_screen2()
    return widgets_screen2

# For adding transparency to your bar, add (background="#00000000") to the "Screen" line(s)
# For ex: Screen(top=bar.Bar(widgets=init_widgets_screen2(), background="#00000000", size=24)),

def init_screens():
    return [Screen(bottom=bar.Bar(widgets=init_widgets_screen1(), margin=[8, 12, 0, 12], size=30)),
            Screen(bottom=bar.Bar(widgets=init_widgets_screen2(), margin=[4, 6, 0, 6], size=15))]

if __name__ in ["config", "__main__"]:
    screens = init_screens()
    widgets_list = init_widgets_list()
    widgets_screen1 = init_widgets_screen1()
    widgets_screen2 = init_widgets_screen2()

# NJS: end copy from DT config

# Drag floating layouts.
mouse = [
    Drag([mod], "Button1", lazy.window.set_position_floating(), start=lazy.window.get_position()),
    Drag([mod], "Button3", lazy.window.set_size_floating(), start=lazy.window.get_size()),
    Click([mod], "Button2", lazy.window.bring_to_front()),
]

dgroups_key_binder = None
dgroups_app_rules = []  # type: list
follow_mouse_focus = True
bring_front_click = False
floats_kept_above = True
cursor_warp = False
floating_layout = layout.Floating(
    # NJS: add styling
    border_focus=colors_gb[yellow],
    border_normal=colors_gb[bg],
    border_width=2,
    float_rules=[
        # Run the utility of `xprop` to see the wm class and name of an X client.
        *layout.Floating.default_float_rules,
        Match(wm_class="confirmreset"),  # gitk
        Match(wm_class="makebranch"),  # gitk
        Match(wm_class="maketag"),  # gitk
        Match(wm_class="Galculator"),  # NJS: add calculator
        Match(wm_class="qimgv"),  # NJS: add q image viewer
        Match(wm_class="ssh-askpass"),  # ssh-askpass
        Match(title="branchdialog"),  # gitk
        Match(title="pinentry"),  # GPG key password entry
    ],
)
auto_fullscreen = True
focus_on_window_activation = "smart"
reconfigure_screens = True

# If things like steam games want to auto-minimize themselves when losing
# focus, should we respect this or not?
auto_minimize = True

# When using the Wayland backend, this can be used to configure input devices.
wl_input_rules = None

# xcursor theme (string or None) and size (integer) for Wayland backend
wl_xcursor_theme = None
wl_xcursor_size = 24

# XXX: Gasp! We're lying here. In fact, nobody really uses or cares about this
# string besides java UI toolkits; you can see several discussions on the
# mailing lists, GitHub issues, and other WM documentation that suggest setting
# this string if your java app doesn't work correctly. We may as well just lie
# and say that we're a working one by default.
#
# We choose LG3D to maximize irony: it is a 3D non-reparenting WM written in
# java that happens to be on java's whitelist.
wmname = "LG3D"



# NJS: TO DO!
# For brightness control - replace with xrandr command?
# Add screenshot functionality with flameshot
# autostart.sh file?? 
