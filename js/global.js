(function() {
  $(function() {
    var mainSwiper, mySwiper;
    mySwiper = $('.swiper-container').swiper({
      mode: 'vertical',
      keyboardControl: true
    });
    mainSwiper = $('.main-swiper').swiper({
      mode: 'horizontal',
      DOMAnimation: false,
      keyboardControl: true,
      loop: true
    });
    return $('.gotoRegister').on('click', function() {
      return mySwiper.swipeTo(1);
    });
  });

}).call(this);
