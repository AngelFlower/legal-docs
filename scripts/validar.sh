#!/usr/bin/env bash
# Revisa que los documentos estén listos para publicarse.
# Uso: bash scripts/validar.sh   (también lo ejecuta GitHub Actions en cada push)
set -u
cd "$(dirname "$0")/.."

errores=0
error() { echo "ERROR: $*"; errores=$((errores + 1)); }

DATA="_data/apps.yml"
CAMPOS_DOC="app type title updated"
CAMPOS_APP="name package_name developer_name developer_address contact_email jurisdiction courts"

# Valor de un campo del front matter (primer bloque entre ---).
campo_doc() {
  awk -v k="$2" '
    NR == 1 && $0 == "---" { dentro = 1; next }
    dentro && $0 == "---" { exit }
    dentro && index($0, k ":") == 1 { sub("^" k ":[ ]*", ""); gsub(/^"|"$/, ""); print; exit }
  ' "$1"
}

# Valor de un campo de una app en _data/apps.yml (formato "slug:" + campos indentados).
campo_app() {
  awk -v app="$1" -v k="$2" '
    $0 ~ "^" app ":[ ]*$" { dentro = 1; next }
    dentro && /^[^ #]/ { exit }
    dentro && $1 == k ":" { sub("^[ ]*" k ":[ ]*", ""); sub(/[ ]+#.*$/, ""); gsub(/^"|"$/, ""); print; exit }
  ' "$DATA"
}

shopt -s nullglob
docs=(_docs/*/*.md)

for doc in "${docs[@]}"; do
  carpeta=$(basename "$(dirname "$doc")")

  for c in $CAMPOS_DOC; do
    [ -n "$(campo_doc "$doc" "$c")" ] || error "$doc: falta '$c' en el front matter"
  done

  app=$(campo_doc "$doc" app)
  [ -z "$app" ] && continue
  [ "$app" = "$carpeta" ] || error "$doc: 'app: $app' no coincide con la carpeta '$carpeta'"

  if ! grep -q "^$app:[ ]*$" "$DATA" 2>/dev/null; then
    error "$doc: la app '$app' no está registrada en $DATA"
  fi
done

# Campos obligatorios de cada app que tenga documentos publicados.
for app in $(for d in "${docs[@]}"; do basename "$(dirname "$d")"; done | sort -u); do
  grep -q "^$app:[ ]*$" "$DATA" 2>/dev/null || continue
  for c in $CAMPOS_APP; do
    [ -n "$(campo_app "$app" "$c")" ] || error "$DATA: a la app '$app' le falta '$c'"
  done
done

# Textos de plantilla que no deben llegar a producción (ignora líneas comentadas del YAML).
PATRONES='\[\[COMPLETAR|ejemplo\.com|com\.tuempresa|com\.miempresa|TU-USUARIO'
while IFS= read -r linea; do
  error "texto de plantilla sin completar → $linea"
done < <(
  { [ ${#docs[@]} -gt 0 ] && grep -nE "$PATRONES" "${docs[@]}"; } 2>/dev/null
  [ -f "$DATA" ] && grep -nE "$PATRONES" "$DATA" | grep -vE '^[0-9]+:[ ]*#' | sed "s|^|$DATA:|"
)

if [ "$errores" -gt 0 ]; then
  echo
  echo "✗ $errores problema(s). Corrígelos antes de publicar."
  exit 1
fi
echo "✓ ${#docs[@]} documento(s) revisados. Todo listo para publicar."
