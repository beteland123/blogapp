// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"

document.addEventListener('turbo:load', function() {
    const showAllBtn = document.getElementById('show-all-btn');
    const remainingPosts = document.getElementById('remaining-posts');
  
    showAllBtn.addEventListener('click', function() {
      remainingPosts.classList.toggle('hidden');
      showAllBtn.classList.toggle('hidden');
    });
  });
