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

  var deviceCheckboxesToggle = function() {
    var options = {
      checkbox:          '#devices',
      allCheckboxes:     ':checkbox[id=device_ids_]',
      checkedCheckboxes: ':checkbox:checked:not(#devices)'
    };

    var checkbox      = $(options.checkbox);
    var allCheckboxes = $(options.allCheckboxes);

    $.toggleCheckboxCheck(options);

    allCheckboxes.click(function() {
      $.toggleCheckboxCheck(options);
    });

    checkbox.click(function() {
      checked = checkbox.attr('checked') ? true : false;
      allCheckboxes.attr('checked', checked);
    });
  };

  $(document).ready(function() {
    resizeMapContainer();
    deviceCheckboxesToggle();
  });

})(jQuery);
