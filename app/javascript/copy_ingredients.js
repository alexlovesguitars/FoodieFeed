document.addEventListener('turbo:load', function() {
  const copyButton = document.getElementById('copy-ingredients-btn');

  if (!copyButton) return;

  // Remove existing listener if any
  copyButton.replaceWith(copyButton.cloneNode(true));

  const newCopyButton = document.getElementById('copy-ingredients-btn');

  newCopyButton.addEventListener('click', function(event) {
    event.preventDefault();

    const ingredientsElement = document.getElementById('ingredients-to-copy');
    if (!ingredientsElement) return;

    const ingredientsText = ingredientsElement.innerText.trim();

    navigator.clipboard.writeText(ingredientsText)
      .then(() => {
        alert("Copied the text!");
      })
      .catch((err) => {
        console.error("Error copying text: ", err);
        alert("Failed to copy text.");
      });
  });
});
