document.addEventListener("turbolinks:load", function() {

  var element =  document.getElementById('urls');
  if (typeof(element) != 'undefined' && element != null) {

    var elements = document.querySelectorAll('.url');
    Array.prototype.forEach.call(elements, function(el, i){
      setTimeout(function(){

        badge = el.querySelectorAll('.status')[0];
        badge.outerHTML = '<span class="status badge badge-warning badge-icon"><i class="fa fa-clock-o" aria-hidden="true"></i><span>Pending</span></span>'

        var request = new XMLHttpRequest();
        request.open('GET', '/urls/' + el.dataset.id + '/get_status', true);

        request.onload = function() {
          if (request.status >= 200 && request.status < 400) {
            badge = el.querySelectorAll('.status')[0];
            response_time = el.querySelectorAll('.response-time')[0];

            var resp = JSON.parse(request.responseText);

            if (resp.online) {
              badge.outerHTML = '<span class="status badge badge-success badge-icon"><i class="fa fa-check" aria-hidden="true"></i><span>Online</span></span>'
            }
            else {
              badge.outerHTML = '<span class="status badge badge-danger badge-icon"><i class="fa fa-times" aria-hidden="true"></i><span>Offline</span></span>'
            }
            response_time.textContent = resp.duration + ' ms';
          }
        };
        request.send();
      }
      , 100 + (100 * i));
    });
  }
});
