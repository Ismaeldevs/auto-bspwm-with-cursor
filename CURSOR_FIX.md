# Solución para problemas de visualización del cursor

Si después de instalar el entorno bspwm el cursor no es visible, puedes seguir estos pasos para solucionarlo:

## Solución automática

Ejecuta el script de reparación del cursor:

```bash
./fix_cursor.sh
```

## Solución manual

1. **Instalar temas de cursor** (si no están instalados):
```bash
sudo apt install -y adwaita-icon-theme xcursor-themes x11-xserver-utils xserver-xorg-input-all
```

2. **Configurar variables de entorno**:
```bash
export XCURSOR_THEME=Adwaita
export XCURSOR_SIZE=16
```

3. **Cargar recursos de X11**:
```bash
xrdb -merge ~/.Xresources
```

4. **Establecer cursor del root window**:
```bash
xsetroot -cursor_name left_ptr
```

5. **Reiniciar picom**:
```bash
pkill picom
picom --config ~/.config/picom/picom.conf &
```

## Configuración permanente

Los archivos que se han agregado/modificado para solucionar este problema:

- `.Xresources`: Configuración del tema y tamaño del cursor
- `.xprofile`: Script que se ejecuta al iniciar X11
- `config/bspwm/bspwmrc`: Configuración del cursor en bspwm
- `config/picom/picom.conf`: Configuración mejorada del compositor
- `scripts/fix_cursor.sh`: Script de reparación del cursor

## Problemas persistentes

Si el cursor sigue sin ser visible después de estos pasos:

1. Reinicia el sistema completamente
2. Verifica que estés usando el gestor de pantalla correcto (lightdm, gdm, etc.)
3. Asegúrate de seleccionar bspwm en el menú de sesión del gestor de pantalla

## Verificación

Para verificar que el cursor está configurado correctamente:

```bash
echo $XCURSOR_THEME
echo $XCURSOR_SIZE
```

Deberías ver:
```
Adwaita
16
```