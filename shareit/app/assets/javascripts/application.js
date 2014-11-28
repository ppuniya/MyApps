// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require twitter/bootstrap
//= require jquery-ui
//= require turbolinks
//= require_tree .

var setup_board = function(){
	jQuery(".board_container").sortable({handle: ".board_list_header", cancel: ".board_list_toggle", placeholder: "board_list_placeholder ui-corner-all", update: function(){jQuery.post(jQuery(this).data('update-url'), jQuery(this).sortable('serialize'));}});
	jQuery(".board_list").addClass("ui-widget ui-widget-content ui-helper-clearfix ui-corner-all").find(".board_list_header").addClass("ui-widget-header ui-corner-all").prepend("<span class='ui-icon ui-icon-minusthick board_list_toggle'></span>");
	jQuery(".board_list_toggle").click(function(){var icon = jQuery(this); icon.toggleClass("ui-icon-minusthick ui-icon-plusthink"); icon.closest(".board_list").find(".board_list_content").toggle();});
};
jQuery(document).ready(setup_board);
jQuery(window).bind('page:change', setup_board);
