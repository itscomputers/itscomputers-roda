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

function setBreadcrumbListeners() {
  document.onkeydown = function(e) {
    let element;
    switch (e.keyCode) {
      case 37:
        element = document.getElementById("prev-breadcrumb");
        if (element) { element.click(); }
        break;
      case 39:
        element = document.getElementById("next-breadcrumb");
        if (element) { element.click(); }
        break;
    }
  }
}

function numberTheoryOnLoad(scrollValue) {
  setScrollValue(scrollValue);
  setBreadcrumbListeners();
}

