//
//  StaticTableLayoutViewController.m
//  Simple OC
//
//  Created by summer on 2019/1/18.
//  Copyright © 2019年 sandrew. All rights reserved.
//

#import "StaticTableLayoutViewController.h"

@interface StaticTableLayoutViewController ()

@end

@implementation StaticTableLayoutViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.rowHeight = 44;
    self.tableView.estimatedRowHeight = 44;
    self.tableView.separatorInset = UIEdgeInsetsMake(0, 0, 0, 0);   // 填充tableviewCell的bottom空白
    
    [self.tableView setTableFooterView:[[UIView alloc] init]];  // 去掉多余的cell
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"reuseIdentifier"];
}

- (void)viewWillAppear:(BOOL)animated
{
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(onKeyboardShow:) name:UIKeyboardDidShowNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(onKeyboardHidden:) name:UIKeyboardDidHideNotification object:nil];
}

- (void)viewWillDisappear:(BOOL)animated
{
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UIKeyboardDidShowNotification object:nil];
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UIKeyboardDidHideNotification object:nil];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 3;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    switch (section) {
        case 0:
            return 2;
        case 1:
            return 1;
        case 2:
            return 1;
    }
    return 0;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"reuseIdentifier" forIndexPath:indexPath];
    
    // Configure the cell...
    switch (indexPath.section) {
        case 0:
            switch (indexPath.row) {
                case 0:
                {
                    // 构建用户名input
                    [self initTextInputWithCell:cell AndTextField:_userName AndPlaceholder:@"用户名" IsPassword:false];
                    break;
                }
                default:
                    [self initTextInputWithCell:cell AndTextField:self.password AndPlaceholder:@"密    码" IsPassword:true];
                    break;
            }
            break;
        case 1:
            [self initLoginBtnWithCell:cell AndLoginBtn:self.loginBtn];
            break;
        default:
            cell.textLabel.text = @"创建用户账号";
            cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
            break;
    }
    return cell;
}

#pragma mark - textfield
- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    NSLog(@"TextField获取焦点，点击return键");
    [textField resignFirstResponder];
    return true;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    switch (section) {
        case 0:
            return 0.f;
        default:
            return 40.f;
    }
}

- (NSString *)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section
{
    return @"";
}


#pragma mark - init controls
// 初始化textField
- (void)initTextInputWithCell:(UITableViewCell *) aCell AndTextField:(UITextField *) aTextField AndPlaceholder:(NSString *)placeholder IsPassword:(BOOL)isPassword
{
    aTextField = [[UITextField alloc] init];
    [aTextField setPlaceholder:placeholder];
    if (isPassword)
    {
            aTextField.secureTextEntry = YES;
    }
    aTextField.delegate = self;
    aTextField.translatesAutoresizingMaskIntoConstraints = NO;
    [aCell addSubview:aTextField];
    [self putView:aTextField CenterIn:aCell];
}

// 初始化登录按钮
- (void)initLoginBtnWithCell:(UITableViewCell *) aCell AndLoginBtn:(UIButton *) aBtn
{
    self.loginBtn = [UIButton buttonWithType:UIButtonTypeSystem];
    [self.loginBtn setTitle:@"登  录" forState:UIControlStateNormal];
    [aCell addSubview:self.loginBtn];
    self.loginBtn.translatesAutoresizingMaskIntoConstraints = NO;
    [self putView:self.loginBtn CenterIn:aCell];

}

#pragma mark - layout
- (void)putView:(id)subView CenterIn:(id)superView
{
    NSLayoutConstraint *consX = [NSLayoutConstraint constraintWithItem:subView attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:superView attribute:NSLayoutAttributeCenterX multiplier:1 constant:0];
    NSLayoutConstraint *consY = [NSLayoutConstraint constraintWithItem:subView attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:superView attribute:NSLayoutAttributeCenterY multiplier:1 constant:0];
    NSLayoutConstraint *consWidth = [NSLayoutConstraint constraintWithItem:subView attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:superView attribute:NSLayoutAttributeWidth multiplier:1 constant:-10];
    NSLayoutConstraint *consHight = [NSLayoutConstraint constraintWithItem:subView attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:superView attribute:NSLayoutAttributeHeight multiplier:1 constant:-5];
    [superView addConstraint:consX];
    [superView addConstraint:consY];
    [superView addConstraint:consWidth];
    [superView addConstraint:consHight];
}

#pragma mark - Actions
- (void)onKeyboardShow:(id)sender
{
    NSLog(@"keyboard is show !");
}

- (void)onKeyboardHidden:(id)sender
{
    NSLog(@"keyboard is hidden !");
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
#pragma mark - Table view delegate

// In a xib-based application, navigation from a table can be handled in -tableView:didSelectRowAtIndexPath:
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    // Navigation logic may go here, for example:
    // Create the next view controller.
    <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:<#@"Nib name"#> bundle:nil];
    
    // Pass the selected object to the new view controller.
    
    // Push the view controller.
    [self.navigationController pushViewController:detailViewController animated:YES];
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
