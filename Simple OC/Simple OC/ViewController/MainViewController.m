//
//  MainViewController.m
//  Simple OC
//
//  Created by summer on 2019/1/7.
//  Copyright © 2019年 sandrew. All rights reserved.
//

#import "MainViewController.h"

@interface MainViewController ()

@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.backgroundColor = [UIColor grayColor];
    self.title = @"Demo";
    [self initTableView];
    [self initTableDate];
//    UIButton *helloWordBtn = [UIButton buttonWithType:UIButtonTypeSystem];
//    [helloWordBtn setTitle:@"Hello World!" forState:UIControlStateNormal];
//
//    CGFloat btnWidth = 90;
//    CGFloat btnHeight = 20;
//    CGFloat btnTopDis = 240;
//    CGRect screen = [[UIScreen mainScreen] bounds];
//    helloWordBtn.frame = CGRectMake((screen.size.width - btnWidth)/2, btnTopDis, btnWidth, btnHeight);
//    [self.view addSubview:helloWordBtn];
    // Do any additional setup after loading the view from its nib.
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.tableData count];
}

static NSString *CELL_INDENTIFIER = @"cellIdentifier";
-(UITableViewCell*) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CELL_INDENTIFIER forIndexPath:indexPath];
//    NSArray *rows = [[self.tableData objectAtIndex:indexPath.section] allValues].firstObject;
//    NSString *className = [[rows objectAtIndex:indexPath.row] allValues].firstObject;
//    NSString *title = [[rows objectAtIndex:indexPath.row] allKeys].firstObject;
//    if (cell == nil) {
//        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CELL_INDENTIFIER];
//        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
//        cell.detailTextLabel.lineBreakMode = NSLineBreakByCharWrapping;
//        cell.detailTextLabel.numberOfLines = 0;
//        cell.detailTextLabel.font = [UIFont systemFontOfSize:12];
//        cell.detailTextLabel.textColor = [UIColor lightGrayColor];
//        cell.textLabel.font = [UIFont systemFontOfSize:13];
//        cell.textLabel.textColor = [UIColor blackColor];
//    }
//
//    cell.detailTextLabel.text = className;
//    cell.textLabel.text = title;
    NSInteger index = [indexPath row];
    NSDictionary *dic = [self.tableData objectAtIndex:index];
    NSString *title =  [dic objectForKey:@"title"];
    cell.textLabel.text = title;
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    return cell;
}


-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 60.f;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 30.f;
}

//-(UIView*)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
//    UILabel *label = [[UILabel alloc] init];
//    label.backgroundColor = [UIColor redColor];//RGB(255,255,255);
//    label.font = [UIFont systemFontOfSize:14];
//    label.textColor = [UIColor whiteColor];//RGB(255,255,255);
//    label.text = [[self.tableData objectAtIndex:section] allKeys].firstObject;
//    label.numberOfLines = 1;
//    [label sizeToFit];
//    return label;
//}

#pragma mark - UITableViewDelegate
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
//    NSArray *rows = [[self.tableData objectAtIndex:indexPath.section] allValues].firstObject;
//    NSString *className = [[rows objectAtIndex:indexPath.row] allValues].firstObject;
//    NSString *title = [[rows objectAtIndex:indexPath.row] allKeys].firstObject;
    NSString *className = [[self.tableData objectAtIndex:indexPath.row] objectForKey:@"controller"];
    NSLog(@"className ============= %@", className);
    UIViewController *subViewController = [[NSClassFromString(className) alloc] init];
    subViewController.title = [[self.tableData objectAtIndex:indexPath.row] objectForKey:@"title"];
    [self.navigationController pushViewController:subViewController animated:YES];
}

# pragma mark - init TableView
- (void)initTableView
{
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:CELL_INDENTIFIER];
}

- (void)initTableDate
{
    self.tableData = @[
                       @{@"title":@"HelloWord-小栗子", @"controller":@"HelloWorldViewController"},
                       @{@"title":@"TextFileView-小栗子", @"controller":@"TextViewController"},
                       @{@"title":@"Switch/Slider-小栗子", @"controller":@"SwithSliderViewController"},
                       @{@"title":@"WKWebView-小栗子", @"controller":@"WebViewController"},
                       @{@"title":@"Alert/ActionSheet-小栗子", @"controller":@"AlertViewAndActionSheetViewController"},
                       @{@"title":@"ProgessBar-小栗子", @"controller":@"ProgressBarViewController"},
                       @{@"title":@"PickView-小栗子", @"controller":@"PickViewController"},
                       @{@"title":@"FlowLayout-小栗子", @"controller":@"CollectionViewController"},
                       @{@"title":@"Custom Cell-小栗子", @"controller":@"CustomCellTableViewController"},
                       @{@"title":@"Section Tableview-小栗子", @"controller":@"SectionTableViewController"},
                       @{@"title":@"Refresh Tableview-小栗子", @"controller":@"RefreshTableViewController"},
                       @{@"title":@"StaticTable Layout-小栗子", @"controller":@"StaticTableLayoutViewController"},
                       @{@"title":@"StackLayout-小栗子", @"controller":@"StackLayoutViewController"}
                     ];
//    self.tableData = @[@{@"菜单":@[@{@"弹出菜单":@"PopupMenuTableViewController"}]},
//                       @{@"列表":@[@{@"列表操作":@"TableViewController"}]},
//                       @{@"页面":@[@{@"公共页面":@"PublicPageTableViewController"}]},
//                       @{@"验证":@[@{@"各种验证":@"VerificationTableViewController"}]},
//                       @{@"控件":@[@{@"控件":@"WidgetTableViewController"}]},
//                       @{@"加密":@[@{@"各种加密":@"CiphertextViewController"}]},
//                       @{@"生命周期":@[@{@"生命周期":@"LifeCycleAViewController"}]},
//                       @{@"网络通信":@[@{@"Socket通信":@"SocketViewController"},
//                                   @{@"单接口调用":@"APITableViewController"},
//                                   @{@"多接口同时调用":@"MutableViewController"}]},
//                       @{@"并发":@[@{@"NSOperation并发":@"OperationViewController"},
//                                 @{@"GCD":@"GCDViewController"}]},
//                       @{@"传感器":@[@{@"传感器":@"SensorViewController"},
//                                  @{@"语音提示":@"SpeechViewController"}]},
//                       @{@"二维码":@[@{@"生成二维码":@"CreateQRCodeController"},
//                                  @{@"读取二维码":@"ScanQRCodeController"}]},
//                       @{@"多媒体":@[@{@"流媒体":@"SteamingMediaController"}]},
//                       @{@"控件点击":@[@{@"ClickEvent":@"ClickEventViewController"}]},
//                       @{@"代码块":@[@{@"Block":@"BlockViewController"}]}];
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
