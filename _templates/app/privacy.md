---
app: mi-app
type: privacy
title: "Aviso de Privacidad"
updated: 2026-01-01
---
{% assign app = site.data.apps[page.app] %}
{% comment %}
  PLANTILLA — NO ES ASESORÍA LEGAL. Revísala con un profesional antes de publicarla.
  Estructura basada en la Ley Federal de Protección de Datos Personales en
  Posesión de los Particulares (México) y en los requisitos de Google Play.
  Todo lo marcado con el marcador COMPLETAR debe sustituirse; el validador
  (scripts/validar.sh) impide publicar mientras quede alguno.
  Los bloques de comentario como este NO se muestran en el sitio publicado.
{% endcomment %}

**{{ app.developer_name }}** (en adelante, "el Responsable"), con domicilio en {{ app.developer_address }}, es responsable del tratamiento de los datos personales que recaba a través de la aplicación **{{ app.name }}** (`{{ app.package_name }}`, en adelante, "la App"), y los protege conforme a la legislación aplicable.

## 1. Datos personales que recabamos

{% comment %}
  Deja solo lo que la App realmente recaba. Debe coincidir con lo declarado
  en el formulario de Seguridad de los datos de Google Play Console.
{% endcomment %}

- **Datos de identificación y contacto**: [[COMPLETAR: ej. nombre, correo electrónico, foto de perfil]].
- **Datos de uso**: pantallas visitadas, acciones realizadas en la App y estadísticas de uso.
- **Datos del dispositivo**: modelo, sistema operativo, idioma e identificadores (por ejemplo, ID de publicidad).
- **Datos de ubicación**: [[COMPLETAR: "no recabamos datos de ubicación" o "ubicación aproximada/precisa, solo con tu permiso"]].

No recabamos datos personales sensibles. {% comment %}Si los recabas (salud, biométricos, creencias, etc.), la ley exige consentimiento expreso y por escrito: descríbelo aquí.{% endcomment %}

## 2. Finalidades del tratamiento

**Finalidades primarias** (necesarias para darte el servicio):

- Crear y administrar tu cuenta.
- Proveer y mantener el funcionamiento de la App.
- Detectar y corregir errores, y mantener la seguridad del servicio.
- Cumplir obligaciones legales.

**Finalidades secundarias** (no son necesarias para el servicio):

- [[COMPLETAR: ej. enviarte promociones o novedades; mostrar publicidad personalizada; o escribe "No realizamos tratamientos con finalidades secundarias."]]

Si no deseas que tus datos se usen para las finalidades secundarias, escríbenos a **{{ app.contact_email }}**. Tu negativa no será motivo para negarte el servicio.

## 3. Servicios de terceros y transferencias

La App utiliza los siguientes servicios de terceros, que pueden tratar datos en nuestro nombre conforme a sus propias políticas:

{% comment %}Sustituye por los SDKs que realmente integra tu App (revisa build.gradle).{% endcomment %}

- [[COMPLETAR: ej. Firebase Analytics (Google) — analítica de uso]]
- [[COMPLETAR: ej. Firebase Crashlytics (Google) — reporte de errores]]

No vendemos tus datos personales. Solo los compartimos cuando es necesario para operar los servicios anteriores, cuando lo exige la ley o una autoridad competente, o con tu consentimiento. Algunos de estos proveedores pueden almacenar datos fuera de México.

## 4. Derechos ARCO

Tienes derecho a **Acceder** a tus datos personales, **Rectificarlos** si son inexactos, **Cancelarlos** cuando consideres que no se requieren para las finalidades señaladas, y **Oponerte** a su tratamiento para fines específicos.

Para ejercerlos, envía una solicitud a **{{ app.contact_email }}** con:

1. Tu nombre y un medio para comunicarte la respuesta.
2. Documentos que acrediten tu identidad (o la de tu representante).
3. Descripción clara de los datos y del derecho que deseas ejercer.

Te responderemos en un plazo máximo de [[COMPLETAR: ej. 20 días hábiles — verifica el plazo legal vigente]].

## 5. Revocación del consentimiento y limitación del uso

Puedes revocar tu consentimiento o limitar el uso de tus datos escribiendo a **{{ app.contact_email }}**. También puedes eliminar tu cuenta y tus datos siguiendo el procedimiento de [eliminación de cuenta y datos]({{ '/apps/' | append: page.app | append: '/data-deletion/' | relative_url }}).

## 6. Conservación

Conservamos tus datos solo durante el tiempo necesario para las finalidades descritas, salvo que la ley exija un plazo distinto.

## 7. Menores de edad

La App no está dirigida a menores de [[COMPLETAR: ej. 13 o 18]] años y no recabamos intencionalmente sus datos. Si detectas que un menor nos proporcionó datos personales, escríbenos para eliminarlos.

## 8. Seguridad

Aplicamos medidas administrativas, técnicas y físicas razonables para proteger tus datos, aunque ningún sistema es completamente seguro.

## 9. Cambios a este aviso

Podemos modificar este Aviso de Privacidad. Publicaremos la versión vigente en esta misma dirección, indicando la fecha de "Última actualización".

## 10. Contacto

Para cualquier duda sobre este aviso, escríbenos a **{{ app.contact_email }}**.

{% comment %}
  OPCIONAL — si tienes usuarios en la Unión Europea (GDPR), agrega una sección con:
  base jurídica de cada tratamiento, transferencias internacionales y sus garantías,
  derecho a la portabilidad y a presentar una reclamación ante una autoridad de control.
{% endcomment %}
