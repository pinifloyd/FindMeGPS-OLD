(function($) {

  $.calculateContainerHeight = function(elements) {
    var excessPx =  parseInt( $('body').css('padding-top') );
        excessPx += parseInt( $('body').css('padding-bottom') );

    $.each(elements, function(index, element) {
      excessPx += $(element).height();
    });

    return $(window).height() - excessPx;
  };

  $.setContainerHeight = function(options) {
    if (!options.container) { return; }

    $(options.container).css({
      height: $.calculateContainerHeight(options.elements)
    });
  };

})(jQuery);
