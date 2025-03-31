import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["step", "previousButton", "nextButton"]

  connect() {
    this.currentStepIndex = 0
    this.showStep()
  }

  showStep() {
    this.stepTargets.forEach((step, i) => {
      step.style.display = i === this.currentStepIndex ? "block" : "none"
    })
    if (this.hasPreviousButtonTarget) {
     this.previousButtonTarget.style.display =
      this.currentStepIndex === 0 ? "none" : "inline-block"
    }

    if (this.hasNextButtonTarget) {
      this.nextButtonTarget.style.display =
      this.currentStepIndex === this.stepTargets.length - 1
        ? "none"
        : "inline-block"
    }
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
