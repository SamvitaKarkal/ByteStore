# Pin npm packages by running ./bin/importmap

pin "application", to: "application.js"
pin "@hotwired/turbo-rails", to: "turbo.min.js"
pin "@hotwired/stimulus", to: "stimulus.min.js"
pin "@hotwired/stimulus-loading", to: "stimulus-loading.js"
pin "chart.js", to: "https://cdn.jsdelivr.net/npm/chart.js@4.2.1/dist/chart.min.js"
pin "@kurkle/color", to: "https://cdn.jsdelivr.net/npm/@kurkle/color@0.3.2/dist/color.esm.js"
pin_all_from "app/javascript/controllers", under: "controllers"
