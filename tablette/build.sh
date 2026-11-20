#!/bin/sh
# Construit index.html (version installable) à partir de accueil.html (contenu de la page).
cd "$(dirname "$0")"
{
  printf '%s\n' '<!doctype html>' '<html lang="fr">' '<head>' \
    '<meta charset="utf-8">' \
    '<meta name="viewport" content="width=device-width, initial-scale=1, viewport-fit=cover">' \
    '<meta name="theme-color" content="#0b0f1a">' \
    '<meta name="mobile-web-app-capable" content="yes">' \
    '<link rel="manifest" href="manifest.webmanifest">' \
    '<link rel="icon" href="icons/icon-192.png">' \
    '<link rel="apple-touch-icon" href="icons/icon-192.png">' \
    '<script>if ("serviceWorker" in navigator) addEventListener("load", function () { navigator.serviceWorker.register("sw.js").catch(function () {}); });</script>' \
    '</head>' '<body>'
  cat accueil.html
  printf '\n%s\n' '</body>' '</html>'
} > index.html
