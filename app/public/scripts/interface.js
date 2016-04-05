$( document ).ready(function() {

  listAllSpaces();

  function listAllSpaces() {
    $.get('http://localhost:4567/spaces/all', function(allspaces) {
      $('#name').text('Name: ' + allspaces);
    });
  }
});
