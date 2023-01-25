// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
// import "@hotwired/turbo-rails"
// import "./controllers"
import * as bootstrap from "bootstrap"

// import "@hotwired/turbo-rails"
import Rails from "@rails/ujs"
import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"

import 'bootstrap/js/dist/dropdown'
import 'bootstrap/js/dist/collapse'
import './scripts/order_counter'

Rails.start()
Turbolinks.start()
ActiveStorage.start()
