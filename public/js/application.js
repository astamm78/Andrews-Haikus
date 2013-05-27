$(document).ready(function() {

  window.history.pushState("object or string", "Title", "/");

  paginationFix();

  // Permalink Popup
  $('.container').on("click", "a.perm", function(event) {
    event.preventDefault();
    $(this).closest('.haiku').find("#permalink").removeClass("hidden");
  });

  // Close Permalink Popup
  $(".container").on("click", "a.close", function(event) {
    event.preventDefault();
    $(this).closest("#permalink").addClass("hidden");
  });

  // Liked By Popup
  $(".container").on("click", "a.liked", function(event) {
    event.preventDefault();
    $(this).closest(".haiku").find("#liked_by").removeClass("hidden");
  });

  // Close Liked By Popup
  $(".container").on("click", "a.close", function(event) {
    event.preventDefault();
    $(this).closest("#liked_by").addClass("hidden");
  });

  // Home Page Link AJAX
  ajaxer("header nav ul", "h1 a");

  // Newest Haiku Link AJAX
  ajaxer("header nav ul", "a#newest");

  // List All Link AJAX
  ajaxer("header nav ul", "a#list_all");

  // Pagination Links AJAX
  ajaxer('#pager', 'a');

  // Sign In Link AJAX
  ajaxer("header nav ul", "a#sign_in");

});


function ajaxer(watched, link) {
  $(watched).on("click", link, function(event) {
    event.preventDefault();
    var url = $(this).attr("href");
    $.get(url, function(results) {
      pageSwap(results);
    });
  });
}

function scroller() {
  // Scroll to top
  $('html, body').animate({ scrollTop: 0 }, 0);
}

function paginationFix() {
  // Pagination Fix
  $('.next_page').text('Next');
  $('.previous_page').text('Previous');
}

function pageSwap(results) {
  var all = $(results).filter('.container').html();
  var page = $(results).filter('#pager').html();
  $('.container').html(all);
  $('#pager').html(page);
  paginationFix();
  scroller();
}