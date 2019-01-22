//
//  ProgressBarViewController.m
//  Simple OC
//
//  Created by summer on 2019/1/11.
//  Copyright © 2019年 sandrew. All rights reserved.
//

#import "ProgressBarViewController.h"

@interface ProgressBarViewController ()

@end

@implementation ProgressBarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    CGRect screen = [[UIScreen mainScreen] bounds];
    [self initProgressBar:screen];
    [self initDownloadBtn:screen];
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

#pragma mark - init control
- (void)initProgressBar:(CGRect)screen
{
    CGFloat progressBarWidth = 200;
    CGFloat progressBarHeight = 2;
    CGFloat progressBarTopDist = 150;
    
    CGRect progressBarFrame = CGRectMake((screen.size.width - progressBarWidth)/2, progressBarTopDist, progressBarWidth, progressBarHeight);
    self.progressBar = [[UIProgressView alloc] initWithFrame:progressBarFrame];
    [self.view addSubview:self.progressBar];
}

- (void)initDownloadBtn:(CGRect)screen
{
    CGFloat downloadBtnWidth = 69;
    CGFloat downloadBtnHeight = 30;
    CGFloat downloadTopDist = 180;
    
    UIButton *downloadBtn = [UIButton buttonWithType:UIButtonTypeSystem];
    downloadBtn.frame = CGRectMake((screen.size.width - downloadBtnWidth)/2, downloadTopDist, downloadBtnWidth, downloadBtnHeight);
    [downloadBtn setTitle:@"Download" forState:UIControlStateNormal];
    downloadBtn.layer.borderColor = [[UIColor blueColor] CGColor];
    downloadBtn.layer.borderWidth = 1.0f;
    [downloadBtn addTarget:self action:@selector(startDownload:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:downloadBtn];
    
}

#pragma mark - Actions
- (void)startDownload:(id)sender
{
    self.timer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(download:) userInfo:nil repeats:YES];
}

- (void)download:(NSTimer *)timer
{
    self.progressBar.progress += 0.1;
    if (self.progressBar.progress == 1)
    {
        [self.timer invalidate];
        // 提示下载完成
        UIAlertController *notify = [UIAlertController alertControllerWithTitle:@"提示" message:@"下载完成！" preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleCancel handler:^(UIAlertAction *action){
            self.progressBar.progress = 0;
        }];
        [notify addAction:okAction];
        [self presentViewController:notify animated:YES completion:nil];
    }
    
}
@end
