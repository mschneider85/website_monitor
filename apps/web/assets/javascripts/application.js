document.addEventListener("turbolinks:load", function() {
  // check for url#index
  if (document.getElementsByClassName('web views urls index').length) {
    bindDeleteHandler();
    updateStatus();
  }
  // check for home
  if (document.getElementsByClassName('web views home').length) {
    input = document.getElementById('uuid-input')
    inputMask(input, {
      mask: 'hhhhhhhh-hhhh-hhhh-hhhh-hhhhhhhhhhhh',
      placeholder: input.getAttribute('placeholder'),
      clearOnFail: true,
      clearOnNoChange: true,
      selectOnFocus: true
    });

    document.getElementById('submit-uuid').addEventListener('click', function() {
      submitUuid();
    }, false);

    document.getElementById('uuid-input').addEventListener('keydown', function (event) {
      if (event.which == 13) {
        event.preventDefault();
        submitUuid();
      }
    });
  }
});

var submitUuid;
submitUuid = function() {
  var input = document.getElementById('uuid-input')
  var params = 'token=' + input.value;
  var request = new XMLHttpRequest();
  request.open('POST', '/home/authenticate', true);
  request.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded; charset=UTF-8');
  request.onload = function() {
    if (request.status >= 200 && request.status < 400) {
      location.reload();
    } else {
      input.value = '';
    }
  };
  if (input.value.length) {
    request.send(params);
  }
}


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
        confirmButtonColor: "#e74c3c",
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
  token = e.target.closest('a').dataset.csrf
  tr = e.target.closest('tr')
  has_siblings = tr.parentNode.children.length > 1
  id = tr.dataset.id
  var request = new XMLHttpRequest();
  request.open('DELETE', '/urls/' + id, true);
  request.onload = function() {
    if (request.status == 200) {
      if (has_siblings) {
        tr.outerHTML = ''
      } else {
        tr.innerHTML = '<td colspan="3"><p class="placeholder">There are no urls yet.</p></td>'
      }
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
