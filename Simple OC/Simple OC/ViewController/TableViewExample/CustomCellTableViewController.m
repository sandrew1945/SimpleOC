//
//  CustomCellTableViewController.m
//  Simple OC
//
//  Created by summer on 2019/1/15.
//  Copyright © 2019年 sandrew. All rights reserved.
//

#import "CustomCellTableViewController.h"

@interface CustomCellTableViewController ()

@end

@implementation CustomCellTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    [self parseData];
    [self.tableView registerClass:[CustomTableCell class] forCellReuseIdentifier:CELL_INDENTIFIER];
    [self initSearchBar];
}

#pragma mark - init Data
- (void)parseData
{
    NSString *teamDataPath = [[NSBundle mainBundle] pathForResource:@"team" ofType:@"plist"];
    self.teams = [[NSArray alloc] initWithContentsOfFile:teamDataPath];
    self.filterTeams = self.teams;
}

#pragma mark - init SearchBar
- (void)initSearchBar
{
    self.searchController = [[UISearchController alloc] initWithSearchResultsController:nil];
    self.searchController.searchResultsUpdater = self;
    self.searchController.dimsBackgroundDuringPresentation = FALSE;
//    self.searchController.delegate = self;
    self.tableView.tableHeaderView = self.searchController.searchBar;
    [self.searchController.searchBar sizeToFit];
    
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.filterTeams count];
}

static NSString *CELL_INDENTIFIER = @"reuseIdentifier";
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    CustomTableCell *cell = [tableView dequeueReusableCellWithIdentifier:CELL_INDENTIFIER forIndexPath:indexPath];
    cell.title.text = [self.filterTeams[indexPath.row] objectForKey:@"name"];
    NSString *image = [[NSString alloc] initWithFormat:@"%@.png", [self.filterTeams[indexPath.row] objectForKey:@"image"]];
    cell.imgView.image = [UIImage imageNamed:image];
    // Configure the cell...
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    return cell;
}

//#pragma mark - UISearchBarDelegate
//- (void)searchBar:(UISearchBar *)searchBar selectedScopeButtonIndexDidChange:(NSInteger)selectedScope
//{
//    [self updateSearchResultsForSearchController:self.searchController];
//}

#pragma mark - UISearchResultUpdating
- (void)updateSearchResultsForSearchController:(UISearchController *)searchController
{
    NSString *keyword = self.searchController.searchBar.text;
    [self filterContentForKeyword:keyword];
    [self.tableView reloadData];
}



#pragma mark - custom function
- (void)filterContentForKeyword:(NSString *)keyword
{
    if (keyword.length == 0)
    {
        self.filterTeams = [NSMutableArray arrayWithArray:self.teams];
        return;
    }
    NSPredicate *scopeRred = [NSPredicate predicateWithFormat:@"SELF.name contains[c] %@", keyword];
    NSArray *tmpArray = [self.teams filteredArrayUsingPredicate:scopeRred];
    self.filterTeams = [NSMutableArray arrayWithArray:tmpArray];
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
