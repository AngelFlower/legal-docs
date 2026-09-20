# legal-docs

Sitio estático (Jekyll) para hostear gratis, en GitHub Pages, las políticas de privacidad, términos de uso y demás documentos legales de tus apps. Pensado para editar y publicar en segundos: cambias un archivo Markdown, haces `git push` (o lo editas directo en GitHub.com / la app móvil de GitHub) y en ~1 minuto está publicado. No requiere build local ni GitHub Actions: GitHub Pages construye Jekyll automáticamente.

La página de inicio (`index.html`) es el "dashboard": lista automáticamente todas las apps y todos sus documentos, generado a partir de lo que haya en `_docs/`. No hay que mantenerlo a mano.

## Publicar el sitio (una sola vez)

1. Crea un repositorio en GitHub llamado `legal-docs` (o el nombre que prefieras) y sube esta carpeta.
   ```bash
   cd /Users/angel/Desarrollo/legal-docs
   git init
   git add .
   git commit -m "Setup inicial del sitio de documentos legales"
   git branch -M main
   git remote add origin https://github.com/TU-USUARIO/legal-docs.git
   git push -u origin main
   ```
2. En GitHub: **Settings → Pages → Build and deployment → Source: Deploy from a branch → Branch: `main` / `root`**.
3. Espera 1-2 minutos. Tu sitio quedará en `https://TU-USUARIO.github.io/legal-docs/`.
4. Si el nombre del repo es distinto de `legal-docs`, edita `baseurl` en `_config.yml` para que coincida (ej. `/mi-repo`).

Las URLs de cada documento (las que pegas en Google Play Console) quedan así:

```
https://TU-USUARIO.github.io/legal-docs/apps/<slug-de-tu-app>/privacy/
https://TU-USUARIO.github.io/legal-docs/apps/<slug-de-tu-app>/terms/
https://TU-USUARIO.github.io/legal-docs/apps/<slug-de-tu-app>/data-deletion/
```

## Añadir una app nueva

1. Copia la carpeta de ejemplo:
   ```bash
   cp -r _docs/ejemplo-app _docs/mi-app-nueva
   ```
2. En cada archivo dentro de `_docs/mi-app-nueva/`, edita el front matter (la parte entre `---`):
   - `app`: slug único de la app (debe coincidir con el nombre de la carpeta, en minúsculas y sin espacios).
   - `app_name`, `package_name`, `contact_email`: se insertan automáticamente en el texto del documento.
   - `updated`: fecha de la última modificación.
3. Ajusta el contenido de `privacy.md`, `terms.md` y `data-deletion.md` a lo que tu app realmente hace (qué datos recopila, qué SDKs usa, etc.).
4. Borra los archivos que no necesites para esa app (por ejemplo, si no tienes cuentas de usuario, puedes borrar `data-deletion.md`).
5. Haz commit y push. La app nueva aparecerá sola en el listado de inicio.

## Añadir un tipo de documento nuevo (lo que te vaya pidiendo Google Play)

Crea un archivo `.md` dentro de la carpeta de la app, con el mismo front matter que los demás, cambiando `type` y `title`. Por ejemplo, `_docs/mi-app-nueva/data-safety.md` con `type: data-safety` y `title: "Formulario de Seguridad de Datos"`. Se publicará automáticamente en:

```
/apps/mi-app-nueva/data-safety/
```

y aparecerá listado en la página de inicio junto a los demás documentos de esa app.

## Editar contenido rápido sin usar la terminal

Puedes editar cualquier archivo `.md` directamente en:
- **github.com**: navega al archivo → icono de lápiz → edita → "Commit changes".
- **App móvil de GitHub**: mismo flujo, desde el celular.

Cada commit dispara automáticamente una nueva build de GitHub Pages.

## Previsualizar en local (opcional)

Requiere Ruby instalado.

```bash
bundle install
bundle exec jekyll serve
```

Abre `http://localhost:4000`.

## Estructura del proyecto

```
_config.yml          # configuración del sitio (título, baseurl, permalinks)
_layouts/             # plantillas compartidas (default y doc)
assets/css/style.css  # estilos
index.html             # dashboard: lista todas las apps y documentos automáticamente
_docs/
  ejemplo-app/
    privacy.md
    terms.md
    data-deletion.md
  <tu-app>/
    ...
```
