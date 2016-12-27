//= require jquery_ujs

$(document).ready(function() {
    $('#myModal').on('hidden.bs.modal', function () {
        $(this).removeData('bs.modal');
    });
    
    $('.modal_link').click(function(event){
        $('#myModal').modal({'remote':$(this).attr('href')+'?no_layout=true'});
        });
});
