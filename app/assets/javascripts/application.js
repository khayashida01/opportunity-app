// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require twitter/bootstrap
//= require turbolinks
//= require Chart.min
//= require_tree .
//= require underscore
//= require gmaps/google
//= require moment
//= require fullcalendar
//= require bootstrap-datetimepicker
//= require nested_form_fields


var initialize_calendar;
initialize_calendar = function() {
    $('#calendar').each(function(){
        var calendar = $(this)
        calendar.fullCalendar({
            header: {
                left: 'prev,next today',
                center: 'title',
                right: 'month,agendaWeek,agendaDay'
            },
            selectable: true,
            selectHelpter: true,
            editable: true,
            eventLimit: true,
            events: '/calendar.json'
        })
    })
};
var update_datepicker;
update_datepicker = function () {
    $('.mydatepicker').datetimepicker(
        {
            format: 'YYYY-MM-DD',
            icons: {
              previous: "fa fa-arrow-left",
              next: "fa fa-arrow-right"
            }
        }
    );
    $('.datetimepicker').datetimepicker(
        {
            format: 'YYYY-MM-DD hh:mm A',
            icons: {
              time: "fa fa-clock-o",
              date: "fa fa-calendar",
              up: "fa fa-arrow-up",
              down: "fa fa-arrow-down",
              previous: "fa fa-arrow-left",
              next: "fa fa-arrow-right"
            },
            sideBySide: true
        }
    );
}

$(document).on('turbolinks:load', function(){
  update_datepicker();
  initialize_calendar();
}).on('dp.error', function(e) {
  $(e.target).val('');
});

$(document).on('fields_added.nested_form_fields', function(event){
    update_datepicker();
});
