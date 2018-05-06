package com.idve.afterbuy.cartbrowser;

import org.apache.cordova.CallbackContext;
import org.apache.cordova.Config;
import org.apache.cordova.CordovaArgs;
import org.apache.cordova.CordovaHttpAuthHandler;
import org.apache.cordova.CordovaPlugin;
import org.apache.cordova.CordovaWebView;
import org.apache.cordova.LOG;
import org.apache.cordova.PluginManager;
import org.apache.cordova.PluginResult;
import org.json.JSONException;
import org.json.JSONObject;

public class AfterbuyCartBrowser extends CordovaPlugin {
  
    public boolean execute(String action, String url, String evelScript, CallbackContext callbackContext) throws JSONException {
        if (action.equals("open")) {
            return true;
        } else if (action.equals("close")) {
            return true;

        return false;
    }
}
