//
//  StackLayoutViewController.m
//  Simple OC
//
//  Created by summer on 2019/1/22.
//  Copyright © 2019 sandrew. All rights reserved.
//

#import "StackLayoutViewController.h"

@interface StackLayoutViewController ()

@end

@implementation StackLayoutViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    [self creatLayout];
}

#pragma mark - initLayout
- (void)creatLayout
{
    UIStackView *fatherView = [[UIStackView alloc] init];
    fatherView.translatesAutoresizingMaskIntoConstraints = NO;
    
    
    fatherView.axis = UILayoutConstraintAxisVertical;
    fatherView.alignment = UIStackViewAlignmentFill;
    fatherView.distribution = UIStackViewDistributionFillEqually;
    fatherView.spacing = 20;
    
    
    [self.view addSubview:fatherView];
    [self putView:fatherView CenterIn:self.view];
    
    for (NSInteger i = 0; i < 4; i++) {
        UIView *view = [[UIView alloc] init];
        view.backgroundColor = [UIColor colorWithRed:random()%256/255.0 green:random()%256/255.0 blue:random()%256/255.0 alpha:1];
        [fatherView addArrangedSubview:view];
    }
    
//    UIStackView *childView = [[UIStackView alloc] init];
//    childView.translatesAutoresizingMaskIntoConstraints = NO;
//    [fatherView addArrangedSubview:childView];
//    [self putView:childView HalfIn:fatherView];
}

- (void)putView:(id)subView CenterIn:(id)superView
{
    NSLayoutConstraint *consX = [NSLayoutConstraint constraintWithItem:subView attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:superView attribute:NSLayoutAttributeCenterX multiplier:1 constant:0];
    NSLayoutConstraint *consY = [NSLayoutConstraint constraintWithItem:subView attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:superView attribute:NSLayoutAttributeCenterY multiplier:1 constant:0];
    NSLayoutConstraint *consWidth = [NSLayoutConstraint constraintWithItem:subView attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:superView attribute:NSLayoutAttributeWidth multiplier:1 constant:-10];
    NSLayoutConstraint *consHight = [NSLayoutConstraint constraintWithItem:subView attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:superView attribute:NSLayoutAttributeHeight multiplier:1 constant:-140];
    [superView addConstraint:consX];
    [superView addConstraint:consY];
    [superView addConstraint:consWidth];
    [superView addConstraint:consHight];
}

- (void)putView:(id)subView HalfIn:(id)superView
{
//    NSLayoutConstraint *consX = [NSLayoutConstraint constraintWithItem:subView attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:superView attribute:NSLayoutAttributeCenterX multiplier:1 constant:0];
//    NSLayoutConstraint *consB = [NSLayoutConstraint constraintWithItem:subView attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:superView attribute:NSLayoutAttributeBottom multiplier:1 constant:0];
    NSLayoutConstraint *consWidth = [NSLayoutConstraint constraintWithItem:subView attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:superView attribute:NSLayoutAttributeWidth multiplier:1 constant:-10];
    NSLayoutConstraint *consHight = [NSLayoutConstraint constraintWithItem:subView attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:superView attribute:NSLayoutAttributeHeight multiplier:0.1 constant:-5];
//    [superView addConstraint:consX];
//    [superView addConstraint:consB];
    [superView addConstraint:consWidth];
    [superView addConstraint:consHight];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
