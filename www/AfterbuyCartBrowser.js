var exec = require('cordova/exec');

var AfterbuyCartBrowser = {
  open: function(strUrl, evalScript, successCallback, errorCallback) {
    exec(successCallback, errorCallback, 'AfterbuyCartBrowser', 'open', [strUrl, evalScript]);
  },

  close: function(successCallback, errorCallback) {
    exec(successCallback, errorCallback, 'AfterbuyCartBrowser', 'close', []);
  },
};

module.exports = AfterbuyCartBrowser;
