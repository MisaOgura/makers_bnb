$( document ).ready(function() {

  listRequest();

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
