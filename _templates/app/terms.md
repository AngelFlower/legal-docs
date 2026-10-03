---
app: mi-app
type: terms
title: "Términos y Condiciones de Uso"
updated: 2026-01-01
---
{% assign app = site.data.apps[page.app] %}
{% comment %}
  PLANTILLA — NO ES ASESORÍA LEGAL. Revísala con un profesional antes de publicarla.
  Todo lo marcado con el marcador COMPLETAR debe sustituirse.
{% endcomment %}

Estos Términos y Condiciones ("Términos") regulan el uso de la aplicación **{{ app.name }}** (`{{ app.package_name }}`, en adelante, "la App"), ofrecida por **{{ app.developer_name }}** ("nosotros"). Al descargar o usar la App aceptas estos Términos.

## 1. Uso de la App

Te otorgamos una licencia limitada, no exclusiva, revocable e intransferible para usar la App con fines personales y no comerciales.

## 2. Cuentas de usuario

Si la App requiere una cuenta, eres responsable de mantener la confidencialidad de tus credenciales y de la actividad realizada con ella.

## 3. Conducta del usuario

Al usar la App te comprometes a no:

- Usarla con fines ilegales o no autorizados.
- Intentar vulnerar la seguridad de la App o de sus servicios asociados.
- Realizar ingeniería inversa, descompilar o copiar su código, salvo lo permitido por la ley.

## 4. Propiedad intelectual

El contenido, las marcas, los logotipos y el código de la App son propiedad de {{ app.developer_name }} o de sus licenciantes, y están protegidos por las leyes de propiedad intelectual.

{% comment %}Borra la sección 5 si la App no tiene compras ni suscripciones, y renumera las siguientes.{% endcomment %}

## 5. Compras y suscripciones

Algunas funciones pueden requerir compras dentro de la App o suscripciones, procesadas por Google Play. El precio y las condiciones se muestran antes de confirmar la compra.

- Las suscripciones se renuevan automáticamente hasta que las canceles desde **Google Play → Pagos y suscripciones**.
- Los reembolsos se rigen por las políticas de Google Play.

## 6. Exclusión de garantías

La App se proporciona "tal cual" y "según disponibilidad", sin garantías de ningún tipo, salvo las que la ley exija.

## 7. Limitación de responsabilidad

En la medida permitida por la ley, no seremos responsables de daños indirectos, incidentales o consecuentes derivados del uso de la App.

## 8. Terminación

Podemos suspender o cancelar tu acceso a la App si incumples estos Términos. Puedes dejar de usarla y eliminar tu cuenta en cualquier momento.

## 9. Privacidad

El tratamiento de tus datos personales se describe en nuestro [Aviso de Privacidad]({{ '/apps/' | append: page.app | append: '/privacy/' | relative_url }}).

## 10. Cambios a estos Términos

Podemos actualizar estos Términos. Publicaremos la versión vigente en esta dirección con su fecha de "Última actualización". El uso continuado de la App después de un cambio implica su aceptación.

## 11. Ley aplicable y jurisdicción

Estos Términos se rigen por las leyes de {{ app.jurisdiction }}. Para cualquier controversia, las partes se someten a los tribunales competentes de {{ app.courts }}, sin perjuicio de los derechos que la ley de protección al consumidor te otorgue.

## 12. Contacto

Para preguntas sobre estos Términos, escríbenos a **{{ app.contact_email }}**.
