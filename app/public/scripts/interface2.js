$( document ).ready(function() {

  function listAllSpaces() {
    $.getJSON('http://localhost:4567/spaces/all', function(data) {
      $('.all_spaces').append("<div class='space'></div>");
      $('.space').attr('id', data.id);
      $('.space').append("<p id='name'> 'Name: '</p>");
      $('.space').append("<li id='description'></li>");
      $('.space').append("<li id='price'></li>");
      $('.space').append("<li id='dates'></li>");
      $('.space').append("<form class='toggle' action='/toggle' method='post'>");
      $('.toggle').attr('id', data.id);

      $('#name').text('Name: ' + data.name);
      $('#description').text('Description: ' + data.description);
      $('#price').text('Price per night: £' + data.price);
      var dates = dateRange(data);
      $('#dates').text('Available dates: ' +  dates );
      $('.toggle').append("<button>Book this space</button>");
    });
  }

  listAllSpaces();

  function returnUserData() {
    $.getJSON('http://localhost:4567/user/data', function(data) {
      $('.user').attr('id', data.id);
      $('#name').text('Hey, ' + data.name);
    });
  }

  returnUserData();

  function dateRange(data){
    var startDate = new Date(data.date[0]);
    var endDate   = new Date(data.date[1]);
    var dateRange = [];
    while (startDate <= endDate){
      dateRange.push(moment(startDate).format(" MMM Do 'YY"));
      startDate.setDate(startDate.getDate() + 1);
    }
    return dateRange;
  }
});
