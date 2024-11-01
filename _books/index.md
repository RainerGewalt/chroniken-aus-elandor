---
layout: default
title: "Abenteuer aus Elandor"
permalink: /books/
is_book_overview: true
---

<h1>{{ page.title }}</h1>

<div class="books-grid">
    {% assign books = site.books %}
    {% for book in books %}
    <div class="book-card">
        <a href="{{ book.url | relative_url }}">
            <img src="{{ book.cover_image | relative_url }}" alt="{{ book.title }} Cover" class="book-card-cover">
            <h2>{{ book.title }}</h2>
        </a>
        <p>{{ book.description }}</p>
        <button class="toggle-chapters" data-book-title="{{ book.title }}">Kapitel anzeigen</button>
        <ul class="chapters-list" style="display: none;">
            {% assign book_chapters = site.chapters | where:"book", book.title %}
            {% for chapter in book_chapters %}
            <li><a href="{{ chapter.url | relative_url }}">{{ chapter.title }}</a></li>
            {% endfor %}
        </ul>
    </div>
    {% endfor %}
</div>

<!-- JavaScript für das Ausklappen der Kapitel -->
<script>
    document.addEventListener('DOMContentLoaded', function() {
        const toggleButtons = document.querySelectorAll('.toggle-chapters');
        toggleButtons.forEach(button => {
            button.addEventListener('click', function() {
                const chaptersList = this.nextElementSibling;
                if (chaptersList.style.display === 'none' || chaptersList.style.display === '') {
                    chaptersList.style.display = 'block';
                    this.textContent = 'Kapitel verbergen';
                } else {
                    chaptersList.style.display = 'none';
                    this.textContent = 'Kapitel anzeigen';
                }
            });
        });
    });
</script>
