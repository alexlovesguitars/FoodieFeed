import { Controller } from "@hotwired/stimulus";

// Connects to data-controller="favorite"
export default class extends Controller {
  static targets = ["icon"];

  toggle(event) {
    event.preventDefault(); // Stop default link behavior

    const icon = this.iconTarget; // Get the heart icon
    const method = this.element.dataset.turboMethod || "post"; // Check if it's a like or unlike request

    // Toggle classes before sending request (Optimistic UI update)
    icon.classList.toggle("fa-regular");
    icon.classList.toggle("fa-solid");

    // Send the request to the Rails server
    fetch(this.element.href, {
      method: method.toUpperCase(), // Ensures method is POST or DELETE
      headers: {
        "X-Requested-With": "XMLHttpRequest",
        "X-CSRF-Token": document.querySelector("meta[name='csrf-token']").content // Protects against CSRF attacks
      },
    }).catch(() => {
      // If the request fails, revert the UI change
      icon.classList.toggle("fa-regular");
      icon.classList.toggle("fa-solid");
    });
  }
}
