# legal-docs

Sitio estático (Jekyll) que publica gratis en **GitHub Pages** los documentos legales de mis apps: aviso de privacidad, términos de uso, eliminación de cuenta y datos, etc. Su propósito es tener URLs públicas y estables para pegarlas en **Google Play Console** (y en cualquier otra tienda).

- Para editar solo cambias un archivo Markdown y haces push (o lo editas en github.com o en la app móvil de GitHub). En unos 1-2 minutos está publicado.
- No hace falta build local: GitHub Pages construye Jekyll automáticamente.
- La página de inicio lista sola todas las apps y sus documentos a partir de `_docs/`.

> ⚠️ **Las plantillas no son asesoría legal.** Son un punto de partida basado en la ley mexicana de datos personales (LFPDPPP) y en los requisitos de Google Play. Revísalas con un profesional, sobre todo si tienes usuarios en otros países (UE/GDPR, EE. UU., etc.).

---

## Cómo funciona

```
_data/apps.yml            ← datos de cada app (nombre, desarrollador, correo…), una sola vez
_docs/<app>/<tipo>.md     ← cada documento publicado
        │
        └──► https://<usuario>.github.io/legal-docs/apps/<app>/<tipo>/
```

Los datos que se repiten (nombre de la app, responsable, domicilio, correo…) viven **solo** en `_data/apps.yml`. Si cambias el correo de contacto ahí, se actualiza en todos los documentos de esa app.

## Estructura del proyecto

```
_config.yml              # configuración del sitio (título, baseurl, permalinks)
_data/apps.yml           # datos de cada app
_docs/<app>/*.md         # documentos publicados (uno por archivo)
_templates/app/          # plantillas para copiar (NO se publican)
_layouts/                # plantillas HTML (default y doc)
_includes/fecha.html     # formatea fechas en español
assets/css/style.css     # estilos
index.html               # dashboard: lista apps y documentos automáticamente
404.html                 # página de "no encontrado"
scripts/validar.sh       # revisa que no se publique nada incompleto
.github/workflows/       # ejecuta el validador en cada push
```

---

## Añadir una app nueva

1. **Registra la app** en `_data/apps.yml` copiando el bloque de ejemplo (sin `#`):

   ```yaml
   mi-app:
     name: "Mi App"
     package_name: "com.miempresa.miapp"
     developer_name: "Juan Pérez"
     developer_address: "Calle 123, Col. Centro, CDMX, México, C.P. 00000"
     contact_email: "privacidad@miempresa.com"
     jurisdiction: "los Estados Unidos Mexicanos"
     courts: "Ciudad de México"
   ```

2. **Copia las plantillas** a una carpeta con el mismo slug:

   ```bash
   cp -r _templates/app _docs/mi-app
   ```

3. En cada archivo de `_docs/mi-app/`:
   - Cambia `app: mi-app` por tu slug.
   - Pon la fecha de hoy en `updated`.
   - Sustituye **todos** los textos `[[COMPLETAR: …]]`.
   - Borra las secciones que no apliquen (las instrucciones están en los comentarios `{% comment %}`, que no se publican).
   - Borra los documentos que no necesites (por ejemplo, `data-deletion.md` si la app no tiene cuentas).

4. Ejecuta el validador (ver abajo), haz commit y push. La app aparecerá sola en la página de inicio.

### Campos de `_data/apps.yml`

| Campo | Obligatorio | Para qué se usa |
|---|---|---|
| `name` | Sí | Nombre de la app, **igual que en la ficha de la tienda**. |
| `package_name` | Sí | Application ID de Android (ej. `com.miempresa.miapp`). |
| `developer_name` | Sí | Persona o empresa responsable. Google Play y la LFPDPPP exigen identificarla. |
| `developer_address` | Sí | Domicilio del responsable (requisito del aviso de privacidad en México). |
| `contact_email` | Sí | Correo para dudas, derechos ARCO y solicitudes de eliminación. |
| `jurisdiction` | Sí | Leyes que rigen los términos (ej. "los Estados Unidos Mexicanos"). |
| `courts` | Sí | Ciudad de los tribunales competentes. |

### Front matter de cada documento

| Campo | Obligatorio | Descripción |
|---|---|---|
| `app` | Sí | Slug de la app. **Debe ser igual** al nombre de la carpeta y a la clave en `_data/apps.yml`. |
| `type` | Sí | Tipo de documento (`privacy`, `terms`, `data-deletion`…). Se usa para ordenar. |
| `title` | Sí | Título visible del documento. |
| `updated` | Sí | Fecha de la última modificación (`AAAA-MM-DD`). Se muestra como "20 de septiembre de 2026". |

La URL la define el **nombre del archivo**: `_docs/mi-app/privacy.md` → `/apps/mi-app/privacy/`.

## Añadir un tipo de documento nuevo

Crea otro `.md` en la carpeta de la app con el mismo front matter, cambiando `type` y `title`, y con esta línea al inicio del contenido para acceder a los datos de la app:

```liquid
{% assign app = site.data.apps[page.app] %}
```

Por ejemplo, `_docs/mi-app/cookies.md` se publica en `/apps/mi-app/cookies/`.

---

## Validar antes de publicar

```bash
bash scripts/validar.sh
```

El validador revisa que:

- Cada documento tenga `app`, `type`, `title` y `updated`.
- `app` coincida con el nombre de la carpeta y la app esté registrada en `_data/apps.yml` con todos sus campos.
- No quede texto de plantilla: `[[COMPLETAR`, `ejemplo.com`, `com.tuempresa`, `TU-USUARIO`…

GitHub Actions lo ejecuta en cada push (pestaña **Actions**). Si falla, **GitHub Pages igual publica**: el validador avisa, no bloquea. Revisa la marca roja ✗ en el commit.

## Checklist para Google Play Console

Antes de pegar las URLs en Play Console, confirma que:

- [ ] El nombre de la app y el del desarrollador coinciden con la ficha de la tienda.
- [ ] El aviso de privacidad lista los mismos datos que declaraste en **Seguridad de los datos**.
- [ ] Los SDKs de terceros listados son los que realmente integra la app (revisa `build.gradle`).
- [ ] La página de eliminación explica los pasos, qué datos se borran, cuáles se conservan y por cuánto tiempo.
- [ ] La URL abre sin iniciar sesión y no es un PDF.
- [ ] `bash scripts/validar.sh` pasa sin errores.

URLs que se pegan en Play Console:

| Campo en Play Console | URL |
|---|---|
| Política de privacidad | `https://<usuario>.github.io/legal-docs/apps/<app>/privacy/` |
| Eliminación de datos | `https://<usuario>.github.io/legal-docs/apps/<app>/data-deletion/` |

---

## Publicar el sitio (una sola vez)

1. En GitHub: **Settings → Pages → Build and deployment → Source: Deploy from a branch → Branch: `main` / `(root)`**.
2. Espera 1-2 minutos. El sitio quedará en `https://<usuario>.github.io/legal-docs/`.
3. Si el repo no se llama `legal-docs`, cambia `baseurl` en `_config.yml` (ej. `/mi-repo`).
4. Recomendado: pon en `url` la dirección del sitio (ej. `https://<usuario>.github.io`).

### Dominio propio

Configúralo en **Settings → Pages → Custom domain** y deja `baseurl: ""` en `_config.yml`.

## Editar sin terminal

- **github.com**: abre el archivo → icono de lápiz → edita → **Commit changes**.
- **App móvil de GitHub**: mismo flujo desde el celular.

Cada commit dispara una nueva build de GitHub Pages.

## Historial de versiones de los documentos

Es buena práctica (y a veces una obligación) poder mostrar qué decía un documento antes. Git ya guarda cada versión: en GitHub, abre el archivo en `_docs/` y pulsa **History**. Cuando hagas un cambio importante, actualiza `updated` y describe el cambio en el mensaje del commit.

## Previsualizar en local (opcional)

Requiere Ruby.

```bash
bundle install
bundle exec jekyll serve
```

Abre `http://localhost:4000/legal-docs/`.

## Solución de problemas

| Síntoma | Causa probable |
|---|---|
| El sitio se ve sin estilos o los enlaces dan 404 | `baseurl` no coincide con el nombre del repo. |
| Un documento aparece sin nombre de app o con campos vacíos | La app no está en `_data/apps.yml`, o `app` no coincide con la clave. |
| Los cambios no aparecen | La build tarda 1-2 min. Revisa **Actions → pages build and deployment** por si hay errores. |
| Error de Liquid en la build | Suele ser un `{% comment %}` sin su `{% endcomment %}`. |
