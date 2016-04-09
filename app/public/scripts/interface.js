$( document ).ready(function() {

  listAllSpaces();
  returnUserData();
  listRequest();
  listFilteredSpaces();

  $( document ).ajaxComplete(function(){
    $('input[type=checkbox]').on('change', function(){
      console.log($('input[type=checkbox]:checked').length);
      if ($('input[type=checkbox]:checked').length <= 2) {
        $(this).attr('checked', 'yes');
        var first_date = $('#request_book').attr('value');
        var second_date = $(this).val() + ', ';
        $('#request_book').attr('value', first_date + second_date);
      }
      else {
          $(this).prop('checked', false);
          alert('You can only tick two boxes');
      }
    });
  });

  function listFilteredSpaces(){
    $.getJSON('http://localhost:4567/spaces/filter', function(data) {
      var firstDate = moment(data.first_date).format(" D MMM 'YY");
      var lastDate = moment(data.last_date).format(" D MMM 'YY");

      $.getJSON('http://localhost:4567/spaces/all', function(data) {
        var dates = dateRange(data);

        if (dates.includes(firstDate, lastDate)){
          $('.all_available_space').append("<div class='available_space'></div>");
          $('.available_space').attr('id', data.id);

          $('.available_space').append("<p id='name'> 'Name: '</p>");
          $('#name').text('Name: ' + data.name);

          $('.available_space').append("<li id='description'></li>");
          $('#description').text('Description: ' + data.description);

          $('.available_space').append("<li id='price'></li>");
          $('#price').text('Price per night: £' + data.price);
        }
        else {
          $('.available_space').text('Sorry. No available spaces between these dates.');
        }
      });
    });
  }

  function listAllSpaces() {
    $.getJSON('http://localhost:4567/spaces/all', function(data) {
      var dates = dateRange(data);
      $('.all_spaces').append("<div class='space'></div>");
      $('.space').attr('id', data.id);
      $('.user_greeting').append("<p id='user_name'> 'Name: '</p>");

      $('.space').append("<p id='name'> 'Name: '</p>");
      $('#name').text('Name: ' + data.name);

      $('.space').append("<li id='description'></li>");
      $('#description').text('Description: ' + data.description);

      $('.space').append("<li id='price'></li>");
      $('#price').text('Price per night: £' + data.price);

      if (data.available) {
        $('.space').append("<li id='dates'></li>");
        var startDate = moment(new Date(data.date[0])).format(" D MMM 'YY");
        var endDate   = moment(new Date(data.date[1])).format(" D MMM 'YY");
        $('#dates').text('Available dates: ' +  startDate + ' ~ ' + endDate);
      }

      $('.space').append("<form class='book' action='/space/book' method='post'><button id='button' name='book'>Book this space</button></form>");
      $('#button').attr('value', data.id);

      $('#space_id').attr('value', data.id);

      for (var i=0; i <= dates.length-1; i++){
        $('#available_dates').append("<input class='box' type='checkbox'><label class='available_dates'></label><br>");
        $('.available_dates').attr('class', 'available_dates'+i);
        $('.box').attr('class', 'box'+i);
        $('.available_dates'+i).attr('for', i);
        $('.box'+i).attr('id', i);
        date_string = dates[i].toString();
        $('.available_dates'+i).append(date_string);
        $('.box'+i).attr('value', date_string);
      }
    });
  }

  function returnUserData() {
    $.getJSON('http://localhost:4567/user/data', function(data) {
      $('.user').attr('id', data.id);
      $('#user_name').text('Hey, ' + data.name);
    });
  }

  function dateRange(data){
    var startDate = new Date(data.date[0]);
    var endDate   = new Date(data.date[1]);
    var dateRange = [];
    while (startDate <= endDate){
      dateRange.push(moment(startDate).format(" D MMM 'YY"));
      startDate.setDate(startDate.getDate() + 1);
    }
    return dateRange;
  }

  function listRequest() {
    $.getJSON('http://localhost:4567/requests/received', function(data) {
      $('.all_requests_received').append("<div class='request_received'></div>");
      $('.request_received').append("<li id='requested_name'></li>");
      $('.request_received').append("<li id='confirmation_status'></li>");
      $('.request_received').append("<li id='start_date'></li>");
      $('.request_received').append("<li id='end_date'></li>");
      $('#confirm_request_id').attr('value', data.id);
      $('#deny_request_id').attr('value', data.id);

      $('#requested_name').text("Space name: " + data.space_name);
      if ((!data.confirmation_status) && (!data.denied_status)) {
        $('#confirmation_status').text("Confirmation status: unconfirmed");
      }
      else if ((!data.confirmation_status) && (data.denied_status)) {
        $('#confirmation_status').text("Confirmation status: denied");
      }
      else if (data.confirmation_status) {
        $('#confirmation_status').text("Confirmation status: confirmed");
      }
      $('#start_date').text("Start date: " + data.date[0]);
      $('#end_date').text("End date: " + data.date[1]);
    });
  }

});
