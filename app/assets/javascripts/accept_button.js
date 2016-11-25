$(".accept-button").on("click", function(event) {
  $(this).parent().addClass('hidden');
  var accepted_message = $('<p>').html('<i class="fa fa-check-circle message-accepted-demand" aria-hidden="true"> demande acceptée </i>');
  $(this).parent().parent().append(accepted_message);
});
