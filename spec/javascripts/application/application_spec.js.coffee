describe ".submitForm", ->
  it "submitForm class should submit form", ->
    loadFixtures('submit_form.html')

    $('.submitForm').on 'click', ->
      $(this).parent('form').submit();

    spyEvent = spyOnEvent('form', 'submit');

    $(".submitForm").trigger("click");
    expect(spyEvent).toHaveBeenTriggered();