//
//  EventCollectionViewCell.m
//  Simple OC
//
//  Created by summer on 2019/1/14.
//  Copyright © 2019年 sandrew. All rights reserved.
//

#import "EventCollectionViewCell.h"

@implementation EventCollectionViewCell

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    // 单元格的宽度
    CGFloat cellWidth = self.frame.size.width;
    CGFloat imgWidth = 101;
    CGFloat imgHeight = 101;
    CGFloat imgTopDist = 15;
    self.imageView = [[UIImageView alloc] initWithFrame:CGRectMake((cellWidth - imgWidth)/2, imgTopDist, imgWidth, imgHeight)];
    [self addSubview:self.imageView];
    
    CGFloat titleWidth = 101;
    CGFloat titleHeight = 16;
    CGFloat titleTopDist = 120;
    self.title = [[UILabel alloc] initWithFrame:CGRectMake((cellWidth - titleWidth)/2, titleTopDist, titleWidth, titleHeight)];
    self.title.textAlignment = NSTextAlignmentCenter;
    self.title.font = [UIFont systemFontOfSize:13];
    [self addSubview:_title];
    return self;
}

@end
