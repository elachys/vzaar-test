# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
$ = jQuery
callback = (data) ->
    $('#status').show();
    str = '<br /><b>' + data.d + '</b> <br />' + data.words.length + " anagrams found for '" + $('#search_input').val() + "' in " + data.time + 'ms';
    if(data.words.length > 0)
        str = str + '<br />> ';
        $(data.words).each  (i, word) ->
            str = str + word.word + ', ';
        str = str.substr(0, str.length-2);
    $('#status').prepend(str + '<br /><br />');

$(document).ready ->
    $('#status').hide();
    $('#search').submit ->
        $.get '/words/', {word:$('#search_input').val()}, callback, 'json'
        return false