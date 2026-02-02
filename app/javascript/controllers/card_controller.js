import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["content"]

  connect() {
    this.hide()
    this.handleTurboRender = this.handleTurboRender.bind(this)
    document.addEventListener("turbo:render", this.handleTurboRender)
  }

  disconnect() {
    document.removeEventListener("turbo:render", this.handleTurboRender)
    this.hide()
  }

  handleTurboRender() {
    this.hide()
  }

  show() {
    this.contentTarget.classList.add("show")
  }

  hide() {
    this.contentTarget.classList.remove("show")
  }
}
