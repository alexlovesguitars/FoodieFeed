import * as bootstrap from 'bootstrap';

document.addEventListener('DOMContentLoaded', () => {
  const favoriteIcons = document.querySelectorAll('.favorite-icon');

  favoriteIcons.forEach(icon => {
    icon.addEventListener('click', function() {
      this.classList.toggle('active');
      // Here you would likely make an AJAX call to your Rails backend
      // to save or remove the recipe from the user's favorites.
      console.log('Heart icon clicked for recipe ID:', this.dataset.recipeId);
    });
  });
});
