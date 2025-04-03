import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  connect() {
    this.stars = this.element.querySelectorAll(".star");
    this.input = document.getElementById("rating-input");

    this.stars.forEach(star => {
      star.addEventListener("mouseover", this.handleHover.bind(this));
      star.addEventListener("mouseout", this.resetStars.bind(this));
      star.addEventListener("click", this.handleClick.bind(this));
    });
  }

  handleHover(event) {
    const value = event.target.dataset.value;
    this.highlightStars(value);
  }

  resetStars() {
    this.highlightStars(this.input.value || 0);
  }

  handleClick(event) {
    const value = event.target.dataset.value;
    this.input.value = value;
    this.highlightStars(value);
  }

  highlightStars(value) {
    this.stars.forEach(star => {
      star.classList.toggle("text-warning", star.dataset.value <= value);
      star.classList.toggle("text-secondary", star.dataset.value > value);
    });
  }
}
