import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  connect() {
    this.fadeOut();
  }

  fadeOut() {
    setTimeout(() => {
      this.element.style.transition = "opacity 1.5s";
      this.element.style.opacity = "0";
      setTimeout(() => this.element.remove(), 1500); // Remove after fade-out
    }, 3000); // Wait 3 seconds before starting fade-out
  }
}
