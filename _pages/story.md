---
layout: default
title: "Geschichten"
description: "Entdecke die Geschichten aus der magischen Welt von Elandor."
permalink: /stories/
---

# Geschichten aus Elandor

Hier findest du eine Sammlung aller Geschichten aus der magischen Welt von Elandor. Klicke auf die Titel, um mehr über jede Geschichte zu erfahren.

<ul>
    {% for story in site.stories %}
    <li>
        <a href="{{ story.url | relative_url }}">{{ story.title }}</a>: {{ story.description }}
    </li>
    {% endfor %}
</ul>
