import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["content"]

  show() {
    // Add the show class when modal opens
    this.contentTarget.classList.add("show")
  }

  hide() {
    // Remove the show class when modal closes
    this.contentTarget.classList.remove("show")
  }
}
