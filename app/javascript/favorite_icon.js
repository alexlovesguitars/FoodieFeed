document.addEventListener('DOMContentLoaded', function() {
  const favoriteIcons = document.querySelectorAll('.favorite-icon');

  favoriteIcons.forEach(icon => {
    icon.addEventListener('click', function() {
      this.classList.toggle('liked');

      // Attempt to find data-recipe-id in the closest parent.
      const recipeIdElement = this.closest('[data-recipe-id]');

      if (recipeIdElement) {
        const recipeId = recipeIdElement.dataset.recipeId;

        const liked = this.classList.contains('liked');

        fetch(`/recipes/${recipeId}/save_to_cookbook`, {
          method: 'POST',
          headers: {
            'Content-Type': 'application/json',
            'X-CSRF-Token': document.querySelector('meta[name="csrf-token"]').getAttribute('content')
          },
          body: JSON.stringify({ liked: liked })
        })
        .then(response => {
          if (!response.ok) {
            throw new Error('Network response was not ok');
          }
          console.log('Recipe saved to cookbook');
        })
        .catch(error => {
          console.error('There has been a problem with your fetch operation:', error);
        });
      } else {
        console.error('Recipe ID not found for this like button.');
      }
    });
  });
});
