//
//  WebViewController.h
//  Simple OC
//
//  Created by summer on 2019/1/10.
//  Copyright © 2019年 sandrew. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <WebKit/WebKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface WebViewController : UIViewController <WKNavigationDelegate>

@property (strong, nonatomic) WKWebView *webview;

@end

NS_ASSUME_NONNULL_END
