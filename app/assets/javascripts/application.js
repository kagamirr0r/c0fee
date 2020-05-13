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
//= require jquery
//= require rails-ujs
//= require activestorage
//= require_tree .
//= require materialize
//= require materialize-sprockets

$(document).on("click", "#avatar_select_file_button", function () {
	$("#user_avatar").click();
});

$(document).on("change", "#user_avatar", function () {
	$("#avatar_filename").val(
		$(this)
			.val()
			.replace(/^.*\\/, "")
	);
});

$(document).on("click", "#bean_select_file_button", function () {
	$("#bean_bean_image").click();
});

$(document).on("change", "#bean_bean_image", function () {
	$("#bean_filename").val(
		$(this)
			.val()
			.replace(/^.*\\/, "")
	);
});

$(document).on("click", "#recipe_select_file_button", function () {
	$("#recipe_recipe_image").click();
});

$(document).on("change", "#recipe_recipe_image", function () {
	$("#recipe_filename").val(
		$(this)
			.val()
			.replace(/^.*\\/, "")
	);
});

$(document).on("click", "#shop_select_file_button", function () {
	$("#shop_shop_image").click();
});

$(document).on("change", "#shop_shop_image", function () {
	$("#shop_filename").val(
		$(this)
			.val()
			.replace(/^.*\\/, "")
	);
});

$(document).ready(function () {
	$(".dropdown-trigger").dropdown({
		coverTrigger: false,
		constrainWidth: false
	});
});

$(document).ready(function () {
	$(".tabs").tabs();
});

$(document).ready(function () {
	$("select").formSelect();
});

$(document).ready(function () {
	$('input.autocomplete').autocomplete({
		data: {
			"ライト": null,
			"シナモン": null,
			"ミディアム": null,
			"ハイ": null,
			"シティ": null,
			"フルシティ": null,
			"フレンチ": null,
			"イタリアン": null,
			"ブラジル": null,
			"エチオピア": null
		},
	});
});
