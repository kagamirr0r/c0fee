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
//= require i18n/translations
//= require activestorage
//= require materialize
//= require materialize-sprockets
//= require Chart.min
//= require select
//= require_tree .

$(document).ready(function () {
	$('.fixed-action-btn').floatingActionButton();
});

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
	$('.tooltipped').tooltip();
});

$(document).ready(function () {
	$('.modal').modal();
});

$(document).ready(function () {
	$('.datepicker').datepicker();
});

$(document).ready(function () {
	$('input.autocomplete').autocomplete({
		data: {
			"エスピリット・サント": null,
			"ミナスジェライス": null,
			"リントン": null,
			"トミオフクダ": null,
			"エスペランサ": null,
			"アマティトラン": null,
			"フロレンシア": null,
			"ブルンジ": null,
			"トマジーニ": null,
			"サンパウロ": null,
			"トマジーニ": null,
			"バイーア": null,
			"ウイラ": null,
			"アチェ": null,
			"ティムティム": null,
			"北スマトラ": null,
			"アテン": null,
			"スラウェシ": null,
			"イルガチェッフェ": null,
			"オロミア": null,
			"シダモ": null,
			"パライネマ": null,
			"サンタバルバラ": null,
			"エル・プラン": null,
			"ラパス": null,
			"インティブカ": null,
			"アンティグア": null,
			"ウエウエテナンゴ": null,
			"アンティグア": null,
			"アマティトラン": null,
			"プーノ": null,
			"クスコ": null,
			"チアパス": null,
			"H1": null,
			"セントラルバレー": null,
			"ゲイシャ": null,
			"ウェストバレー": null,
			"タラス": null,
			"セントロアメリカーノ": null,
			"チリキ": null,
			"アルーシャ": null,
			"ケント": null,
			"ニエリ": null,
			"ルイル11": null,
			"SL28": null,
			"ハラバコア": null,
			"カヤンザ": null,
			"ンゴジ": null,
			"ヒノテガ": null,
			"ヌエバ・セゴビア": null,
			"マタガルパ": null,
			"ケサルテペケ": null,
			"エル・ボケロン": null,
			"ソンソナテ": null,
			"サンタリタ": null,
			"ロマ・ラ・グロリア": null
		},
	});
});
$(document).ready(function () {
	$('.collapsible').collapsible();
});

$(document).ready(function () {
	$('.sidenav').sidenav();
});
