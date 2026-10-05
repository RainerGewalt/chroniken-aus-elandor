// Lesewerkzeuge für Märchen und Kapitel: Nachtmodus, Lesezeichen, Fortschrittsbalken.
(function () {
    "use strict";

    var root = document.documentElement;
    var THEME_KEY = "elandor-theme";
    var bookmarkKey = "elandor-bookmark:" + location.pathname;

    function read(key) {
        try { return localStorage.getItem(key); } catch (e) { return null; }
    }

    function write(key, value) {
        try { localStorage.setItem(key, value); return true; } catch (e) { return false; }
    }

    // Werkzeugleiste auch per Tippen öffnen (Hover gibt es auf Touch-Geräten nicht)
    var tools = document.querySelector(".reader-tools");
    var toggle = document.querySelector(".reader-tools-toggle");
    if (tools && toggle) {
        toggle.addEventListener("click", function () {
            var open = tools.classList.toggle("open");
            toggle.setAttribute("aria-expanded", open ? "true" : "false");
        });
    }

    // Nachtmodus (die Klasse setzt ein Inline-Skript im <head> schon vor dem ersten Zeichnen)
    var nightBtn = document.getElementById("nightModeToggle");
    function updateNightLabel() {
        if (nightBtn) {
            nightBtn.textContent = root.classList.contains("dark-mode") ? "☀️ Tagmodus" : "🌙 Nachtmodus";
        }
    }
    if (nightBtn) {
        updateNightLabel();
        nightBtn.addEventListener("click", function () {
            var dark = root.classList.toggle("dark-mode");
            write(THEME_KEY, dark ? "dark" : "light");
            updateNightLabel();
        });
    }

    // Lesezeichen gilt nur für die Seite, auf der es gesetzt wurde
    var bookmarkBtn = document.getElementById("bookmarkBtn");
    if (bookmarkBtn) {
        bookmarkBtn.addEventListener("click", function () {
            var saved = write(bookmarkKey, String(Math.round(window.scrollY)));
            var label = bookmarkBtn.textContent;
            bookmarkBtn.textContent = saved ? "✓ Gespeichert" : "Nicht möglich";
            setTimeout(function () { bookmarkBtn.textContent = label; }, 2000);
        });
    }

    var savedPosition = parseInt(read(bookmarkKey), 10);
    if (savedPosition > 0 && !location.hash) {
        window.addEventListener("load", function () {
            window.scrollTo({ top: savedPosition, behavior: "instant" });
        });
    }

    // Fortschrittsbalken
    var bar = document.querySelector(".reading-progress-bar");
    if (bar) {
        var ticking = false;
        var update = function () {
            var scrollable = root.scrollHeight - root.clientHeight;
            bar.style.height = (scrollable > 0 ? (window.scrollY / scrollable) * 100 : 0) + "%";
            ticking = false;
        };
        window.addEventListener("scroll", function () {
            if (!ticking) {
                ticking = true;
                window.requestAnimationFrame(update);
            }
        }, { passive: true });
        update();
    }
})();
