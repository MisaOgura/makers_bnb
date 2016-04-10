$( document ).ready(function() {

  listFilteredSpaces();

  function listFilteredSpaces(){
    $.getJSON('http://localhost:4567/spaces/filter', function(data) {
      var firstDate = moment(data.first_date).format(" D MMM 'YY");
      var lastDate = moment(data.last_date).format(" D MMM 'YY");

      $.getJSON('http://localhost:4567/spaces/all', function(data) {
        var dates = dateRange(data);
        $('.all_filtered_space').append("<div class='filtered_space'></div>");

        if (dates.includes(firstDate, lastDate)){
          $('#space_id').attr('value', data.id);
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
});
