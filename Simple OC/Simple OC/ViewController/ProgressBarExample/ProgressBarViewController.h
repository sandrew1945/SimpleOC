//
//  ProgressBarViewController.h
//  Simple OC
//
//  Created by summer on 2019/1/11.
//  Copyright © 2019年 sandrew. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface ProgressBarViewController : UIViewController
@property (strong, nonatomic) UIProgressView *progressBar;
@property (strong, nonatomic) NSTimer *timer;
@end

NS_ASSUME_NONNULL_END
