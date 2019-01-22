//
//  PickViewController.m
//  Simple OC
//
//  Created by summer on 2019/1/11.
//  Copyright © 2019年 sandrew. All rights reserved.
//

#import "PickViewController.h"

@interface PickViewController ()

@end

@implementation PickViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    CGRect screen = [[UIScreen mainScreen] bounds];
    [self initData];
    [self initPickView:screen];
    [self initLabel:screen];
    [self initButton:screen];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
#pragma mark init Data
- (void)initData
{
    NSString *dataPath = [[NSBundle mainBundle] pathForResource:@"nativeplace" ofType:@"plist"];
    NSDictionary *dict = [[NSDictionary alloc] initWithContentsOfFile:dataPath];
    self.pickData = dict;
    self.provinceData = [dict allKeys];
    self.cityData = [dict objectForKey:[self.provinceData objectAtIndex:0]];    // 默认获取第一个省份的城市
}

#pragma mark - init controls
- (void)initPickView:(CGRect)screen
{
    CGFloat pickViewWidth = screen.size.width * 1;
    CGFloat pickViewHeight = 162;
    CGFloat pickViewTopDist = 20;
    self.pickView = [[UIPickerView alloc] initWithFrame:CGRectMake(0, pickViewTopDist, pickViewWidth, pickViewHeight)];
    self.pickView.dataSource = self;
    self.pickView.delegate = self;
    [self.view addSubview:self.pickView];
}

- (void)initLabel:(CGRect)screen
{
    CGFloat labelWidth = 200;
    CGFloat labelHeight = 21;
    CGFloat labelTopDist = 273;
    self.label = [[UILabel alloc] initWithFrame:CGRectMake((screen.size.width - labelWidth)/2, labelTopDist, labelWidth, labelHeight)];
    [self.label setText:@"请选择"];
    self.label.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:self.label];
}

- (void)initButton:(CGRect)screen
{
    CGFloat btnWidth = 46;
    CGFloat btnHeight = 30;
    CGFloat btnTopDist = 374;
    UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake((screen.size.width - btnWidth)/2, btnTopDist, btnWidth, btnHeight)];
    [button setTitle:@"Click" forState:UIControlStateNormal];
    button.layer.backgroundColor = [[UIColor blueColor] CGColor];
    button.layer.borderWidth = 1.0f;
    [button addTarget:self action:@selector(onClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
}

#pragma mark - implement UIPickViewDelegate UIPickViewDataSource
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 2;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    switch (component) {
        case 0:
            return [self.provinceData count];
            break;
        case 1:
            return [self.cityData count];
            break;
        default:
            return 0;
            break;
    }
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    switch (component) {
        case 0:
            return [self.provinceData objectAtIndex:row];
            break;
        case 1:
            return [self.cityData objectAtIndex:row];
            break;
        default:
            return @"error";
            break;
    }
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    switch (component) {
        case 0:
        {
            NSString *selectedProvince = [self.provinceData objectAtIndex:row];
            NSArray *citiesArray = [self.pickData objectForKey:selectedProvince];
            self.cityData = citiesArray;
            [self.pickView reloadComponent:1];
            break;
        }
        default:
            break;
    }
}

#pragma mark - Actions
- (void)onClick:(id)sender
{
    NSInteger selectedProvinceIdx = [self.pickView selectedRowInComponent:0];
    NSInteger selectedCityIdx = [self.pickView selectedRowInComponent:1];
    
    NSString *selectedProvince = [self.provinceData objectAtIndex:selectedProvinceIdx];
    NSString *selectedCity = [self.cityData objectAtIndex:selectedCityIdx];
    NSString *text = [[NSString alloc] initWithFormat:@"%@ %@", selectedProvince, selectedCity];
    [self.label setText:text];
}
@end
