document.addEventListener('DOMContentLoaded', function() {
  console.log('Clipboard handler initialized');
  document.querySelectorAll('[data-clipboard-text]').forEach(button => {
    console.log('Found clipboard button:', button);
    button.addEventListener('click', function() {
      const text = this.getAttribute('data-clipboard-text');
      console.log('Copying text:', text);
      navigator.clipboard.writeText(text).then(() => {
        console.log('Text copied successfully');
        const icon = this.querySelector('.bi-clipboard-fill');
        console.log('Found icon element:', icon);
        if (icon) {
          console.log('Changing to check icon');
          icon.classList.replace('bi-clipboard-fill', 'bi-clipboard-check-fill');
          setTimeout(() => {
            console.log('Changing back to clipboard icon');
            icon.classList.replace('bi-clipboard-check-fill', 'bi-clipboard-fill');
          }, 2000);
        } else {
          console.log('Icon element not found');
        }
      }).catch(err => {
        console.error('Failed to copy text:', err);
      });
    });
  });
}); 