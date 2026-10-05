---
layout: default
title: "Abenteuer aus Elandor"
permalink: /buecher/
is_book_overview: true
---

<h1 class="main-title">{{ page.title }}</h1>

<div class="books-grid">
    {% assign books = site.books | where_exp: "book", "book.title != page.title" %}
    {% for book in books %}
    <div class="book-card">
        <a href="{{ book.url | relative_url }}">
            {% include cover.html src=book.cover_image alt=book.cover_alt class="book-card-cover" sizes="300px" loading="eager" width=book.cover_width height=book.cover_height %}
            <h2 class="book-title">{{ book.title }}</h2>
        </a>
        <p class="book-description">{{ book.description }}</p>
        <button class="toggle-chapters" type="button" aria-expanded="false">Kapitel anzeigen</button>
        <ul class="chapters-list" hidden>
            {% assign book_chapters = site.chapters | where:"book", book.title | sort: "chapter_number" %}
            {% for chapter in book_chapters %}
            <li><a href="{{ chapter.url | relative_url }}">{{ chapter.title }}</a></li>
            {% endfor %}
        </ul>
    </div>
    {% endfor %}
</div>
