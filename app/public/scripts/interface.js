$( document ).ready(function() {

  listAllSpaces();
  listFilteredSpaces();

  function listFilteredSpaces(){
    $.getJSON('http://localhost:4567/spaces/filter', function(data) {
      var firstDate = moment(data.first_date).format(" D MMM 'YY");
      var lastDate = moment(data.last_date).format(" D MMM 'YY");

      $.getJSON('http://localhost:4567/spaces/all', function(data) {
        var dates = dateRange(data);
        console.log(dates)
        console.log(firstDate);
        console.log(lastDate);

        if (dates.includes(firstDate, lastDate)){
          $('.available_space').attr('id', data.id);
          $('#space_name').text('Name: ' + data.name);
          $('#description').text('Description: ' + data.description);
          $('#price').text('Price per night: £' + data.price);
          // $('#dates').text('Available dates: ' +  dates );
        } else {
          $('.available_space').text('Sorry. No available spaces between these dates.');
        }
      });
    });
  }

  function listAllSpaces() {
    $.getJSON('http://localhost:4567/spaces/all', function(data) {
      var dates = dateRange(data);
      $('.space').attr('id', data.id);
      $('#space_name').text('Name: ' + data.name);
      $('#description').text('Description: ' + data.description);
      $('#price').text('Price per night: £' + data.price);
      $('#dates').text('Available dates: ' +  dates );
    });
  }

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
      dateRange.push(moment(startDate).format(" D MMM 'YY"));
      startDate.setDate(startDate.getDate() + 1);
    }
    return dateRange;
  }
});
