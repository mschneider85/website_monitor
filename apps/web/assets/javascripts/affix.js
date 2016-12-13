window.onscroll = toggleAffix;

function toggleAffix() {
  var nav = document.getElementsByTagName("nav")[0];
  if (window.pageYOffset > 50) {
		nav.classList.add("nav-affix");
  } else {
		nav.classList.remove("nav-affix");
  }
}
