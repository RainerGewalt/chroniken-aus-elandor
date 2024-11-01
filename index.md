---
layout: default
title: "Willkommen bei den Chroniken aus Elandor"
description: "Entdecke die magische Welt von Elandor durch Märchen und Geschichten."
---

# Willkommen bei den Chroniken aus Elandor

![Willkommen in Elandor]({{ '/assets/images/willkommen-banner.jpg' | relative_url }}){: .landing-banner }

Willkommen in der zauberhaften Welt von **Elandor**, wo Märchen und Legenden auf spannende Abenteuerreisen treffen. Hier erwarten dich mystische Kreaturen, mutige Helden und uralte Geheimnisse, die nur darauf warten, entdeckt zu werden.

---

## Märchen und Abenteuer

### Die Ewigen Chroniken - Eine Abenteuerreise
Erkunde die "Ewigen Chroniken" und begleite mutige Helden auf ihrer Reise durch die geheimnisvollen Länder Elandors. Kämpfe gegen dunkle Mächte, entdecke längst vergessene Artefakte und lüfte die Geheimnisse der Zeit.

**[Mehr über die Ewigen Chroniken]({{ '/books/' | relative_url }})**

### Geschichten aus Elandor - Märchen voller Magie
In den "Geschichten aus Elandor" finden sich zauberhafte Märchen, die die alten Sagen und Legenden dieser Welt zum Leben erwecken. Von mystischen Wesen über zeitlose Lektionen bis hin zu der Magie der Natur – hier ist für jeden etwas dabei.

**[Entdecke die Märchenwelt]({{ '/stories/' | relative_url }})**

---

## Regelmäßige Updates

Bleib gespannt! Die Welt von Elandor wächst ständig, und es gibt regelmäßig neue Geschichten und Abenteuer zu entdecken. Besuche uns oft, um die neuesten Kapitel und Märchen nicht zu verpassen.

### Hörbücher auf YouTube und Spotify
Für alle, die gerne lauschen, gibt es auch Hörbücher aus Elandor. Die Geschichten sind auf **[YouTube](https://www.youtube.com/@florianhzg4113)** und **[Spotify](https://podcasters.spotify.com/pod/show/florian-przybylak)** verfügbar, perfekt zum Eintauchen in die Welt der Märchen und Legenden, wann und wo du willst.

<div class="social-links">
    <a href="https://www.youtube.com/@florianhzg4113" target="_blank" aria-label="YouTube">
        <img src="{{ '/assets/images/icons/youtube.png' | relative_url }}" alt="YouTube Icon" width="36" height="36">
    </a>
    <a href="https://podcasters.spotify.com/pod/show/florian-przybylak" target="_blank" aria-label="Spotify">
        <img src="{{ '/assets/images/icons/spotify.png' | relative_url }}" alt="Spotify Icon" width="36" height="36">
    </a>
</div>

---

## Beliebte Geschichten

<div class="stories-grid">
    {% for story in site.stories limit:3 %}
    <div class="story-card">
        <a href="{{ story.url | relative_url }}">
            <img src="{{ story.cover_image | relative_url }}" alt="{{ story.title }} Cover" class="story-card-cover">
            <h3>{{ story.title }}</h3>
        </a>
        <p>{{ story.description }}</p>
    </div>
    {% endfor %}
</div>

---

## Erfahre mehr über Elandor

Tauche tiefer in die Welt von Elandor ein und entdecke die kulturellen und geographischen Besonderheiten dieses fantastischen Reichs. Besuche unsere **[Über Elandor-Seite]({{ '/about/' | relative_url }})**, um mehr über die Entstehung und die Magie dieser Welt zu erfahren.

---

Bleib gespannt und tauche ein in die Magie von Elandor – neue Abenteuer und Geschichten warten in den Chroniken!
