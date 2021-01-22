// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

import Rails from "@rails/ujs"
import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"
import "channels"
import $ from "jquery"
import "popper.js"
import "bootstrap"

window.jQuery = $;
window.$ = $;

Rails.start()
Turbolinks.start()
ActiveStorage.start()

$(document).on('turbolinks:load', function(){
  $(".carousel").carousel({
    interval: false,
  });

  $(".vote").on("click",function(e){
    let info = e.target.id;
    let to = $(e.target).data("item").split(";");
    let next = parseInt(to[0])+1;
    if(next > 10){
      $("#votos").html("10");
      $("#totalv").hide();
    }else{
      $("#votos").html((next == 10 ? 10 : next));
    }
    $.get("/vote_add.json?vote="+info,function(data){
      $("#carouselTrip").carousel('next');
    });
    
  });

  $("#frm_vote").on("submit",function(e){
    let name = $("#name").val();
    let email = $("#email").val();

    if(!name || !email){
      alert("Por favor, informe o nome e email")
      return false;
    }

  });
})
