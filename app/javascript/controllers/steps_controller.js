import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["step", "previousButton", "nextButton", "reviewButton"]

  connect() {
    this.currentStepIndex = 0
    this.showStep()
  }

  showStep() {
    // Show only the current step
    this.stepTargets.forEach((step, i) => {
      step.style.display = i === this.currentStepIndex ? "block" : "none"
    })

    // Hide "Previous" button on first step
    this.previousButtonTarget.classList.toggle("d-none", this.currentStepIndex === 0)

    // Hide "Next" button & show "Review" on last step
    const isLastStep = this.currentStepIndex === this.stepTargets.length - 1
    this.nextButtonTarget.classList.toggle("d-none", isLastStep)
    this.reviewButtonTarget.classList.toggle("d-none", !isLastStep)
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
