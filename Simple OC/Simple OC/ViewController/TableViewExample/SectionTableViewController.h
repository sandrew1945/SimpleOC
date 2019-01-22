//
//  SectionTableViewController.h
//  Simple OC
//
//  Created by summer on 2019/1/16.
//  Copyright © 2019年 sandrew. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface SectionTableViewController : UITableViewController

@property (strong, nonatomic) NSDictionary *teamDic;
@property (strong, nonatomic) NSArray *groupNameList;

@end

NS_ASSUME_NONNULL_END
