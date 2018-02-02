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
//= require turbolinks
//= require_tree .
//= require jquery
//= require jquery3
//= require_tree .

$(document).ready(function(){
    $("#user_header.user_bar").hover(function(){
        alert("Hey! Just for fun");
    },
    function(){
        alert("Code Well!");
    }); 
});

$(document).ready(function(){
    $("#sign_up_form").submit(function(event){
        event.preventDefault()
        $.ajax({
            url: '/users',
            method: 'post',
            data: $(this).serialize,
            success: function(response){
                $("#message").text(response.error);
            }
        })
    });
})
