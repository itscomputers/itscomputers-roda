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
    button.textContent = button.textContent.replace("hide", "show");
  } else {
    button.textContent = button.textContent.replace("show", "hide");
  }
}

function getScrollValue() {
  return document.documentElement.scrollTop;
}

function setScrollValue(value) {
  if (value) {
    document.documentElement.scrollTop = value;
  }
}

function submitScrollValue() {
  const scrollValue = getScrollValue();
  const element = document.getElementById("scroll");
  element.value = scrollValue;
}

