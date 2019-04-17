var display = document.getElementById('transform-origin');
var origin = document.querySelector('.origin');
var style = document.documentElement.style;

var autopilot;
autopilot = setTimeout(() => {
  change();
  autopilot = setInterval(change, 3000)
}, 1500);

function change(ex, ey) {
  var x = ex || (Math.random());
  var y = ey || (Math.random());
  style.setProperty('--x', x);
  style.setProperty('--y', y);
  display.textContent = Math.round(x * 100) + '% ' + Math.round(y * 100) + '%';
}

document.documentElement.addEventListener('mouseup', onPress);
document.documentElement.addEventListener('touchend', onPress);
var width = window.innerWidth;
var height = window.innerHeight;
var box = origin.getBoundingClientRect();
var side = box.right - box.left;

function onPress(e) {
  clearTimeout(autopilot);
  clearInterval(autopilot);
  
  var x = e.clientX || e.changedTouches[0].clientX;
  var y = e.clientY || e.changedTouches[0].clientY;
  
  if (window.innerWidth !== width || window.innerHeight !== height) {
    box = origin.getBoundingClientRect();
    width = window.innerWidth;
    height = window.innerHeight;
    side = box.right - box.left;
  }
  
  var ex = (x - box.left) / side;
  var ey = (y - box.top) / side;
  
  change(ex,ey);
}
