// import * as bootstrap from 'bootstrap';


// document.addEventListener('DOMContentLoaded', () => {
//   document.addEventListener('click', event => {
//     console.log('Click event triggered');
//     if (event.target.classList.contains('favorite-icon')) {
//       console.log('Favorite icon clicked');
//       const recipeId = event.target.dataset.recipeId;
//       console.log('Recipe ID:', recipeId);

//       fetch(`/recipes/${recipeId}/favorites/toggle`, {
//         method: 'POST',
//         headers: {
//           'X-CSRF-Token': document.querySelector('meta[name="csrf-token"]').getAttribute('content')
//         }
//       });
//     }
//   });
// });
