# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
$ ->
	$('.dropdown-toggle').dropdown()
	$('a[rel="tooltip"]').tooltip()
$(document).scroll ->
	unless $(".subnav").attr("data-top")
		return	if $(".subnav").hasClass("subnav-fixed")
		offset = $(".subnav").offset()
		$(".subnav").attr "data-top", offset.top
	if $(".subnav").attr("data-top") - $(".subnav").outerHeight() <= $(this).scrollTop()
		$(".subnav").addClass "subnav-fixed"
	else
		$(".subnav").removeClass "subnav-fixed"