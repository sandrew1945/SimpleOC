//
//  AlertViewAndActionSheetViewController.m
//  Simple OC
//
//  Created by summer on 2019/1/11.
//  Copyright © 2019年 sandrew. All rights reserved.
//

#import "AlertViewAndActionSheetViewController.h"

@interface AlertViewAndActionSheetViewController ()

@end

@implementation AlertViewAndActionSheetViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    CGRect screen = [[UIScreen mainScreen] bounds];
    self.view.backgroundColor = [UIColor whiteColor];
    [self initAlertBtn:screen];
    [self initActionSheetBtn:screen];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
#pragma mark - init controller
- (void)initAlertBtn:(CGRect)screen
{
    CGFloat alertBtnWidth = 100;
    CGFloat alertBtnHeight = 30;
    CGFloat alertBtnTopDist = 130;
    CGRect alertBtnFrame = CGRectMake((screen.size.width - alertBtnWidth)/2, alertBtnTopDist, alertBtnWidth, alertBtnHeight);
    UIButton *alertBtn = [[UIButton alloc] initWithFrame:alertBtnFrame];
    [alertBtn setTitle:@"Alert !" forState:UIControlStateNormal];
    alertBtn.layer.backgroundColor = [[UIColor blueColor] CGColor];
    [alertBtn addTarget:self action:@selector(showAlert:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:alertBtn];
}

- (void)initActionSheetBtn:(CGRect)screen
{
    CGFloat actionBtnWidth = 100;
    CGFloat actionBtnHeight = 30;
    CGFloat actionBtnTopDist = 240;
    CGRect actionBtnFrame = CGRectMake((screen.size.width - actionBtnWidth)/2, actionBtnTopDist, actionBtnWidth, actionBtnHeight);
    UIButton *actionBtn = [[UIButton alloc] initWithFrame:actionBtnFrame];
    [actionBtn setTitle:@"Forward !" forState:UIControlStateNormal];
    
    actionBtn.backgroundColor = [UIColor blueColor];
    [actionBtn addTarget:self action:@selector(showActionSheet:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:actionBtn];
}

#pragma mark - Actions
- (void)showAlert:(id)sender
{
    NSLog(@"show alert -----------------");
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"提示" message:@"学会了吗？" preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *yesAction = [UIAlertAction actionWithTitle:@"Yes" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action){
        NSLog(@"Yes! I got it");
    }];
    UIAlertAction *noAction = [UIAlertAction actionWithTitle:@"No" style:UIAlertActionStyleCancel handler:^(UIAlertAction *action){
        NSLog(@"No! I will try it again");
    }];
    [alertController addAction:yesAction];
    [alertController addAction:noAction];
    [self presentViewController:alertController animated:YES completion:nil];
}

- (void)showActionSheet:(id)sender
{
    NSLog(@"show ActionSheet");
    UIAlertController *actionSheetContoller = [[UIAlertController alloc] init];
    
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"Cancel" style:UIAlertActionStyleCancel handler:^(UIAlertAction *action){
        NSLog(@"I cancel it");
    }];
    
    UIAlertAction *destructiveAciton = [UIAlertAction actionWithTitle:@"Becareful" style:UIAlertActionStyleDestructive handler:^(UIAlertAction *action){
        NSLog(@"World is destory");
    }];
    UIAlertAction *weiboAction = [UIAlertAction actionWithTitle:@"新浪微博" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action){
        NSLog(@"Forward to weibo");
    }];
    
    [actionSheetContoller addAction:cancelAction];
    [actionSheetContoller addAction:destructiveAciton];
    [actionSheetContoller addAction:weiboAction];
    actionSheetContoller.popoverPresentationController.sourceView = sender;
    [self presentViewController:actionSheetContoller animated:YES completion:nil];
}
@end
