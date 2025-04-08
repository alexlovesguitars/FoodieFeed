import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["wrapper"]

  connect() {
    this.currentIndex = 0
    this.totalSlides = this.wrapperTarget.children.length
  }

  next() {
    this.currentIndex = (this.currentIndex + 1) % this.totalSlides
    this.updateSlide()
  }

  prev() {
    this.currentIndex = (this.currentIndex - 1 + this.totalSlides) % this.totalSlides
    this.updateSlide()
  }

  updateSlide() {
    const offset = -this.currentIndex * 100
    this.wrapperTarget.style.transform = `translateX(${offset}%)`
  }
}
