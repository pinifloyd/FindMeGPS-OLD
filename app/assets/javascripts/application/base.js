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

  $.toggleCheckboxCheck = function(options) {
    if (!options.checkbox) { return; }

    var checkbox          = $(options.checkbox);
    var allCheckboxes     = $(options.allCheckboxes).length;
    var checkedCheckboxes = $(options.checkedCheckboxes).length;

    var checked = allCheckboxes == checkedCheckboxes;

    checkbox.attr('checked', checked);
  };

})(jQuery);
