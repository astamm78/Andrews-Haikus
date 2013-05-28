$(document).ready(function() {

  // NEED SIGN IN AND CREATE ACCOUNT POST AJAX

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

  // Sign Up Link AJAX
  ajaxer(".container", "a#signup");

  // Log Out Link AJAX
  ajaxer("#session", "a#logout");

  // Sign In Form Submit AJAX
  $(".container").on("submit", "form#submit_sign_in", function(event) {
    event.preventDefault();
    var data = $(this).serialize();
    $.post("/verify", data, function(results) {
      var header    = $(results).filter("header");
      var pager     = $(results).filter("#pager");
      var new_data  = $(results).filter(".container");
      var session   = $(results).filter("#session");
      $(".container").html(new_data);
      $("header").html(header);
      $("#pager").html(pager);
      $("#session").html(session);
    });
  });

  // Create Account Form Submit AJAX
  $(".container").on("submit", "form#submit_new_account", function(event) {
    event.preventDefault();
    var data = $(this).serialize();
    $.post("/create_account", data, function(results) {
      var header    = $(results).filter("header");
      var pager     = $(results).filter("#pager");
      var new_data  = $(results).filter(".container");
      var session   = $(results).filter("#session");
      $(".container").html(new_data);
      $("header").html(header);
      $("#pager").html(pager);
      $("#session").html(session);
    });
  });

});

function openPopup(watched, link, parent, unhide) {
  $(watched).on("click", link, function(event) {
    event.preventDefault();
    $(this).closest(parent).find(unhide).removeClass("hidden");
  });
}

function closePopup(watched, link, hide) {
  $(watched).on("click", link, function(event) {
    event.preventDefault();
    $(this).closest(hide).addClass("hidden");
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
  var session   = $(results).filter("#session");
  var header    = $(results).filter("header");
  $('.container').html(all);
  $("header").html(header);
  $('#pager').html(page);
  $("#session").html(session);
  paginationFix();
  scroller();
}