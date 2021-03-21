
import os
import re
import socket
import subprocess
from libqtile.config import Drag, Key, Match, Screen, Group, Drag, Click, Rule
from libqtile.command import lazy
from libqtile import qtile, layout, bar, widget, hook
from libqtile.widget import Spacer
import albattery

#mod4 or mod = super key
mod = "mod4"
mod1 = "alt"
mod2 = "control"
home = os.path.expanduser('~')


@lazy.function
def window_to_prev_group(qtile):
    if qtile.currentWindow is not None:
        i = qtile.groups.index(qtile.currentGroup)
        qtile.currentWindow.togroup(qtile.groups[i - 1].name)

@lazy.function
def window_to_next_group(qtile):
    if qtile.currentWindow is not None:
        i = qtile.groups.index(qtile.currentGroup)
        qtile.currentWindow.togroup(qtile.groups[i + 1].name)

myTerm = "alacritty" # My terminal of choice

keys = [



# SUPER + FUNCTION KEYS

    Key([mod], "f", lazy.spawn(home + "/Scripts/display_font.fish")),
    Key([mod], "i", lazy.spawn("librewolf")),
    Key([mod], "p", lazy.spawn(home + "/Scripts/passmenu.sh")),
    Key([mod], "q", lazy.window.kill()),
    Key([mod], "b", lazy.spawn("brave")),
    Key([mod], "t", lazy.spawn("tutanota-desktop")),
    Key([mod], "m", lazy.spawn("jgmenu_run")),
    Key([mod], "s", lazy.spawn("slack")),
    Key([mod], "c", lazy.spawn("signal-desktop")),
    Key(["mod1", "shift"], "Return", lazy.spawn("urxvt -e ranger")),
    Key([mod], "v", lazy.spawn("virt-manager")),
    Key([mod], "Return", lazy.spawn("alacritty")),
    #Key([mod], "KP_Enter", lazy.spawn("alacritty")),
    Key([mod], "w", lazy.spawn(home + "/.config/qtile/scripts/pywal-colors.py")),
    Key([mod], "x", lazy.shutdown()),


# SUPER + SHIFT KEYS

    Key([mod, "shift"], "Return", lazy.spawn("pcmanfm")),
    Key([mod, "shift"], "s", lazy.spawn("superproductivity")),
    Key([mod, "shift"], "p", lazy.spawn("sxiv -t " + home + "/Pictures/")),
    Key([mod, "shift"], "d", lazy.spawn("rofi -show drun")),
    Key(["mod1", "shift"], "p", lazy.spawn("flameshot gui")),
    Key([mod, "shift"], "m", lazy.spawn("pragha")),
    Key([mod, "shift"], "q", lazy.window.kill()),
    Key([mod], "r", lazy.restart()),
    Key([mod, "shift"], "r", lazy.spawn(home + "/Scripts/reboot.sh")),
    Key([mod, "shift"], "x", lazy.spawn(home + "/Scripts/poweroff.sh")),

# CONTROL + ALT KEYS

    Key(["mod1", "control"], "k", lazy.spawn(home + "/Scripts/kill.fish")),
    #Key([mod, "control"], "f", lazy.spawn(home + "/Scripts/display_font.sh")),
    Key(["mod1", "control"], "o", lazy.spawn(home + "/.config/qtile/scripts/picom-toggle.sh")),
    #Key(["mod1", "control"], "t", lazy.spawn('termite')),
    #Key(["mod1", "control"], "u", lazy.spawn('pavucontrol')),
    #Key(["mod1", "control"], "Return", lazy.spawn('termite')),

# ALT + ... KEYS


    #Key(["mod1"], "p", lazy.spawn('pamac-manager')),
    #Key(["mod1"], "f", lazy.spawn('firefox')),
    #Key(["mod1"], "e", lazy.spawn('emacs')),
    #Key(["mod1"], "m", lazy.spawn('pcmanfm')),
    Key(["mod1"], "w", lazy.spawn("garuda-welcome")),


# CONTROL + SHIFT KEYS

    #Key([mod2, "shift"], "Escape", lazy.spawn("lxtask")),

# SCREENSHOTS

    #Key([mod], "p", lazy.spawn('flameshot full -p ' + home + '/Pictures')),
    Key([mod2], "p", lazy.spawn("flameshot full -p " + home + "/Pictures")),
#    Key([mod2, "shift"], "Print", lazy.spawn('gnome-screenshot -i')),

# MULTIMEDIA KEYS

# INCREASE/DECREASE BRIGHTNESS
    Key([], "XF86MonBrightnessUp", lazy.spawn("xbacklight -inc 5")),
    Key([], "XF86MonBrightnessDown", lazy.spawn("xbacklight -dec 5")),

# INCREASE/DECREASE/MUTE VOLUME
    Key([], "XF86AudioMute", lazy.spawn("amixer -q set Master toggle")),
    Key([], "XF86AudioLowerVolume", lazy.spawn("amixer -q set Master 5%-")),
    Key([], "XF86AudioRaiseVolume", lazy.spawn("amixer -q set Master 5%+")),

    Key([mod2, mod], "p", lazy.spawn("playerctl play-pause")),
    Key([mod2, mod], "s", lazy.spawn("playerctl next")),
    Key([mod2, mod], "b", lazy.spawn("playerctl previous")),
    Key([mod2, mod], "q", lazy.spawn("playerctl stop")),

#    Key([], "XF86AudioPlay", lazy.spawn("mpc toggle")),
#    Key([], "XF86AudioNext", lazy.spawn("mpc next")),
#    Key([], "XF86AudioPrev", lazy.spawn("mpc prev")),
#    Key([], "XF86AudioStop", lazy.spawn("mpc stop")),

# QTILE LAYOUT KEYS
    Key([mod], "n", lazy.layout.normalize()),
    Key([mod], "space", lazy.next_layout()),

# CHANGE FOCUS
    Key([mod], "Up", lazy.layout.up()),
    Key([mod], "Down", lazy.layout.down()),
    Key([mod], "Left", lazy.layout.left()),
    Key([mod], "Right", lazy.layout.right()),
    Key([mod], "k", lazy.layout.up()),
    Key([mod], "j", lazy.layout.down()),
    Key([mod], "h", lazy.layout.left()),
    Key([mod], "l", lazy.layout.right()),


# RESIZE UP, DOWN, LEFT, RIGHT
    Key([mod, "control"], "l",
        lazy.layout.grow_right(),
        lazy.layout.grow(),
        lazy.layout.increase_ratio(),
        lazy.layout.delete(),
        ),
    Key([mod, "control"], "Right",
        lazy.layout.grow_right(),
        lazy.layout.grow(),
        lazy.layout.increase_ratio(),
        lazy.layout.delete(),
        ),
    Key([mod, "control"], "h",
        lazy.layout.grow_left(),
        lazy.layout.shrink(),
        lazy.layout.decrease_ratio(),
        lazy.layout.add(),
        ),
    Key([mod, "control"], "Left",
        lazy.layout.grow_left(),
        lazy.layout.shrink(),
        lazy.layout.decrease_ratio(),
        lazy.layout.add(),
        ),
    Key([mod, "control"], "k",
        lazy.layout.grow_up(),
        lazy.layout.grow(),
        lazy.layout.decrease_nmaster(),
        ),
    Key([mod, "control"], "Up",
        lazy.layout.grow_up(),
        lazy.layout.grow(),
        lazy.layout.decrease_nmaster(),
        ),
    Key([mod, "control"], "j",
        lazy.layout.grow_down(),
        lazy.layout.shrink(),
        lazy.layout.increase_nmaster(),
        ),
    Key([mod, "control"], "Down",
        lazy.layout.grow_down(),
        lazy.layout.shrink(),
        lazy.layout.increase_nmaster(),
        ),


# FLIP LAYOUT FOR MONADTALL/MONADWIDE
    Key([mod, "shift"], "f", lazy.layout.flip()),

# FLIP LAYOUT FOR BSP
    Key([mod, "mod1"], "k", lazy.layout.flip_up()),
    Key([mod, "mod1"], "j", lazy.layout.flip_down()),
    Key([mod, "mod1"], "l", lazy.layout.flip_right()),
    Key([mod, "mod1"], "h", lazy.layout.flip_left()),

# MOVE WINDOWS UP OR DOWN BSP LAYOUT
    Key([mod, "shift"], "k", lazy.layout.shuffle_up()),
    Key([mod, "shift"], "j", lazy.layout.shuffle_down()),
    Key([mod, "shift"], "h", lazy.layout.shuffle_left()),
    Key([mod, "shift"], "l", lazy.layout.shuffle_right()),

         ### Treetab controls
    Key([mod, "control"], "k",
        lazy.layout.section_up(),
        desc='Move up a section in treetab'
        ),
    Key([mod, "control"], "j",
        lazy.layout.section_down(),
        desc='Move down a section in treetab'
        ),



# MOVE WINDOWS UP OR DOWN MONADTALL/MONADWIDE LAYOUT
    Key([mod, "shift"], "Up", lazy.layout.shuffle_up()),
    Key([mod, "shift"], "Down", lazy.layout.shuffle_down()),
    Key([mod, "shift"], "Left", lazy.layout.swap_left()),
    Key([mod, "shift"], "Right", lazy.layout.swap_right()),

# TOGGLE FLOATING LAYOUT
    Key([mod, "shift"], "space", lazy.window.toggle_floating()),]

groups = []

# FOR QWERTY KEYBOARDS
group_names = [("1", 'monadtall'), ("2", 'monadtall'), ("3", 'monadtall'), ("4", 'monadtall'), ("5", 'monadtall'), ("6", 'monadtall'), ("7", 'max'), ("8", 'monadtall'), ("9", 'monadtall'),]

# FOR AZERTY KEYBOARDS
#group_names = ["ampersand", "eacute", "quotedbl", "apostrophe", "parenleft", "section", "egrave", "exclam", "ccedilla", "agrave",]

#group_labels = ["1 ", "2 ", "3 ", "4 ", "5 ", "6 ", "7 ", "8 ", "9 ", "0",]
#group_labels = ["", "", "", "", "", "",]
group_labels = ["", "", "", "", "", "", "", "", "",]
#group_labels = ["DEV", "WEB", "TXT", "COM", "SYS", "VID", "MUS",]

#group_layouts = ["monadtall", "monadtall", "monadtall", "monadtall", "monadtall", "monadtall", "monadtall", "monadtall", "treetab", "floating",]
#group_layouts = ["monadtall", "matrix", "monadtall", "bsp", "monadtall", "matrix", "monadtall", "bsp", "monadtall", "monadtall",]

for i in range(len(group_names)):
    groups.append(
        Group(
            name=group_names[i][0],
            layout=group_names[i][1],
            label=group_labels[i],
        ))

for i in groups:
    keys.extend([

#CHANGE WORKSPACES
        Key([mod], i.name, lazy.group[i.name].toscreen()),
        Key([mod], "Tab", lazy.screen.next_group()),
        Key(["mod1"], "Tab", lazy.screen.next_group()),
        Key(["mod1", "shift"], "Tab", lazy.screen.prev_group()),

# MOVE WINDOW TO SELECTED WORKSPACE 1-10 AND STAY ON WORKSPACE
        Key([mod, "shift"], i.name, lazy.window.togroup(i.name)),
# MOVE WINDOW TO SELECTED WORKSPACE 1-10 AND FOLLOW MOVED WINDOW TO WORKSPACE
       # Key([mod, "shift"], i.name, lazy.window.togroup(i.name) , lazy.group[i.name].toscreen()),
    ])


def init_layout_theme():
    return {"margin":10,
            "border_width":2,
            "border_focus": "#ff0000",
            "border_normal": "#ffd700"
            }

layout_theme = init_layout_theme()


layouts = [
    layout.MonadTall(margin=16, border_width=2, border_focus="#ff0000", border_normal="#ffd700"),
    #layout.MonadWide(margin=16, border_width=2, border_focus="#ff0000", border_normal="#ffd700"),
    #layout.Matrix(**layout_theme),
    #layout.Bsp(**layout_theme),
    #layout.Floating(**layout_theme),
    #layout.RatioTile(**layout_theme),
    layout.Max(**layout_theme)
    #layout.Columns(**layout_theme),
    #layout.Stack(**layout_theme),
    #layout.Tile(**layout_theme),
    #layout.TreeTab(
    #    sections=['FIRST', 'SECOND'],
    #    bg_color = '#141414',
    #    active_bg = '#0000ff',
    #    inactive_bg = '#1e90ff',
    #    padding_y =5,
    #    section_top =10,
    #    panel_width = 280),
    #layout.VerticalTile(**layout_theme),
    #layout.Zoomy(**layout_theme)
]

# COLORS FOR THE BAR

def init_colors():
    return [["#2F343F", "#2F343F"], # color 0
            ["#2F343F", "#2F343F"], # color 1
            ["#c0c5ce", "#c0c5ce"], # color 2
            ["#ff4500", "#ff4500"], # color 3
            ["#3384d0", "#3384d0"], # color 4
            ["#ffffff", "#ffffff"], # color 5
            ["#ff0000", "#ff0000"], # color 6
            ["#62FF00", "#62FF00"], # color 7
            ["#6790eb", "#6790eb"], # color 8
#            ["#000000", "#000000"], # color 8
            ["#9400de", "#9400de"]] # color 9


colors = init_colors()


# WIDGETS FOR THE BAR

def init_widgets_defaults():
    return dict(font="Fantasque Sans Mono",
                fontsize = 9,
                padding = 2,
                background=colors[1])

widget_defaults = init_widgets_defaults()

def init_widgets_list():
    prompt = "{0}@{1}: ".format(os.environ["USER"], socket.gethostname())
    widgets_list = [

               #widget.TextBox(
               #        text = "◢",
               #        background = colors[1],
               #        foreground = colors[9],
               #        padding = 0,
               #        fontsize = 45
               #        ),
                 widget.Sep(
                        linewidth = 1,
                        padding = 10,
                        foreground = colors[1],
                        background = colors[1]
                        ),              #
               widget.Image(
                       filename = "~/.config/qtile/icons/garuda-red.png",
                       iconsize = 9,
                       background = colors[1],
                       mouse_callbacks = {'Button1': lambda: qtile.cmd_spawn('jgmenu_run')}
                       ),
                widget.Sep(
                        linewidth = 1,
                        padding = 10,
                        foreground = colors[1],
                        background = colors[1]
                        ),
               widget.GroupBox(font="FontAwesome",
                        fontsize = 16,
                        margin_y = 1,
                        margin_x = 0,
                        padding_y = 6,
                        padding_x = 5,
                        borderwidth = 0,
                        disable_drag = False,
                        active = "#ffff00",
                        inactive = colors[5],
                        rounded = False,
                        highlight_method = "block",
                        this_current_screen_border = colors[8],
                        foreground = colors[5],
                        background = colors[1]
                        ),
                #widget.TextBox(
                #       text = "◤",
                #       background = colors[1],
                #       foreground = colors[9],
                #       padding = 0,
                #       fontsize = 46
                #       ),
               widget.WindowName(font="Fantasque Sans Mono",
                        fontsize = 16,
                        foreground = colors[6],
                        background = colors[1],
                        ),

               widget.TextBox(
                       text = '',
                       background = colors[1],
                       foreground = colors[2],
                       padding = 0,
                       fontsize = 37
                       ),
               widget.CurrentLayoutIcon(
                       custom_icon_paths = [os.path.expanduser("~/.config/qtile/icons")],
                       foreground = colors[0],
                       background = colors[2],
                       padding = 0,
                       scale = 0.7
                       ),
               widget.CurrentLayout(
                      font = "Fantasque Sans Mono",
                      fontsize = 16,
                      foreground = colors[0],
                      background = colors[2]
                        ),
               widget.TextBox(
                       text = '',
                       background = colors[2],
                       foreground = colors[0],
                       padding = 0,
                       fontsize = 37
                       ),

               # widget.NetGraph(
               #          font="Noto Sans",
               #          fontsize=12,
               #          bandwidth="down",
               #          interface="auto",
               #          fill_color = colors[8],
               #          foreground=colors[2],
               #          background=colors[1],
               #          graph_color = colors[8],
               #          border_color = colors[2],
               #          padding = 0,
               #          border_width = 1,
               #          line_width = 1,
               #          ),
               # # do not activate in Virtualbox - will break qtile
               # widget.ThermalSensor(
               #          foreground = colors[5],
               #          foreground_alert = colors[6],
               #          background = colors[1],
               #          metric = True,
               #          padding = 3,
               #          threshold = 80
               #          ),
               # albattery.BatteryIcon(
               #          padding=0,
               #          scale=0.7,
               #          y_poss=2,
               #          theme_path=home + "/.config/qtile/icons/battery_icons_horiz",
               #          update_interval = 5,
               #          foreground = colors[5],
               #          background = colors[9]
               #          ),
                # battery option 2  from Qtile
               # widget.Battery(
               #          font="Noto Sans",
               #          update_interval = 10,
               #          fontsize = 12,
               #          foreground = colors[5],
               #          background = colors[9],
               #          ),
               # widget.TextBox(
               #        text = '',
               #        background = colors[9],
               #        foreground = colors[3],
               #        padding = 0,
               #        fontsize = 37
               #        ),
                widget.CPU(
                        font="Fantasque Sans Mono",
                        #format = '{MemUsed}M/{MemTotal}M',
                        update_interval = 1,
                        fontsize = 16,
                        foreground = colors[5],
                        background = colors[0],
                        mouse_callbacks = {'Button1': lambda qtile: qtile.cmd_spawn(myTerm + ' -e htop')},
                       ),
#                widget.Net(
#                         font="Noto Sans",
#                         fontsize=12,
#                         interface=["wlan0"],
#                         format = '{down} ↓↑ {up}',
#                         foreground=colors[5],
#                         background=colors[3],
#                         padding = 0,
#                         ),
                widget.TextBox(
                       text = '',
                       background = colors[0],
                       foreground = colors[2],
                       padding = 0,
                       fontsize = 37
                       ),

               #widget.CPUGraph(
               #         border_color = colors[2],
               #         fill_color = colors[5],
               #         graph_color = colors[6],
               #         background=colors[9],
               #         border_width = 1,
               #         line_width = 1,
               #         core = "all",
               #         type = "box"
               #         ),

               widget.TextBox(
                        font="FontAwesome",
                        text="  ",
                        foreground=colors[0],
                        background=colors[2],
                        padding = 0,
                        fontsize=16
                        ),
               widget.Memory(
                        font="Fantasque Sans Mono",
                        format = '{MemUsed}M/{MemTotal}M',
                        update_interval = 1,
                        fontsize = 16,
                        foreground = colors[0],
                        background = colors[2],
                        mouse_callbacks = {'Button1': lambda qtile: qtile.cmd_spawn(myTerm + ' -e htop')},
                       ),
               widget.TextBox(
                       text = '',
                       background = colors[2],
                       foreground = colors[0],
                       padding = 0,
                       fontsize = 37
                       ),
               widget.TextBox(
                        font="FontAwesome",
                        text="  ",
                        foreground=colors[5],
                        background=colors[0],
                        padding = 0,
                        fontsize=16
                        ),
               widget.Clock(
                        foreground = colors[5],
                        background = colors[0],
                        fontsize = 16,
                        format="%b %d, %Y"
                        ),
                widget.TextBox(
                       text = '',
                       background = colors[0],
                       foreground = colors[2],
                       padding = 0,
                       fontsize = 37
                       ),
      	       widget.TextBox(
                       font="FontAwesome",
                       text="  ",
                       foreground=colors[0],
                       background=colors[2],
                       padding = 0,
                       fontsize=16
                       ),
                # battery option 2  from Qtile
                widget.Clock(
                        foreground = colors[0],
                        background = colors[2],
                        fontsize = 16,
                        format="%I:%M %p"
                        ),
                widget.TextBox(
                       text = '',
                       background = colors[2],
                       foreground = colors[0],
                       padding = 0,
                       fontsize = 37
                       ),

               widget.Systray(
                       background=colors[0],
                       icon_size=20,
                       padding = 4
                       ),
              widget.TextBox(
                        text = '',
                        background = colors[0],
                        foreground = colors[1],
                        padding = 0,
                        fontsize = 37
                        ),

              ]
    return widgets_list

widgets_list = init_widgets_list()


def init_widgets_screen1():
    widgets_screen1 = init_widgets_list()
    return widgets_screen1

def init_widgets_screen2():
    widgets_screen2 = init_widgets_list()
    return widgets_screen2

widgets_screen1 = init_widgets_screen1()
widgets_screen2 = init_widgets_screen2()


def init_screens():
    return [Screen(top=bar.Bar(widgets=init_widgets_screen1(), size=20, opacity=1.00, background= "000000")),
            Screen(top=bar.Bar(widgets=init_widgets_screen2(), size=20, opacity=1.00, background= "000000"))]
screens = init_screens()


# MOUSE CONFIGURATION
mouse = [
    Drag([mod], "Button1", lazy.window.set_position_floating(),
         start=lazy.window.get_position()),
    Drag([mod], "Button3", lazy.window.set_size_floating(),
         start=lazy.window.get_size())
]

dgroups_key_binder = None
dgroups_app_rules = []

# ASSIGN APPLICATIONS TO A SPECIFIC GROUPNAME
# BEGIN

@hook.subscribe.client_new
def assign_app_group(client):
    d = {}
    #########################################################
    ################ assgin apps to groups ##################
    #########################################################
    d["1"] = [ "Alacritty" ]
    d["2"] = [ "Navigator", "brave-browser" ]
    d["3"] = [ "slack", "signal" ]
    d["4"] = [ "tutanota-desktop" ]
    d["5"] = [ "pcmanfm", "urxvt" ]
    d["6"] = [ "sxiv" ]
    d["7"] = [ "virt-manager" ]
    d["8"] = [ "superproductivity" ]
    d["9"] = [ "pragha" ]
    ##########################################################
    wm_class = client.window.get_wm_class()[0]


    for i in range(len(d)):
        if wm_class in list(d.values())[i]:
            group = list(d.keys())[i]
            client.togroup(group)
            client.group.cmd_toscreen()

# END
# ASSIGN APPLICATIONS TO A SPECIFIC GROUPNAME


main = None

@hook.subscribe.startup_once
def start_once():
    home = os.path.expanduser('~')
    subprocess.call([home + '/.config/qtile/scripts/autostart.sh'])

@hook.subscribe.startup
def start_always():
    # Set the cursor to something sane in X
    subprocess.Popen(['xsetroot', '-cursor_name', 'left_ptr'])

@hook.subscribe.client_new
def set_floating(window):
    if (window.window.get_wm_transient_for()
            or window.window.get_wm_type() in floating_types):
        window.floating = True

floating_types = ["notification", "toolbar", "splash", "dialog"]


follow_mouse_focus = True
bring_front_click = False
cursor_warp = False
floating_layout = layout.Floating(float_rules=[
    Match(wm_class='confirm'),
    Match(wm_class='dialog'),
    Match(wm_class='download'),
    Match(wm_class='error'),
    Match(wm_class='file_progress'),
    Match(wm_class='notification'),
    Match(wm_class='splash'),
    Match(wm_class='toolbar'),
    Match(wm_class='confirmreset'),
    Match(wm_class='makebranch'),
    Match(wm_class='maketag'),
    Match(wm_class='Arandr'),
    Match(wm_class='feh'),
    Match(wm_class='Galculator'),
    Match(title='branchdialog'),
    Match(title='Open File'),
    Match(title='pinentry'),
    Match(wm_class='ssh-askpass'),
    Match(wm_class='lxpolkit'),
    Match(wm_class='Lxpolkit'),
    Match(wm_class='yad'),
    Match(wm_class='Yad'),


],  fullscreen_border_width = 0, border_width = 0)
auto_fullscreen = True

focus_on_window_activation = "focus" # or smart

wmname = "LG3D"
