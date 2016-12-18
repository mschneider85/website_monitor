document.addEventListener("turbolinks:load", function() {
  // check for url#index
  var element =  document.getElementById('urls');
  if (typeof(element) != 'undefined' && element != null) {
    bindDeleteHandler();
    updateStatus();
  }
});


var bindDeleteHandler;
bindDeleteHandler = function() {
  var deleteLinks = document.querySelectorAll('.remove');
  for(var i = 0; i < deleteLinks.length; i++) {
    var removeButton = deleteLinks[i];
    removeButton.onclick = function(e) {
      e.preventDefault();
      var that = this
      swal({
        title: "Are you sure?",
        text: that.getAttribute('data-confirm'),
        type: "warning",
        showCancelButton: true,
        confirmButtonColor: "#dd6b55",
        confirmButtonText: "Yes, remove it!",
        closeOnConfirm: false
      },
      function(){
        removeUrl(e);
        swal("Deleted!", that.getAttribute('data-success'), "success");
      });
    }
  }
}


var removeUrl;
removeUrl = function(e) {
  tr = e.target.closest('tr')
  id = tr.dataset.id
  var request = new XMLHttpRequest();
  request.open('DELETE', '/urls/' + id, true);
  request.onload = function() {
    if (request.status == 200) {
      tr.outerHTML = ''
    }
  }
  request.send();
}


var updateStatus;
updateStatus = function() {
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
};
