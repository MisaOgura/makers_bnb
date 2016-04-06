$( document ).ready(function() {

  listAllSpaces();

  function listAllSpaces() {
    $.getJSON('http://localhost:4567/spaces/all', function(data) {

      $('.space').attr('id', data.id);
      $('#name').text('Name: ' + data.name);
      $('#description').text('Description: ' + data.description);
      $('#price').text('Price: ' + data.price);
    });
  }
});
