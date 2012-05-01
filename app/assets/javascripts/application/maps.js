(function($) {

  var resizeMapContainer = function() {
    var options = {
      container: 'div.js-page-content',
      elements: [ 'div.navbar', 'div.js-header-content' ]
    };

    $.setContainerHeight(options);

    $(window).resize(function() {
      $.setContainerHeight(options);
    });
  };

  $(document).ready(function() {
    resizeMapContainer();
  });

})(jQuery);
