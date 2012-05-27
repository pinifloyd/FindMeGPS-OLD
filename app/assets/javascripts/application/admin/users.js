(function($) {

  $('a.js-form-select-device').live('click', function(e) {
    e.preventDefault();

    var selectButton    = $(this);
    var searchDeviceUrl = selectButton.attr('href');
    var modalWindow     = $(selectButton.data('modal'));
    var modalBody       = modalWindow.find('div.modal-body');

    modalBody.load(searchDeviceUrl, function(data, textStatus, request) {
      if (textStatus == 'error') {
        $.showInfoMessage({ messageType: textStatus });
      }
      modalWindow.modal('show');
    });
  });

  $('#device_search a.js-submit').live('click', function(e) {
    e.preventDefault();

    var submitButton    = $(this);
    var searchForm      = submitButton.closest('form');
    var searchDeviceUrl = searchForm.attr('action') + '&' + searchForm.serialize();
    var modalBody       = searchForm.closest('div.modal-body');

    modalBody.load(searchDeviceUrl, function(data, textStatus, request) {
      if (textStatus == 'error') {
        $.showInfoMessage({ messageType: textStatus });
      }
    });
  });

  $('#device_search a.sort_link').live('click', function(e) {
    e.preventDefault();

    var sortLink        = $(this);
    var searchDeviceUrl = sortLink.attr('href');
    var modalBody       = sortLink.closest('div.modal-body');

    modalBody.load(searchDeviceUrl, function(data, textStatus, request) {
      if (textStatus == 'error') {
        $.showInfoMessage({ messageType: textStatus });
      }
    });
  });

  $('#device_search a.js-select').live('click', function(e) {
    e.preventDefault();

    var selectButton = $(this);
    var modalWindow = selectButton.closest('#modal-select-device');

    $('div.js-form-device-actions').load(selectButton.attr('href'), function(data, textStatus, request) {
      if (textStatus == 'error') {
        $.showInfoMessage({ messageType: textStatus });
      } else {
        modalWindow.modal('hide');
      }
    });
  });

  $('#device_search a.js-remove').live('click', function(e) {
    e.preventDefault();

    var removeButton    = $(this);
    var removeDeviceUrl = removeButton.attr('href');
    var modalBody       = removeButton.closest('div.modal-body');

    modalBody.load(removeDeviceUrl, function(data, textStatus, request) {
      if (textStatus == 'error') {
        $.showInfoMessage({ messageType: textStatus });
      }
      if (textStatus == 'success') {
        $.showInfoMessage({
          messageType: textStatus,
          message:     'Successfully removed'
        });
      }
    });
  });

  $('a.js-form-remove-device').live('click', function(e) {
    e.preventDefault();

    var removeButton = $(this);

    $('div.js-form-device-actions').load(removeButton.attr('href'), function(data, textStatus, request) {
      if (textStatus == 'error') {
        // $.showInfoMessage({  });
      }
    });
  });

})(jQuery);
