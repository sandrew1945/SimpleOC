//
//  TextViewController.m
//  Simple OC
//
//  Created by summer on 2019/1/9.
//  Copyright © 2019年 sandrew. All rights reserved.
//

#import "TextViewController.h"

@interface TextViewController ()

@end

@implementation TextViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    // 注册键盘开启广播
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardDidShow:) name:UIKeyboardDidShowNotification object:nil];
    // 注册键盘关闭广播
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardDidClose:) name:UIKeyboardDidHideNotification object:nil];
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    // 注销键盘开启广播
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UIKeyboardDidShowNotification object:nil];
    // 注销键盘关闭广播
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UIKeyboardDidHideNotification object:nil];
    
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

# pragma mark - implement UITextFieldDelegate
- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    NSLog(@"TextField获取焦点，点击return键");
    [textField resignFirstResponder];
    return true;
}

# pragma mark - implement UITextViewDelegate
- (BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text
{
    if ([text isEqualToString:@"\n"])
    {
        NSLog(@"TextView获取焦点，点击return键");
        [textView resignFirstResponder];
        return false;
    }
    return true;
}

#pragma mark -- Keyboard opt
- (void)keyboardDidShow:(NSNotification *)notification
{
    NSLog(@"Keyboard is show !");
}

- (void)keyboardDidClose:(NSNotification *)notification
{
    NSLog(@"Keyboard is hidden !");
}
@end
