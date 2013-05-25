$(document).ready(function() {

  // Home Page Link AJAX
  $("header nav ul").on("click", "h1 a", function(event) {
    event.preventDefault();
    $.get("/", function(results) {
      var home = $(results).filter('.container').html();
      $('.container').html(home);
      $('#pager').html('');
    });
  });

  // Newst Haiku Link AJAX
  $("header nav ul").on("click", "a#newest", function(event) {
    event.preventDefault();
    var url = $("a#newest").attr("href");
    $.get(url, function(results) {
      var new_haiku = $(results).filter('.container').html();
      $('.container').html(new_haiku);
      $('#pager').html('');
    });
  });

  // List All Link AJAX
  $("header nav ul").on("click", "a#list_all", function(event) {
    event.preventDefault();
    $.get("/all", function(results) {
      var all = $(results).filter('.container').html();
      var page = $(results).filter('#pager').html();
      $('.container').html(all);
      $('#pager').html(page);
      // Pagination Fix
      $('.next_page').text('Next');
      $('.previous_page').text('Previous');
    });
  });

  // Pagination Links AJAX
  $('#pager').on("click", "a", function(event) {
    event.preventDefault();
    var url = $(this).attr("href");
    $.get(url, function(results) {
      var all = $(results).filter('.container').html();
      var page = $(results).filter('#pager').html();
      $('.container').html(all);
      $('#pager').html(page);
      // Pagination Fix
      $('.next_page').text('Next');
      $('.previous_page').text('Previous');
      // Scroll to top
      $('html, body').animate({ scrollTop: 0 }, 0);
    });
  });

  // Like Links AJAX
  $('.container').on("click", "a.like", function(event) {
    event.preventDefault();
    var url = $(this).attr("href");
    $.get(url, function(results) {
      var like = $(results).filter('.container').html();
      var page = $(results).filter('#pager').html();
      $('.container').html(like);
      $('#pager').html(page);
    });
  });

});