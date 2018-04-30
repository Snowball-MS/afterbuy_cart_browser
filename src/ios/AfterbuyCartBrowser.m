#import "AfterbuyCartBrowser"
#import <Cordova/CDVPlugin.h>

@implementation AfterbuyCartBrowser

- (void)pluginInitialize
{
    NSLog(@"Afterbuy Cart Browser");
}

- (void)open:(CDVInvokedUrlCommand*)command
{
    self.callbackId = command.callbackId;

    NSString* url = [command argumentAtIndex:0];
    self.evalScript = [command argumentAtIndex:1];
    self.webview = [[UIWebView alloc] init];
    [webViewCart setDelegate:self];
}

- (void)close:(CDVInvokedUrlCommand*)command
{
    self.callbackId = nil;
    self.evalScript = nil;
}

- (void)webViewDidFinishLoad:(UIWebView *)_webView
{
    if (self.callbackId != nil) {
        NSString* head = [_webView stringByEvaluatingJavaScriptFromString:@"document.getElementsByTagName('head')[0].innerHTML"];
        NSSTring* html = ;

        NSMutableDictionary *cartResult =  [NSMutableDictionary new];
        [cartResult setObject:[_webView stringByEvaluatingJavaScriptFromString:@"document.getElementsByTagName('head')[0].innerHTML"] forKey:@"head"];
        [cartResult setObject:[_webView stringByEvaluatingJavaScriptFromString:self.evalScript] forKey:@"html"];

        CDVPluginResult* pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsDictionary:cartResult];
        [self.commandDelegate sendPluginResult:pluginResult callbackId:self.callbackId];
    }
}
