# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).ready ->
	$('#roles_table').DataTable()

	$('#show_user').click ->
  		$.ajax url: '/roles/display_all_users'