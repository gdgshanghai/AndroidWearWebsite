(function() {
  $(function() {
    var mainSwiper, mySwiper;
    mySwiper = $('.swiper-container').swiper({
      mode: 'vertical',
      keyboardControl: true
    });
    return mainSwiper = $('.main-swiper').swiper({
      mode: 'horizontal',
      DOMAnimation: false,
      keyboardControl: true
    });
  });

}).call(this);
