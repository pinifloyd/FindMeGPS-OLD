(function($) {

  $.showInfoMessage = function(opts) {
    var options = {
      messagesContainer: 'div.info-messages-container',
      messageType:       'error',
      message:           'Something wrong! Please try later.',
      withCloseButton:   true
    };

    var containerOptions = {
      messageContainer: '<div class="alert"></div>',
      messagePreType:   'alert-',
      closeButton:      '<a href="#" class="close" data-dismiss="alert">x</a>'
    };

    var o = $.extend({}, options, opts);

    var messageContainer = $(containerOptions.messageContainer);
    messageContainer.addClass(containerOptions.messagePreType + o.messageType);

    if (o.withCloseButton == true) {
      messageContainer.prepend(containerOptions.closeButton);
    }
    messageContainer.append(o.message);

    $(o.messagesContainer).prepend(messageContainer);
  };

})(jQuery);
