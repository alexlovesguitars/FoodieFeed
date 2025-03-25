import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="steps"
export default class extends Controller {
  static targets = ["step"];

  connect() {
    console.log("Stimulus controller connected!");
    this.currentStepIndex = 0; // Start at Step 1
    this.showStep(this.currentStepIndex);
  }

  showStep(index) {
    this.stepTargets.forEach((step, i) => {
      step.classList.toggle("hidden", i !== index);
    });
  }

  nextStep() {
    if (this.currentStepIndex < this.stepTargets.length - 1) {
      this.currentStepIndex++;
      this.showStep(this.currentStepIndex);
    }
  }

  previousStep() {
    if (this.currentStepIndex > 0) {
      this.currentStepIndex--;
      this.showStep(this.currentStepIndex);
    }
  }
}
