import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["source"]

  copy() {
    const text = this.sourceTarget.innerText.trim();

    navigator.clipboard.writeText(text)
      .then(() => {
        this.showFlash("Ingredients copied to clipboard!", "success");
      })
      .catch((err) => {
        console.error("Clipboard copy failed:", err);
        this.showFlash("Failed to copy ingredients.", "danger");
      });
  }

  showFlash(message, type = "success") {
    const container = document.getElementById("flash-container");
    if (!container) return;

    const alert = document.createElement("div");
    alert.className = `alert alert-${type} alert-dismissible fade show`;
    alert.setAttribute("role", "alert");
    alert.innerHTML = `${message}`;

    container.appendChild(alert);

    // Optional: Auto-dismiss after 3 seconds
    setTimeout(() => {
      alert.classList.remove("show");
      alert.classList.add("fade");
      alert.remove();
    }, 3000);
  }

}
