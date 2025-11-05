# Cursor Visibility Issues Solution

If after installing the bspwm environment the cursor is not visible, you can follow these steps to fix it:

## Automatic Solution

Run the cursor fix script:

```bash
./fix_cursor.sh
```

## Manual Solution

1. **Install cursor themes** (if not already installed):
```bash
sudo apt install -y adwaita-icon-theme xcursor-themes x11-xserver-utils xserver-xorg-input-all
```

2. **Configure environment variables**:
```bash
export XCURSOR_THEME=Adwaita
export XCURSOR_SIZE=16
```

3. **Load X11 resources**:
```bash
xrdb -merge ~/.Xresources
```

4. **Set root window cursor**:
```bash
xsetroot -cursor_name left_ptr
```

5. **Restart picom**:
```bash
pkill picom
picom --config ~/.config/picom/picom.conf &
```

## Permanent Configuration

The files that have been added/modified to solve this problem:

- `.Xresources`: Cursor theme and size configuration
- `.xprofile`: Script that runs when X11 starts
- `config/bspwm/bspwmrc`: Cursor configuration in bspwm
- `config/picom/picom.conf`: Enhanced compositor configuration
- `scripts/fix_cursor.sh`: Cursor repair script

## Persistent Issues

If the cursor is still not visible after these steps:

1. Restart the system completely
2. Verify that you are using the correct display manager (lightdm, gdm, etc.)
3. Make sure to select bspwm in the session menu of the display manager

## Verification

To verify that the cursor is configured correctly:

```bash
echo $XCURSOR_THEME
echo $XCURSOR_SIZE
```

You should see:
```
Adwaita
16
```