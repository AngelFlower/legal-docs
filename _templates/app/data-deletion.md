---
app: mi-app
type: data-deletion
title: "Eliminación de cuenta y datos"
updated: 2026-01-01
---
{% assign app = site.data.apps[page.app] %}
{% comment %}
  PLANTILLA — NO ES ASESORÍA LEGAL.
  Esta es la URL que Google Play pide en "Eliminación de datos". Google Play exige que
  la página mencione la App o al desarrollador tal como aparecen en la ficha de la tienda,
  explique los pasos y diga qué datos se borran, cuáles se conservan y por cuánto tiempo.
  Todo lo marcado con el marcador COMPLETAR debe sustituirse.
{% endcomment %}

Esta página explica cómo solicitar la eliminación de tu cuenta y de tus datos en **{{ app.name }}**, aplicación publicada por **{{ app.developer_name }}**.

## Opción 1: Desde la App

1. Abre {{ app.name }}.
2. Ve a [[COMPLETAR: ruta real, ej. Perfil → Ajustes]].
3. Toca **Eliminar cuenta** y confirma.

Tu cuenta y los datos asociados se eliminarán en un plazo máximo de [[COMPLETAR: ej. 30 días]].

## Opción 2: Por correo electrónico

Si no puedes acceder a la App, escribe a **{{ app.contact_email }}** desde el correo asociado a tu cuenta, con el asunto "Eliminar cuenta" e indicando tu nombre de usuario o identificador.

Procesaremos la solicitud en un plazo máximo de [[COMPLETAR: ej. 30 días]].

## Qué datos se eliminan

{% comment %}Ajusta la lista a lo que tu App realmente guarda.{% endcomment %}

- Información de perfil (nombre, correo, foto, etc.).
- Contenido que hayas creado dentro de la App.
- Preferencias y configuración de la cuenta.

## Qué datos podemos conservar

Por obligaciones legales, fiscales o de seguridad, podemos conservar la siguiente información durante [[COMPLETAR: plazo, ej. 5 años para registros fiscales]]:

- [[COMPLETAR: ej. registros de transacciones, o escribe "No conservamos ningún dato después de la eliminación."]]

## Contacto

Si tienes dudas sobre este proceso, escríbenos a **{{ app.contact_email }}**.
