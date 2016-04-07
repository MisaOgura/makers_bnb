$( document ).ready(function() {

  // listAllSpaces();
  listFilteredSpaces();

  function listFilteredSpaces(){
    $.getJSON('http://localhost:4567/spaces/filter', function(filter) {
      console.log("data  = "+data[0]);
      var firstDate = filter.first_date;
      var lastDate = filter.last_date;
      // listAllSpaces(firstDate, lastDate)
      $.getJSON('http://localhost:4567/spaces/all', function(data) {
        var dates = dateRange(data);
        if (dates.includes(firstDate, lastDate)){
          $('#space_name').text(data.name);
        }
      });
    });
  }

  function listAllSpaces() {
    $.getJSON('http://localhost:4567/spaces/all', function(data) {
      var dates = dateRange(data);
      $('.space').attr('id', data.id);
      $('#name').text('Name: ' + data.name);
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
      dateRange.push(moment(startDate).format("MM/DD/YY"));
      startDate.setDate(startDate.getDate() + 1);
    }
    return dateRange;
  }
});
