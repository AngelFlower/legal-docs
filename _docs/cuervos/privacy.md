---
app: cuervos
type: privacy
title: "Aviso de Privacidad"
updated: 2026-10-28
---
{% assign app = site.data.apps[page.app] %}

**{{ app.developer_name }}** es responsable de **{{ app.name }}** (`{{ app.package_name }}`, "la App"), una aplicación no oficial que permite a estudiantes consultar sus calificaciones y el calendario escolar de la UTVT. No está afiliada a la universidad.

## Qué datos usa la App

- **Tu matrícula y contraseña** del portal SAIIUT. Se envían directamente al portal de la universidad para iniciar sesión. La App **no guarda tu contraseña** ni la envía a nuestros servidores.
- **Cookies de sesión** que devuelve el portal. Se guardan cifradas solo en tu dispositivo y se borran al cerrar sesión.
- **Tus calificaciones y datos académicos**. Se leen del portal y se muestran en pantalla; no se almacenan fuera de tu dispositivo.

No recabamos ubicación, contactos, fotos ni identificadores de publicidad. No usamos analítica ni anuncios, y no vendemos ni compartimos tus datos.

## Versión web

En la versión web las peticiones al portal pasan por un servicio intermedio propio que solo reenvía la solicitud al portal de la UTVT. No guarda ni registra tus credenciales ni tus datos.

## Tus derechos

Puedes pedir acceso, rectificación, cancelación u oposición sobre tus datos escribiendo a **{{ app.contact_email }}**. Para borrar los datos locales basta con cerrar sesión o desinstalar la App; consulta [eliminación de datos]({{ '/apps/' | append: page.app | append: '/data-deletion/' | relative_url }}).

## Menores y cambios

La App está dirigida a estudiantes universitarios. Si este aviso cambia, publicaremos la versión vigente en esta dirección con su fecha de actualización.

## Contacto

**{{ app.contact_email }}**
