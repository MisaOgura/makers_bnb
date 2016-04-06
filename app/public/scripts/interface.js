$( document ).ready(function() {

  function listAllSpaces() {
    $.getJSON('http://localhost:4567/spaces/all', function(data) {
      $('.space').attr('id', data.id);
      $('#name').text('after AJAX');
      $('#name').text('Name: ' + data.name);
      $('#description').text('Description: ' + data.description);
      $('#price').text('Price per night: £' + data.price);
    });
  }

  listAllSpaces();

});
