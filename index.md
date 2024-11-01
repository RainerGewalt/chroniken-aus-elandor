---
layout: default
title: "Willkommen bei den Chroniken aus Elandor"
description: "Entdecke die magische Welt von Elandor durch Märchen und Geschichten."
---

# Willkommen bei den Chroniken aus Elandor

![Willkommen in Elandor]({{ '/assets/images/willkommen-banner.jpg' | relative_url }} "Willkommen in der magischen Welt von Elandor")

Willkommen zu einer Sammlung von Märchen und Geschichten aus der magischen Welt von Elandor. Erlebe Abenteuer, entdecke alte Legenden und tauche ein in die Mysterien dieser einzigartigen Welt.

## Beliebte Geschichten

<div class="stories-grid">
    {% for story in site.stories %}
    <div class="story-card">
        <a href="{{ story.url | relative_url }}">
            <img src="{{ story.cover_image }}" alt="{{ story.title }} Cover" class="story-card-cover">
            <h2>{{ story.title }}</h2>
        </a>
        <p>{{ story.description }}</p>
    </div>
    {% endfor %}
</div>

## Erfahre mehr über Elandor

Tauche tiefer in die Welt von Elandor ein und lerne die kulturellen und geographischen Eigenheiten dieses fantastischen Reichs kennen. Besuche unsere **[Über Elandor-Seite]({{ '/about/' | relative_url }})**, um mehr über die Entstehung dieser Welt zu erfahren.

---

Bleib gespannt und tauche ein in die Magie von Elandor – neue Abenteuer warten in den Chroniken!
