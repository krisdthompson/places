document.addEventListener('DOMContentLoaded', function() {
  document.querySelectorAll('[data-clipboard]').forEach(button => {
    button.addEventListener('click', function() {
      const text = this.getAttribute('data-clipboard');
      navigator.clipboard.writeText(text).then(() => {
        const icon = this.querySelector('.bi-clipboard');
        icon.classList.replace('bi-clipboard', 'bi-clipboard-check');
        setTimeout(() => {
          icon.classList.replace('bi-clipboard-check', 'bi-clipboard');
        }, 2000);
      });
    });
  });
}); 