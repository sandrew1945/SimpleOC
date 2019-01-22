//
//  RefreshTableViewController.m
//  Simple OC
//
//  Created by summer on 2019/1/16.
//  Copyright © 2019年 sandrew. All rights reserved.
//

#import "RefreshTableViewController.h"

@interface RefreshTableViewController ()

@end

@implementation RefreshTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    self.view.backgroundColor = [UIColor whiteColor];
    [self initData];
    [self initFreshControl];
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:CELL_INDENTIFIER];
}

#pragma mark - init Data
- (void)initData
{
    self.tableData = [[NSMutableArray alloc] init];
    NSDate *date = [[NSDate alloc] init];
    [self.tableData addObject:date];
}

#pragma mark - init refresh control
- (void)initFreshControl
{
    UIRefreshControl *fresher = [[UIRefreshControl alloc] init];
    [fresher setAttributedTitle:[[NSAttributedString alloc] initWithString:@"下拉刷新"]];
    [fresher addTarget:self action:@selector(fresh:) forControlEvents:UIControlEventValueChanged];
    self.refreshControl = fresher;
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.tableData count];
}

static NSString *CELL_INDENTIFIER = @"reuseIdentifier";
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CELL_INDENTIFIER forIndexPath:indexPath];
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"yyyy-MM-dd HH:mm:ss zzz"];
    cell.textLabel.text = [formatter stringFromDate:[self.tableData objectAtIndex:[indexPath row]]];
    // Configure the cell...
    
    return cell;
}

#pragma mark - Actions
- (void)fresh:(id)sender
{
    [self.refreshControl setAttributedTitle:[[NSAttributedString alloc] initWithString:@"努力加载中......"]];
    
    NSDate *date = [[NSDate alloc] init];
    [self.tableData addObject:date];
    
    [self.refreshControl endRefreshing];
    self.refreshControl.attributedTitle = [[NSAttributedString alloc] initWithString:@"下拉刷新"];
    [self.tableView reloadData];
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
