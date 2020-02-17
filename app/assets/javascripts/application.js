//= require jquery3
//= require popper
//= require bootstrap
//= require moment
//= require fullcalendar
//= require fullcalendar/lang/ja
//= require_tree .

$(document).ready(function(){
    $('#calendar').fullCalendar({
    });
});

$(function () {
    function eventCalendar() {
        return $('#calendar').fullCalendar({});
    };
    function clearCalendar() {
        $('#calendar').html('');
    };
});