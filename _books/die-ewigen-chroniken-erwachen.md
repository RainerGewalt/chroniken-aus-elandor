---
layout: book
title: "Die Ewigen Chroniken - Erwachen"
cover_image: /assets/images/covers/die-ewigen-chroniken-erwachen.jpeg
description: "In einer Welt voller geheimer Mächte und uralter Artefakte..."
type: book
---


<h3>Kapitel in {{ page.title }}</h3>
<ul class="chapters-list">
    {% assign book_chapters = site.chapters | where:"book", page.title %}
    {% for chapter in book_chapters %}
    <li>
        <a href="{{ chapter.url | relative_url }}">{{ chapter.title }}</a>
    </li>
    {% endfor %}
</ul>
