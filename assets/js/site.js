// Navigation auf kleinen Bildschirmen auf- und zuklappen.
(function () {
    "use strict";

    var header = document.getElementById("header");
    var toggle = document.querySelector(".nav-toggle");
    if (!header || !toggle) {
        return;
    }

    toggle.addEventListener("click", function () {
        var open = header.classList.toggle("menu-open");
        toggle.setAttribute("aria-expanded", open ? "true" : "false");
        toggle.setAttribute("aria-label", open ? "Menü schließen" : "Menü öffnen");
    });
})();

// Kapitelliste in der Bücherübersicht ein- und ausblenden.
(function () {
    "use strict";

    var buttons = document.querySelectorAll(".toggle-chapters");
    Array.prototype.forEach.call(buttons, function (button) {
        button.addEventListener("click", function () {
            var list = button.nextElementSibling;
            var open = list.hasAttribute("hidden");
            if (open) {
                list.removeAttribute("hidden");
            } else {
                list.setAttribute("hidden", "");
            }
            button.setAttribute("aria-expanded", open ? "true" : "false");
            button.textContent = open ? "Kapitel verbergen" : "Kapitel anzeigen";
        });
    });
})();
