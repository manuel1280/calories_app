// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require rails-ujs
//= require jquery
//= require raphael
//= require morris
//= require activestorage
//= require turbolinks
//= require_tree .

$( document ).ready(function() {

new Morris.Line({
    // ID of the element in which to draw the chart.
    element: 'calories_progress',
    // Chart data records -- each entry in this array corresponds to a point on
    // the chart.
    data: $('#calories_progress').data('calories'),
    // The name of the data record attribute that contains x-values.
    xkey: 'created_at',
    // A list of names of data record attributes that contain y-values.
    ykeys: ['value'],
    // Labels for the ykeys -- will be displayed when you hover over the
    // chart.
    labels: ['Calories']
  });
});
