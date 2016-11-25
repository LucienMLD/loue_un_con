$(document).ready(function() {
  $('.tab').on("click", function(event) {
    $('.tab').removeClass('active');
    $(this).addClass('active');
    $('.dashboard-content').addClass('hidden');
    $($(this).data("target")).removeClass('hidden');
  })
});
