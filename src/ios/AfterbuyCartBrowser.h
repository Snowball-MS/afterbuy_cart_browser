#import <Cordova/CDVPlugin.h>

#ifdef __CORDOVA_4_0_0
    #import <Cordova/CDVUIWebViewDelegate.h>
#else
    #import <Cordova/CDVWebViewDelegate.h>
#endif

@interface AfterbuyCartBrowser : CDVPlugin {
}

@property (nonatomic, copy) NSString* callbackId;
@property (nonatomic, copy) NSString* evalScript;
@property (nonatomic, strong) IBOutlet UIWebView* webView;

- (void)open:(CDVInvokedUrlCommand*)command;
- (void)close:(CDVInvokedUrlCommand*)command;

@end
    
