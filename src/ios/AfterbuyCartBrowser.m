#import "AfterbuyCartBrowser.h"
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
    self.cartWebView = [[UIWebView alloc] init];
    [self.cartWebView setDelegate:self];
    [self.cartWebView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:url]]];
}

- (void)close:(CDVInvokedUrlCommand*)command
{
    if (self.cartWebView != nil) {
        [self.cartWebView stopLoading];
    }
    self.callbackId = nil;
    self.evalScript = nil;
}

- (BOOL)webView:(UIWebView *)_webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType
{
    return YES;
}

- (void)webViewDidStartLoad:(UIWebView *)_webView
{
    NSLog(@"Afterbuy Shopbag Start Load");
}

- (void)webViewDidFinishLoad:(UIWebView *)_webView
{
    if (_webView.isLoading) {
        return;
    }
    
    NSLog(@"Afterbuy Shopbag Finish Load");
    
    if (self.callbackId != nil) {
        NSMutableDictionary *cartResult =  [NSMutableDictionary new];
        [cartResult setObject:[_webView stringByEvaluatingJavaScriptFromString:@"document.getElementsByTagName('head')[0].innerHTML"] forKey:@"head"];
        [cartResult setObject:[_webView stringByEvaluatingJavaScriptFromString:@"document.getElementsByTagName('body')[0].innerHTML"] forKey:@"html"];

        CDVPluginResult* pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsDictionary:cartResult];
        [self.commandDelegate sendPluginResult:pluginResult callbackId:self.callbackId];
    }
}

-(void)webView:(UIWebView *)_webView didFailLoadWithError:(NSError *)error {
    NSLog(@"Afterbuy Shopbag Error");
}

@end
