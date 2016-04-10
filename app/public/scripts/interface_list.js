$( document ).ready(function() {

returnUserData();
listAllSpaces();

  function listAllSpaces() {
    $.getJSON('http://localhost:4567/spaces/all', function(data) {
      var dates = dateRange(data);
      $('.all_spaces').append("<div class='space'></div>");
      $('.space').attr('id', data.id);
      $('.user_greeting').append("<p id='user_name'> 'Name: '</p>");
      $('.space').append("<h4 id='name'> 'Name: '</h4>");
      $('#name').text('Name: ' + data.name);
      $('.space').append("<li id='description'></li>");
      $('#description').text('Description: ' + data.description);
      $('.space').append("<li id='price'></li>");
      $('#price').text('Price per night: £' + data.price);
      if (data.available) {
        $('.space').append("<li id='dates'></li>");
        var startDate = moment(new Date(data.date[0])).format("D MMM 'YY");
        var endDate   = moment(new Date(data.date[1])).format("D MMM 'YY");
        $('#dates').text('Available dates: ' +  startDate + ' ~ ' + endDate);
        $('.space').append("<br><form class='book' action='/space/book' method='post'><button id='button' name='book'>Book this space</button></form>");
        $('#button').attr('value', data.id);
      }
    });
  }

  function returnUserData() {
    $.getJSON('http://localhost:4567/user/data', function(data) {
      $('.user').attr('id', data.id);
      $('.user').text('Hey, ' + data.name);
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
});
