#= require jquery
#= require jquery_ujs
#= require bootstrap.min
#= require_tree .

$ ->
  $('#overlay').fadeOut(300);
  $('a').click (e) ->
    $('#overlay').fadeIn(300);
