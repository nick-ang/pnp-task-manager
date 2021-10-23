// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

import Rails from "@rails/ujs"
import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"
import "channels"

Rails.start()
Turbolinks.start()
ActiveStorage.start()


// ----------------------------------------------------
// Note(lewagon): ABOVE IS RAILS DEFAULT CONFIGURATION
// WRITE YOUR OWN JS STARTING FROM HERE 👇
// ----------------------------------------------------

// External imports
import "bootstrap";
import "bootstrap-icons/font/bootstrap-icons.css";
import "chartkick/chart.js";
require("turbolinks").start();
require("@rails/activestorage").start();
require("channels");
import { initKanbanSortable } from "../plugins/initSortable";

// Internal imports, e.g:
// import { initSelect2 } from '../components/init_select2';


document.addEventListener("turbolinks:load", () => {
  // Call your functions here, e.g:
  // initSelect2();
  const kanbanUls = document.querySelectorAll(".kanban-col");
  if (kanbanUls) {
    initKanbanSortable(kanbanUls);
  }
});

$(function () {
  $('[data-toggle="tooltip"]').tooltip()
})

$('form').on('focus', 'input[type=number]', function (e) {
  $(this).on('wheel.disableScroll', function (e) {
    e.preventDefault()
  })
})

$('form').on('blur', 'input[type=number]', function (e) {
  $(this).off('wheel.disableScroll')
})

$('#editProject').on('show.bs.modal', function (event) {
  var button = $(event.relatedTarget) // Button that triggered the modal
  var recipient = button.data('projectid') // Extract info from data-* attributes
  // If necessary, you could initiate an AJAX request here (and then do the updating in a callback).
  // Update the modal's content. We'll use jQuery here, but you could use a data binding library or other methods instead.
  var modal = $(this)
  modal.find('.test').text('Project Id' + recipient)
  //modal.find('.modal-body input').val(recipient)
})