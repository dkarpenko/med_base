jQuery ->
#  ($ "a[data-toggle=modal]").click ->
#    target = ($ @).attr('data-target')
#    url = ($ @).attr('href')
#    ($ target).modal({remote: url})

  ($ ".tooltip_element").tooltip();

  ($ '.date').datepicker({format: 'yyyy-mm-dd', weekStart: 1}).on 'changeDate', (e) ->
    $(this).datepicker('hide')


  ($ "#modal_dialog").on 'hide', (e)->
    $(this).removeData('modal')

  modal_dialog_handler = (e) ->
    $('#modal_dialog .modal-header h3').html(this.title ? 'Modal Dialog')
  modal_dialog_handler.place_first = true

  $('body').on 'click.modal.data-api', 'a[data-toggle="modal"]', modal_dialog_handler

  $(document).on 'click', '#modal-submit', (e) ->
    form = $(this).parent().prev().children('form')
    # add required fields if missing
    if form.find('input[name="format"]').length == 0
      form.append($('<input/>').attr('type', 'hidden').attr('name', 'format').val('js'))
    if form.find('div.error_wrapper').length == 0
      form.prepend($('<div/>').addClass('alert').addClass('alert-error').addClass('hide').addClass('error_wrapper'))
    if form.find('input[type=submit]').length == 0
      form.append($('<div/>').addClass('hide').append($('<input/>').addClass('modal_form_submit').attr('type', 'submit').val('Save')))
    # submit form
    form.find('input[type=submit]').trigger('click')