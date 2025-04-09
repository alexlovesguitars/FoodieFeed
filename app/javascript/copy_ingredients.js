document.addEventListener('turbo:load', function () {
  const copyButton = document.getElementById('copy-ingredients-btn');
  if (!copyButton) return;

  copyButton.addEventListener('click', function (event) {
    event.preventDefault();

    const ingredientsElement = document.getElementById('ingredients-to-copy');
    if (!ingredientsElement) return;

    const ingredientsText = ingredientsElement.innerText.trim();

    navigator.clipboard.writeText(ingredientsText)
      .then(() => {
        injectFlash("Ingredients copied!", "success");
      })
      .catch((err) => {
        console.error("Error copying text: ", err);
        injectFlash("Failed to copy ingredients.", "danger");
      });
  });

  function injectFlash(message, type = "info") {
    const flashContainer = document.getElementById("flash-container");
    if (!flashContainer) return;

    flashContainer.innerHTML = `
      <div class="alert alert-${type} fade show" role="alert" id="flash-message">
        ${message}
      </div>
    `;
  }
  setTimeout(() => {
    const flash = document.getElementById('flash-message');
    if (flash) {
      flash.classList.remove('show');
      flash.classList.add('fade');
      setTimeout(() => flash.remove(), 500); // Clean up after fade
    }
  }, 3000);
});
