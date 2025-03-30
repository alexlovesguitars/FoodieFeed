import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["content"]

  connect() {
    // Ensure modal is hidden when the page is loaded
    this.hide();
  }

  show() {
    this.contentTarget.classList.add("show")
  }

  hide() {
    this.contentTarget.classList.remove("show")
  }

  disconnect() {
    // Hide modal when navigating away
    this.hide();
  }
}
