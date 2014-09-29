loadApplication = ->
  styles = [
    "background: #7b77c9"
    "color: white"
    "display: block"
    "padding: 20px 20px 20px 20px"
    "text-align: center"
    "font-weight: normal"
    "font-size: 20px"
    "line-height: 60px"
  ].join(";")
  console.log('%c Lithium Loaded :)', styles, 'For usage visit: https://github.com/owldesign/3.-Lithium');
  $(svgInjector)
  $(worksFilter)
  $(photoSection)
  $(formSubscribe)
  $('.arrow-down').on 'click', (e) ->
    e.preventDefault()
    $("html,body").animate scrollTop: $("#page-work").offset().top

  if (Modernizr.touch)
    FastClick.attach(document.body)

svgInjector = ->
  mySVGsToInject = document.querySelectorAll('img.inject-me')
  SVGInjector mySVGsToInject

worksFilter = ->
  $filter = $('#work-filter')
  $grid = $('#work-grid')
  $sizer = $grid.find('.shuffle__sizer')
  $workItem = $('.work-item')
  $mobileFilterBtn = $('.mobile-filter-select')

  $mobileFilterBtn.on 'click', (e) ->
    e.preventDefault()
    $filter.slideToggle()
    $(@).toggleClass 'opened'


  $(window).resize ->
    if $(window).width() > 768
      if $filter.is(':visible')
        return
      else
        $filter.slideDown()
    else
      $filter.slideUp()
      $mobileFilterBtn.removeClass 'opened'


  $workItem.on 'click', ->
    url = $(@).data 'url'
    window.location.href = url

  $grid.shuffle
    itemSelector: $workItem
    sizer: $sizer
  
  $btns = $filter.children()
  $btns.on 'click', (e) ->
    e.preventDefault()
    $this = $(@)
    isActive = $this.hasClass 'active'

    if $this.hasClass 'active'
      return false
    else
      group = (if isActive then 'all' else $this.data('group'))
      $('#work-filter .active').removeClass 'active'  unless isActive
      $this.toggleClass 'active'
      $grid.shuffle 'shuffle', group



formSubscribe = ->
  form = $('#subscribe')
  formMessages = $('.form-result');

  # Form validation on iOS Safari
  hasHtml5Validation = ->
    typeof document.createElement("input").checkValidity is "function"
  
  if hasHtml5Validation()
    form.submit (e) ->
      unless @checkValidity()
        e.preventDefault()
        $(this).addClass "invalid"
        $("#status").html "invalid"
      else
        $(this).removeClass "invalid"
        e.preventDefault()
        formData = $(form).serialize()
        $.ajax(
          type: "POST"
          url: $(form).attr("action")
          data: formData
        ).done((response) ->
          $(formMessages).removeClass "error"
          $(formMessages).addClass "success"
          $(formMessages).text 'You have successfully subscribed!'
          $("#email").val ""
        ).fail (data) ->
          $(formMessages).removeClass "success"
          $(formMessages).addClass "error"
          if data.responseText isnt ""
            $(formMessages).text data.responseText
          else
            $(formMessages).text "Oops! An error occured please check your email address."
        

photoSection = ->
  $photoItem = $('.photo-item')

  $photoItem.on 'click', ->
    url = $(@).data 'url'
    window.location.href = url

$(loadApplication)
