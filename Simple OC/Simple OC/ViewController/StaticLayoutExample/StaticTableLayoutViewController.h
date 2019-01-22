//
//  StaticTableLayoutViewController.h
//  Simple OC
//
//  Created by summer on 2019/1/18.
//  Copyright © 2019年 sandrew. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface StaticTableLayoutViewController : UITableViewController <UITextFieldDelegate>

@property (strong, nonatomic) UITextField *userName;
@property (strong, nonatomic) UITextField *password;
@property (strong, nonatomic) UIButton *loginBtn;

@end

NS_ASSUME_NONNULL_END
