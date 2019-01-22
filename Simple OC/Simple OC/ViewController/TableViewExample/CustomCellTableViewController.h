//
//  CustomCellTableViewController.h
//  Simple OC
//
//  Created by summer on 2019/1/15.
//  Copyright © 2019年 sandrew. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CustomTableCell.h"

NS_ASSUME_NONNULL_BEGIN

@interface CustomCellTableViewController : UITableViewController <UISearchBarDelegate, UISearchResultsUpdating>

@property (strong, nonatomic) NSArray *teams;
@property (strong, nonatomic) NSMutableArray *filterTeams;
@property (strong, nonatomic) UISearchController *searchController;

@end

NS_ASSUME_NONNULL_END
