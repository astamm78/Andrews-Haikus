$(document).ready(function() {

  window.history.pushState("object or string", "Title", "/");

  paginationFix();

  // Permalink Popup
  openPopup('.container', 'a.perm', '.haiku', '#permalink');

  // Close Permalink Popup
  closePopup('.container', 'a.close', '#permalink');

  // Liked By Popup
  openPopup('.container', 'a.liked', '.haiku', '#liked_by');

  // Close Liked By Popup
  closePopup('.container', 'a.close', '#liked_by');

  // Home Page Link AJAX
  ajaxer("header nav", "h1 a");

  // Newest Haiku Link AJAX
  ajaxer("header nav ul", "a#newest");

  // List All Link AJAX
  ajaxer("header nav ul", "a#list_all");

  // Pagination Links AJAX
  ajaxer('#pager', 'a');

  // Sign In Link AJAX
  ajaxer("header nav ul", "a.sign_in");
  ajaxer(".container", "a.sign_in");

});

function openPopup(watched, link, parent, unhide) {
  $(watched).on("click", link, function(event) {
    event.preventDefault();
    $(this).closest(parent).find(unhide).removeClass("hidden");
  });
}

function closePopup(watched, link, unhide) {
  $(watched).on("click", link, function(event) {
    event.preventDefault();
    $(this).closest(unhide).addClass("hidden");
  });
}

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
  $('html, body').animate({ scrollTop: 0 }, 0);
}

function paginationFix() {
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