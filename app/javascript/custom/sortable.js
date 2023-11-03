//= require jquery
//= require jquery_ujs
//= require jquery-ui/widgets/sortable
//= require rails_sortable

$(document).on ('turbo:load', function () {
  $('.sortable').railsSortable()
})
