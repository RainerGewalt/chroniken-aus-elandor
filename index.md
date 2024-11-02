---
layout: default
title: "Willkommen bei den Chroniken aus Elandor"
description: "Entdecke die magische Welt von Elandor durch Märchen und Geschichten."
---

<section class="elandor-landing-page">
  <div class="elandor-landing-hero">
    <div class="elandor-landing-info">
      <h1>Willkommen bei den Chroniken aus Elandor</h1>
      <p>Willkommen in der zauberhaften Welt von <strong>Elandor</strong>, wo Märchen und Legenden auf spannende Abenteuerreisen treffen. Hier erwarten dich mystische Kreaturen, mutige Helden und uralte Geheimnisse, die nur darauf warten, entdeckt zu werden.</p>

      <h2>Beliebte Märchen und Bücher</h2>
      <p>Entdecke die Vielfalt der Abenteuer, die Elandor zu bieten hat – von spannenden Märchen bis zu epischen Erzählungen, die fesselnde Geschichten und unvergessliche Charaktere vereinen.</p>

      <div class="stories-grid">
        <!-- Beliebte Märchen -->
        {% for story in site.stories limit:3 %}
          <div class="story-card">
            <a href="{{ story.url | relative_url }}">
              <img src="{{ story.cover_image | relative_url }}" alt="{{ story.title }} Cover" class="story-card-cover">
              <h3>{{ story.title }}</h3>
            </a>
            <p>{{ story.description }}</p>
          </div>
        {% endfor %}

        <!-- Beispielbuch: Die Ewigen Chroniken - Erwachen -->
        <div class="story-card">
          <a href="{{ '/books/die-ewigen-chroniken-erwachen/' | relative_url }}">
            <img src="{{ '/assets/images/covers/die-ewigen-chroniken-erwachen.jpeg' | relative_url }}" alt="Die Ewigen Chroniken - Erwachen Cover" class="story-card-cover">
            <h3>Die Ewigen Chroniken - Erwachen</h3>
          </a>
          <p>Begib dich auf eine abenteuerliche Reise durch Elandor und entdecke die Ursprünge der Ewigen Chroniken in einem epischen Kampf zwischen Zeit und Macht.</p>
        </div>
      </div>
    </div>
  </div>
</section>

<section>
  <h2>Regelmäßige Updates</h2>
  <p>Bleib gespannt! Die Welt von Elandor wächst ständig, und es gibt regelmäßig neue Geschichten und Abenteuer zu entdecken. Besuche uns oft, um die neuesten Kapitel und Märchen nicht zu verpassen.</p>

<h3>Hörbücher auf YouTube und Spotify</h3>
  <p>Für alle, die gerne lauschen, gibt es auch Hörbücher aus Elandor. Die Geschichten sind auf <a href="https://www.youtube.com/@florianhzg4113" target="_blank">YouTube</a> und <a href="https://podcasters.spotify.com/pod/show/florian-przybylak" target="_blank">Spotify</a> verfügbar, perfekt zum Eintauchen in die Welt der Märchen und Legenden, wann und wo du willst.</p>

 
</section>
