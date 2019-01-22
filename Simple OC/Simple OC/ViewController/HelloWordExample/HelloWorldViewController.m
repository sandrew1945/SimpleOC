//
//  HelloWorldViewController.m
//  Simple OC
//
//  Created by summer on 2019/1/8.
//  Copyright © 2019年 sandrew. All rights reserved.
//

#import "HelloWorldViewController.h"

@interface HelloWorldViewController ()
@property (strong, nonatomic) UILabel *label;
@end

@implementation HelloWorldViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    CGRect screen = [[UIScreen mainScreen] bounds];
    CGFloat labelWidth = 100;
    CGFloat labelHeight = 20;
    CGFloat labelTopDist = 150;
    CGRect labelFrame = CGRectMake((screen.size.width - labelWidth)/2, labelTopDist, labelWidth, labelHeight);
    self.label = [[UILabel alloc]initWithFrame:labelFrame];
    self.label.text = @"Not Click";
    self.label.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:self.label];
    
    CGFloat btnWidth = 60;
    CGFloat btnHeight = 20;
    CGFloat btnTopDist = 240;
    UIButton *button = [UIButton buttonWithType:UIButtonTypeSystem];
    button.frame = CGRectMake((screen.size.width - btnWidth)/2, btnTopDist, btnWidth, btnHeight);
    [button setTitle:@"OK!" forState:UIControlStateNormal];
    
    [button addTarget:self action:@selector(onClick:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:button];
}


# pragma mark - Action
- (void)onClick:(id)sender
{
    NSLog(@" ----------click----------");
    self.label.text = @"Hello World!";
    
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
