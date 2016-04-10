$( document ).ready(function() {

  listDates();
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

  function listDates() {
    $.getJSON('http://localhost:4567/spaces/all', function(data) {
      var dates = dateRange(data);
      $('#space_id').attr('value', data.id);
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

  function returnUserData(data) {
    $.getJSON('http://localhost:4567/user/data', function(data) {
      $('.user').attr('id', data.id);
      $('#user_name').text('Hey, ' + data.name);
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
