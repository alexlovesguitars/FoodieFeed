import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ["icon"];

  addBounce() {
    this.iconTarget.classList.add("fa-bounce");
  }

  removeBounce() {
    this.iconTarget.classList.remove("fa-bounce");
  }

  openModal(event) {
    // Optional: Ensure modal opens when clicked
    event.preventDefault();
    let modal = new bootstrap.Modal(document.getElementById("shareModal"));
    modal.show();
  }
}
