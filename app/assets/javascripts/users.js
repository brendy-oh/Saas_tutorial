/* global $, Stripe */
//Document ready
$(document).on('turbolinks:load', function(){
  var theForm = $('#pro_form');
  var submitBtn = $('#form-submit-btn');

//Set Stripe public key
//When user clicks form submit button, prevent defualt submission behaviour

//Collect credit card files
//Send card info to Stripe
//Stripe will return a card token
//Inject card token as hidden field
//Submit form to rails app