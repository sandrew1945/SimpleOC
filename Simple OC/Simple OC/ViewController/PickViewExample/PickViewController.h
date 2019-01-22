//
//  PickViewController.h
//  Simple OC
//
//  Created by summer on 2019/1/11.
//  Copyright © 2019年 sandrew. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface PickViewController : UIViewController <UIPickerViewDelegate, UIPickerViewDataSource>

@property (strong, nonatomic) UIPickerView *pickView;
@property (strong, nonatomic) UILabel *label;

@property (strong, nonatomic) NSDictionary *pickData;
@property (strong, nonatomic) NSArray *provinceData;
@property (strong, nonatomic) NSArray *cityData;
@end

NS_ASSUME_NONNULL_END
