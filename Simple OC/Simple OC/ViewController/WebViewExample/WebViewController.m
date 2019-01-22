//
//  WebViewController.m
//  Simple OC
//
//  Created by summer on 2019/1/10.
//  Copyright © 2019年 sandrew. All rights reserved.
//

#import "WebViewController.h"

@interface WebViewController ()
@property CGFloat btnSpace;
@property CGFloat btnWidth;
@property CGFloat btnSideSpace;
@end

@implementation WebViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    CGRect screen = [[UIScreen mainScreen] bounds];
    self.view.backgroundColor = [UIColor whiteColor];
    self.btnSpace = 10;
    self.btnSideSpace = 15;
    self.btnWidth = (screen.size.width - (2 * self.btnSpace) - (2 * self.btnSideSpace)) / 3;
    [self initBtnBar:screen];
    [self initWebView:screen];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/


#pragma mark - init controllers
- (void)initBtnBar:(CGRect)screen
{
    CGFloat btnBarWidth = screen.size.width - (2 * self.btnSideSpace);
    CGFloat btnBarTopDist = 90;
    UIView *btnBar = [[UIView alloc] initWithFrame:CGRectMake((screen.size.width - btnBarWidth)/2, btnBarTopDist, btnBarWidth, 60)];
    
    
    [self.view addSubview:btnBar];
    [self initLoadHtmlStringBtn:btnBar];
    [self initLoadDataBtn:btnBar];
    [self initLoadRequestBtn:btnBar];
}

- (void)initLoadHtmlStringBtn:(UIView *)btnBar
{
    UIButton *loadHtmlStringBtn = [UIButton buttonWithType:UIButtonTypeSystem];
    loadHtmlStringBtn.frame = CGRectMake(0, 0, self.btnWidth, 60);
    loadHtmlStringBtn.layer.borderColor = [[UIColor blueColor] CGColor];
    loadHtmlStringBtn.layer.borderWidth = 1.0f;

    [loadHtmlStringBtn setTitle:@"LoadHTMLString" forState:UIControlStateNormal];
    [loadHtmlStringBtn addTarget:self action:@selector(loadHtmlString:) forControlEvents:UIControlEventTouchUpInside];
    [btnBar addSubview:loadHtmlStringBtn];
}

- (void)initLoadDataBtn:(UIView *)btnBar
{
    UIButton *loadDataBtn = [UIButton buttonWithType:UIButtonTypeSystem];
    loadDataBtn.frame = CGRectMake(self.btnWidth + self.btnSpace, 0, self.btnWidth, 60);
    loadDataBtn.layer.borderColor = [[UIColor blueColor] CGColor];
    loadDataBtn.layer.borderWidth = 1.0f;
    
    [loadDataBtn setTitle:@"Load Data" forState:UIControlStateNormal];
    [loadDataBtn addTarget:self action:@selector(loadData:) forControlEvents:UIControlEventTouchUpInside];
    [btnBar addSubview:loadDataBtn];
}

- (void)initLoadRequestBtn:(UIView *)btnBar
{
    UIButton *loadRequestBtn = [UIButton buttonWithType:UIButtonTypeSystem];
    loadRequestBtn.frame = CGRectMake((self.btnWidth * 2) + (self.btnSpace * 2), 0, self.btnWidth, 60);
    loadRequestBtn.layer.borderColor = [[UIColor blueColor] CGColor];
    loadRequestBtn.layer.borderWidth = 1.0f;
    
    [loadRequestBtn setTitle:@"Load Request" forState:UIControlStateNormal];
    [loadRequestBtn addTarget:self action:@selector(loadRequest:) forControlEvents:UIControlEventTouchUpInside];
    [btnBar addSubview:loadRequestBtn];
}

- (void)initWebView:(CGRect)screen
{
    self.webview = [[WKWebView alloc] initWithFrame:CGRectMake(0, 90 + 60 + 10, screen.size.width, screen.size.height - 90)];
//    self.webview
    [self.view addSubview:self.webview];
}

#pragma mark - Actions
- (void)loadHtmlString:(id)sender
{
    NSLog(@"loadHtmlString");
    NSString *htmlPath = [[NSBundle mainBundle] pathForResource:@"zhifu" ofType:@"html"];
    NSURL *bundleUrl = [NSURL fileURLWithPath:[[NSBundle mainBundle] bundlePath]];
    NSError *error = nil;
    NSString *html = [[NSString alloc] initWithContentsOfFile:htmlPath encoding:NSUTF8StringEncoding error:&error];
    NSLog(@"error ---------------- %@", error);
    if (error == nil)
    {
        [self.webview loadHTMLString:html baseURL:bundleUrl];
    }
}

- (void)loadData:(id)sender
{
    NSLog(@"loadData");
    NSString *htmlPath = [[NSBundle mainBundle] pathForResource:@"zhifu" ofType:@"html"];
    NSURL *bundleUrl = [NSURL fileURLWithPath:[[NSBundle mainBundle] bundlePath]];
    NSData *htmlData = [[NSData alloc] initWithContentsOfFile:htmlPath];
    [self.webview loadData:htmlData MIMEType:@"text/html" characterEncodingName:@"UTF-8" baseURL:bundleUrl];
}

- (void)loadRequest:(id)sender
{
    NSLog(@"loadRequest --------------");
    NSURL *url = [NSURL URLWithString:@"https://www.google.com"];
    NSURLRequest *req = [NSURLRequest requestWithURL:url];
    [self.webview loadRequest:req];
    self.webview.navigationDelegate = self;
}

#pragma mark - implement NavigationDelegate protocol
- (void)webView:(WKWebView *)webView didStartProvisionalNavigation:(WKNavigation *)navigation
{
    NSLog(@"Start load!");
}

- (void)webView:(WKWebView *)webView didCommitNavigation:(WKNavigation *)navigation
{
    NSLog(@"getting content!");
}

- (void)webView:(WKWebView *)webView didFinishNavigation:(WKNavigation *)navigation
{
    NSLog(@"load complete");
}

- (void)webView:(WKWebView *)webView didFailProvisionalNavigation:(WKNavigation *)navigation withError:(NSError *)error
{
    NSLog(@"load error");
    NSLog(@"errorCode: %ld", (long)error.code);
    NSLog(@"errorCode: %@", error);
}
@end
