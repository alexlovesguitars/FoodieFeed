import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["step"]

  connect() {
    this.currentStepIndex = 0
    this.showStep()
  }

  showStep() {
    this.stepTargets.forEach((step, i) => {
      step.style.display = i === this.currentStepIndex ? "block" : "none"
    })
  }

  nextStep() {
    if (this.currentStepIndex < this.stepTargets.length - 1) {
      this.currentStepIndex++
      this.showStep()
    }
  }

  previousStep() {
    if (this.currentStepIndex > 0) {
      this.currentStepIndex--
      this.showStep()
    }
  }
}
