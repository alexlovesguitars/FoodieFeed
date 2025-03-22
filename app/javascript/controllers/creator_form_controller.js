import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["checkbox", "fields"]

  connect() {
    console.log("Creator form controller connected")
    this.toggle()
  }

  toggle() {
    this.fieldsTarget.style.display = this.checkboxTarget.checked ? 'block' : 'none'
  }
}
