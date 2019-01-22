//
//  SwithSliderViewController.m
//  Simple OC
//
//  Created by summer on 2019/1/9.
//  Copyright © 2019年 sandrew. All rights reserved.
//

#import "SwithSliderViewController.h"

@interface SwithSliderViewController ()

@property (strong, nonatomic) UISwitch *leftSwitch;
@property (strong, nonatomic) UISwitch *rightSwitch;
@property (strong, nonatomic) UILabel *sliderValue;

@end

@implementation SwithSliderViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    CGRect screen = [[UIScreen mainScreen] bounds];
    // 初始化SWITCH
    [self initSwitch:screen];
    // 初始化Segment
    [self initSegmentBar:screen];
    // 初始化SliderBar
    [self initSliderBar:screen];
    
    
    
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

#pragma mark - init Controllers
/*
    初始化switch
 */
- (void)initSwitch:(CGRect)screen
{
    CGFloat switchScreenSpace = 40;
    // 添加leftSwitch控件
    self.leftSwitch = [[UISwitch alloc] init];
    CGRect frame = self.leftSwitch.frame;
    frame.origin = CGPointMake(switchScreenSpace, 90);
    self.leftSwitch.frame = frame;
    self.leftSwitch.on = TRUE;
    [self.leftSwitch addTarget:self action:@selector(switchChanged:) forControlEvents:UIControlEventValueChanged];
    [self.view addSubview:self.leftSwitch];
    
    // 添加rightSwith控件
    self.rightSwitch = [[UISwitch alloc] init];
    frame = self.rightSwitch.frame;
    frame.origin = CGPointMake(screen.size.width - (frame.size.width + switchScreenSpace), 90);
    self.rightSwitch.frame = frame;
    self.rightSwitch.on = YES;
    [self.rightSwitch addTarget:self action:@selector(switchChanged:) forControlEvents:UIControlEventValueChanged];
    [self.view addSubview:self.rightSwitch];
}

/*
    初始化segment
 */
- (void)initSegmentBar:(CGRect)screen
{
    NSArray *segmentItems = @[@"Show", @"Hidden"];
    UISegmentedControl *segmentBar = [[UISegmentedControl alloc] initWithItems:segmentItems];
    
    CGFloat sBWidth = 220;
    CGFloat sBHeight = 29;
    CGFloat sBTopDist = 186;
    CGRect sBRect = CGRectMake((screen.size.width - sBWidth)/2, sBTopDist, sBWidth, sBHeight);
    segmentBar.frame = sBRect;
    [segmentBar addTarget:self action:@selector(segmentChange:) forControlEvents:UIControlEventValueChanged];
    
    [self.view addSubview:segmentBar];
    
}

- (void)initSliderBar:(CGRect)screen
{
//    self.sliderValue = [[UILabel alloc] initWithFrame:<#(CGRect)#>];
    CGFloat sliderWidth = 300;
    CGFloat sliderHeight = 31;
    CGFloat sliderTopDist = 298;
    
    UISlider *sliderBar = [[UISlider alloc] initWithFrame:CGRectMake((screen.size.width - sliderWidth)/2, sliderTopDist, sliderWidth, sliderHeight)];
    [sliderBar setMinimumValue:0.0f];
    [sliderBar setMaximumValue:100.0f];
    [sliderBar setValue:50.0f];
    [sliderBar addTarget:self action:@selector(sliderDraw:) forControlEvents:UIControlEventValueChanged];
    // 添加slider bar value
    CGFloat labelSliderBarSpace = 20;
    CGRect sliderLabelFrame = CGRectMake(sliderBar.frame.origin.x, (sliderBar.frame.origin.y - labelSliderBarSpace), 200, 21);
    self.sliderValue = [[UILabel alloc] initWithFrame:sliderLabelFrame];
    NSString *sliderBarTextValue = [NSString stringWithFormat:@"%d", (int)sliderBar.value];
    NSString *value = [@"Slider value:" stringByAppendingString:sliderBarTextValue];
    [self.sliderValue setText:value];
    [self.view addSubview:sliderBar];
    [self.view addSubview:self.sliderValue];
    
}

#pragma mark - Actions
- (void)switchChanged:(id)sender
{
    UISwitch *witchSwitch = (UISwitch *)sender;
    BOOL isOn = witchSwitch.isOn;
    [self.leftSwitch setOn:isOn animated:YES];
    [self.rightSwitch setOn:isOn animated:YES];
}

- (void)segmentChange:(id)sender
{
    UISegmentedControl *changedSegment = (UISegmentedControl *)sender;
    NSInteger index = [changedSegment selectedSegmentIndex];
    NSLog(@"选择的segment %ld", (long)index);
    if (index == 0)
    {
        [self.leftSwitch setHidden:NO];
        [self.rightSwitch setHidden:NO];
    }
    else if (index == 1)
    {
        [self.leftSwitch setHidden:YES];
        [self.rightSwitch setHidden:YES];
    }
}

- (void)sliderDraw:(id)sender
{
    UISlider *drawSlider = (UISlider *)sender;
    NSString *changedTextValue = [NSString stringWithFormat:@"%d", (int)drawSlider.value];
    [self.sliderValue setText:[@"Slider value:" stringByAppendingString:changedTextValue]];
}



@end
