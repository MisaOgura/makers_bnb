$( document ).ready(function() {

  listAllSpaces();
  returnUserData();

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

  function listAllSpaces() {
    $.getJSON('http://localhost:4567/spaces/all', function(data) {
      var dates = dateRange(data);
      $('.all_spaces').append("<div class='space'></div>");
      $('.space').attr('id', data.id);
      $('.space').append("<p id='name'> 'Name: '</p>");
      $('.space').append("<li id='description'></li>");
      $('.space').append("<li id='price'></li>");
      $('.space').append("<li id='dates'></li>");
      $('#button').attr('value', data.id);
      $('#space_id').attr('value', data.id);

      $('#name').text('Name: ' + data.name);
      $('#description').text('Description: ' + data.description);
      $('#price').text('Price per night: £' + data.price);
      $('#dates').text('Available dates: ' +  dates );

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
      $('#name').text('Hey, ' + data.name);
    });
  }

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
