//
//  CustomTableCell.m
//  Simple OC
//
//  Created by summer on 2019/1/15.
//  Copyright © 2019年 sandrew. All rights reserved.
//

#import "CustomTableCell.h"

@implementation CustomTableCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}


//
//  初始化cell
//
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self)
    {
        CGFloat imageWidth = 39;
        CGFloat imageHeight = 28;
        CGFloat imageLeftDist = 300;
        self.imgView = [[UIImageView alloc] initWithFrame:CGRectMake(imageLeftDist, (self.frame.size.height - imageHeight)/2, imageWidth, imageHeight)];
        [self addSubview:self.imgView];
        
        CGFloat titleWidth = 120;
        CGFloat titleHeight = 21;
        CGFloat titleLeftDist = 15;
        self.title = [[UILabel alloc] initWithFrame:CGRectMake(titleLeftDist, (self.frame.size.height - titleHeight)/2, titleWidth, titleHeight)];
        [self addSubview:self.title];
    }

    
    return self;
}

@end
