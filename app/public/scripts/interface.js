$( document ).ready(function() {

  function listAllSpaces() {
    $.getJSON('http://localhost:4567/spaces/all', function(data) {
      $('.space').attr('id', data.id);
      $('#name').text('after AJAX');
      $('#name').text('Name: ' + data.name);
      $('#description').text('Description: ' + data.description);
      $('#price').text('Price per night: £' + data.price);
      // var dates = dateRange(data);
      // console.log(dates);
      $('#dates').text('Available dates: ' + data.date[0] + ' to ' + data.date[1] );
    });
  }

  listAllSpaces();

  function dateRange(data){
    var startDate = new Date(data.date[0]);
    var endDate   = new Date(data.date[1]);
    var dateRange = [startDate];
    var currentDate = startDate;
    while (startDate <= endDate)
      console.log(currentDate);
      currentDate.setDate(currentDate.getDate() + 1);
      console.log(currentDate);
      dateRange.push(currentDate);
      console.log(dateRange);

    return dateRange;
  }
});
