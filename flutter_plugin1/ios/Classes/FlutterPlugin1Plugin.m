#import "FlutterPlugin1Plugin.h"
#if __has_include(<flutter_plugin1/flutter_plugin1-Swift.h>)
#import <flutter_plugin1/flutter_plugin1-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
//#import "flutter_plugin1-Swift.h"
#endif
#import "HomeController.h"
#import "DetaileController.h"
@interface FlutterPlugin1Plugin()

@property (nonatomic,copy)FlutterResult result;
@property(nonatomic,strong)FlutterViewController *fvc;
@property (nonatomic,strong)FlutterMethodCall *call;
@property(nonatomic,assign) BOOL isJumpToFlutterPage;
@end

@implementation FlutterPlugin1Plugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
    FlutterMethodChannel* channel = [FlutterMethodChannel
                                     methodChannelWithName:@"flutter_plugin1"
                                     binaryMessenger:[registrar messenger]];
    FlutterPlugin1Plugin* instance = [[FlutterPlugin1Plugin alloc] init];
    
    [registrar addMethodCallDelegate:instance channel:channel];
//  [FlutterPlugin1Plugin registerWithRegistrar:registrar];
}
-(void)handleMethodCall:(FlutterMethodCall *)call result:(FlutterResult)result{
    
    self.call = call;
    self.result = result;
    if (!self.fvc) {
        
        self.fvc = (FlutterViewController *)[UIApplication sharedApplication].keyWindow.rootViewController;
    }
    if ([call.method isEqualToString:@"getPlatformVersion"]) {
        
        UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:[HomeController new]];
        nav.modalPresentationStyle = UIModalPresentationFullScreen;
        [self.fvc presentViewController:nav animated:NO completion:nil];
        result(@"跳转到iOS原生页面");
    }
    else if([call.method isEqualToString:@"gotoDetailePage"]){
        
        if (self.isJumpToFlutterPage) {
            
            self.isJumpToFlutterPage = NO;
            result(@"跳转到flutter原生页面");
        }
        else{
            
            __weak typeof(self)weakSelf = self;
        DetaileController *vc = [DetaileController new];
        vc.jumpToFlutterPage = ^{
            
            weakSelf.isJumpToFlutterPage = YES;
            UIApplication.sharedApplication.keyWindow.rootViewController = weakSelf.fvc;
            [weakSelf handleMethodCall:weakSelf.call result:weakSelf.result];
        };
        UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:vc];
            
        nav.modalPresentationStyle = UIModalPresentationFullScreen;
        [self.fvc presentViewController:nav animated:NO completion:nil];
//        result(@"跳转到iOS原生详情页面");
        }
    }
}

@end
