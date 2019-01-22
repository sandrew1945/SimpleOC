//
//  CollectionViewController.h
//  Simple OC
//
//  Created by summer on 2019/1/14.
//  Copyright © 2019年 sandrew. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface CollectionViewController : UIViewController <UICollectionViewDelegate, UICollectionViewDataSource>

@property (strong, nonatomic) NSArray *eventArray;
@property (strong, nonatomic) UICollectionView *collectionView;

@end

NS_ASSUME_NONNULL_END
