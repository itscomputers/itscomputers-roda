window.MathJax = {
  tex: {
    inlineMath: [['$', '$']]
  },
};

function toggleElement(id, className) {
  document.getElementById(id).classList.toggle(className);
}

function showHide(id) {
  toggleElement(id, 'suppressed');
}

function showHideSolution(id) {
  const element = document.getElementById(id);
  const button = document.getElementById(`${id}-button`);
  if (element.classList.toggle('suppressed')) {
    button.textContent = 'show solution';
  } else {
    button.textContent = 'hide solution';
  }
}

