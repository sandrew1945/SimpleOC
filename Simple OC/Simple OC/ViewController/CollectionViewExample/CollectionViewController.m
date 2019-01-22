//
//  CollectionViewController.m
//  Simple OC
//
//  Created by summer on 2019/1/14.
//  Copyright © 2019年 sandrew. All rights reserved.
//

#import "CollectionViewController.h"
#import "EventCollectionViewCell.h"

@interface CollectionViewController ()

@end

@implementation CollectionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    NSString *plistPath = [[NSBundle mainBundle] pathForResource:@"events" ofType:@"plist"];
    self.eventArray = [[NSArray alloc] initWithContentsOfFile:plistPath];
    self.view.backgroundColor = [UIColor whiteColor];
    [self setupCollectionView];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
#pragma mark - init flow layout
static NSString *CELLECTION_CELL_INDENTIFIER = @"collectionCellIdentifier";
- (void)setupCollectionView
{
    UICollectionViewFlowLayout * flowLayout = [[UICollectionViewFlowLayout alloc] init];
    flowLayout.itemSize = CGSizeMake(101, 101);
    flowLayout.sectionInset = UIEdgeInsetsMake(15, 15, 30, 15);
    CGRect screen = [[UIScreen mainScreen] bounds];
    if (screen.size.width > 568)
    {
        flowLayout.itemSize = CGSizeMake(100, 100);
        flowLayout.sectionInset = UIEdgeInsetsMake(15, 20, 15, 15);
    }
    flowLayout.minimumInteritemSpacing = 10;
    self.collectionView = [[UICollectionView alloc] initWithFrame:self.view.frame collectionViewLayout:flowLayout];
    // 设置可重用单元格标识与单元格类型
    [self.collectionView registerClass:[EventCollectionViewCell class] forCellWithReuseIdentifier:CELLECTION_CELL_INDENTIFIER];
    self.collectionView.backgroundColor = [UIColor whiteColor];
    self.collectionView.delegate = self;
    self.collectionView.dataSource = self;
    [self.view addSubview:self.collectionView];
}

#pragma mark - Implememt UICollectionViewDataSource UICollectionViewDelegate
#define COL_NUM 3
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    int num = [self.eventArray count] % COL_NUM;
    if (num == 0)
    {
        return [self.eventArray count] / COL_NUM;
    }
    else
    {
        return ([self.eventArray count] / COL_NUM) + 1;
    }
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return COL_NUM;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    EventCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:CELLECTION_CELL_INDENTIFIER forIndexPath:indexPath];
    NSInteger idx = indexPath.section * COL_NUM + indexPath.row;
    if (self.eventArray.count <= idx)
    {
        return cell;
    }
    NSDictionary *event = self.eventArray[idx];
    cell.imageView.image = [UIImage imageNamed:event[@"image"]];
    cell.title.text = event[@"name"];
    return cell;
    
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    NSDictionary *selectedEvent = [self.eventArray objectAtIndex:indexPath.section * COL_NUM + indexPath.row];
    NSLog(@"selected event is:%@", selectedEvent[@"name"]);
//    NSLog(@"%@", cell.title.text);
}
@end
