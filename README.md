# Die Ewigen Chroniken – Märchen aus Elandor

Jekyll-Seite mit den Märchen und der Fantasy-Saga aus der Welt Elandor.

Live: https://rainergewalt.github.io/chroniken-aus-elandor/

## Lokal starten

```sh
bundle install
bundle exec jekyll serve
```

Danach unter http://localhost:4000/chroniken-aus-elandor/ öffnen.
Das `Gemfile` nutzt das Gem `github-pages`, lokal baut also dieselbe Jekyll-Version wie auf GitHub Pages.

## Veröffentlichen

Jeder Push auf `main` wird automatisch von GitHub Pages gebaut und ist nach ein bis zwei Minuten online.

## Inhalte

| Was | Wo |
| --- | --- |
| Märchen | `_stories/<name>.md` |
| Bücher | `_books/<name>.md` |
| Kapitel | `_chapters/<buch>/kapitel-<n>.md` (mit `chapter_number`) |
| Seiten (Über Elandor, Autor, Lizenz) | `_pages/` |

### Neues Märchen

1. Cover als PNG oder JPEG nach `assets/images/covers/<name>.png` legen.
2. Varianten erzeugen (braucht ImageMagick): `scripts/optimize-images.sh assets/images/covers/<name>.png`
3. Das Original löschen (es wird nicht ausgeliefert).
4. `_stories/<name>.md` anlegen:

```yaml
---
title: "Titel des Märchens"
description: "Ein bis zwei Sätze, die neugierig machen (erscheinen bei Google und auf den Karten)."
date: 2026-10-05
cover_image: /assets/images/covers/<name>.jpg
cover_alt: "Was auf dem Bild zu sehen ist"
permalink: /maerchen/<name>/
keywords: ["Elandor", "…"]
---
```

Für ein Cover im Hochformat zusätzlich `cover_width: 1024` und `cover_height: 1536` setzen.
