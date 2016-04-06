$( document ).ready(function() {

  function listAllSpaces() {
    $.getJSON('http://localhost:4567/spaces/all', function(data) {
      $('.space').attr('id', data.id);
      $('#name').text('after AJAX');
      $('#name').text('Name: ' + data.name);
      $('#description').text('Description: ' + data.description);
      $('#price').text('Price per night: £' + data.price);
      var dates = dateRange(data);
      $('#dates').text('Available dates: ' +  dates );
    });
  }

  listAllSpaces();

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
