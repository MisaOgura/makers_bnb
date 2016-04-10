$( document ).ready(function() {

  listRequest();
  listFilteredSpaces();

  function listFilteredSpaces(){
    $.getJSON('http://localhost:4567/spaces/filter', function(data) {
      var firstDate = moment(data.first_date).format(" D MMM 'YY");
      var lastDate = moment(data.last_date).format(" D MMM 'YY");

      $.getJSON('http://localhost:4567/spaces/all', function(data) {
        var dates = dateRange(data);

        $('.all_filtered_space').append("<div class='filtered_space'></div>");

        if (dates.includes(firstDate, lastDate)){
          $('.filtered_space').attr('id', data.id);

          $('.filtered_space').append("<h4 id='name'> 'Name: '</h4>");
          $('#name').text('Name: ' + data.name);

          $('.filtered_space').append("<li id='description'></li>");
          $('#description').text('Description: ' + data.description);

          $('.filtered_space').append("<li id='price'></li>");
          $('#price').text('Price per night: £' + data.price);

          $('.filtered_space').append("<div id='dates'></div>");
          for (var i=0; i <= dates.length-1; i++){
            $('#dates').append("<input class='box' type='checkbox'><label class='available_dates'></label><br>");
            $('.available_dates').attr('class', 'available_dates'+i);
            $('.box').attr('class', 'box'+i);
            $('.available_dates'+i).attr('for', i);
            $('.box'+i).attr('id', i);
            date_string = dates[i].toString();
            $('.available_dates'+i).append(date_string);
            $('.box'+i).attr('value', date_string);
          }

        }
        else {
          $('.filtered_space').text('Sorry. No available spaces between these dates.');
        }
      });
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
