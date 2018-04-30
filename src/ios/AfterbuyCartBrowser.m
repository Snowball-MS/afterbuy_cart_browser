#import "AfterbuyCartBrowser.h"
#import <Cordova/CDVPlugin.h>

@implementation AfterbuyCartBrowser : CDVPlugin

- (void)pluginInitialize
{
    NSLog(@"Afterbuy Cart Browser");
}

- (void)open:(CDVInvokedUrlCommand*)command
{
    self.callbackId = command.callbackId;

    NSString* url = [command argumentAtIndex:0];
    self.evalScript = [command argumentAtIndex:1];
    self.webView = [[UIWebView alloc] init];
    [self.webView loadRequest[NSURLRequest requestWithURL [NSURL URLWithString:url]]];
    [self.webView setDelegate:self];
}

- (void)close:(CDVInvokedUrlCommand*)command
{
    self.callbackId = nil;
    self.evalScript = nil;
}

- (void)webViewDidFinishLoad:(UIWebView *)_webView
{
    if (self.callbackId != nil) {
        NSMutableDictionary *cartResult =  [NSMutableDictionary new];
        [cartResult setObject:[_webView stringByEvaluatingJavaScriptFromString:@"document.getElementsByTagName('head')[0].innerHTML"] forKey:@"head"];
        [cartResult setObject:[_webView stringByEvaluatingJavaScriptFromString:self.evalScript] forKey:@"html"];

        CDVPluginResult* pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsDictionary:cartResult];
        [self.commandDelegate sendPluginResult:pluginResult callbackId:self.callbackId];
    }
}
