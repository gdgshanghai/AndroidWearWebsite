$ ()->


  mySwiper = $('.swiper-container').swiper
    mode: 'vertical'
    # DOMAnimation: false
    keyboardControl: true
    # useCSS3Transforms: false

  mainSwiper = $('.main-swiper').swiper
    mode: 'horizontal'
    DOMAnimation: false
    keyboardControl: true
    loop: true
    # useCSS3Transforms: false

  $('.gotoRegister').on 'click', ()->
    mySwiper.swipeTo 1
  
  # agendaSwiper = $('.agenda-wrapper').swiper
  #   mode: 'vertical'
  #   cssWidthAndHeight: true
  #   freeMode: true

  
  # mySwiper.swipeTo(2)
  # mainSwiper.swipeTo(4)
