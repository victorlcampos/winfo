$ ->
  $('.submitForm').on 'click', ->
    $(this).parent('form').submit();