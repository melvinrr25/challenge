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
//= require turbolinks
//= require_tree .

$(document).ready(search_template);
$(document).on('page:load',search_template);

function search_template() {
  (function(d){
    var search = d.querySelector("#search-template"), template = d.querySelectorAll('.template-container');
    if(!search) return;
    search.onkeyup = function(){
      for(var i=0; i<template.length; i++){
        var text = search.value.toLowerCase();
        var tr = template[i], tr_text = tr.innerText.toLowerCase();
        tr.setAttribute('class', tr_text.indexOf(text)!=-1?"template-container show-template":"template-container hide-template");
      }
    }
  })(document)
}
