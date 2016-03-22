//
//  ListTableViewController.m
//  QQList
//
//  Created by 黄斌超 on 15/9/6.
//  Copyright (c) 2015年 bingoc. All rights reserved.
//

#import "ListTableViewController.h"
#import "JKFriendsModel.h"
#import "JKGroupModel.h"
#import "HeaderView.h"
#import "ViewController.h"

@interface ListTableViewController ()<HeaderViewDelegate>
@property (nonatomic ,strong)NSArray *dataArray;

@end

@implementation ListTableViewController

- (NSArray *)dataArray{
    if(!_dataArray){
        NSString *path = [[NSBundle mainBundle]pathForResource:@"friends.plist" ofType:nil];
        NSArray *array = [NSArray arrayWithContentsOfFile:path];
        NSMutableArray *muArray = [NSMutableArray arrayWithCapacity:array.count];
        for(NSDictionary *dict in array){
            JKGroupModel *groupModel = [JKGroupModel GroupWithDict:dict];
            [muArray addObject:groupModel];
        }
        _dataArray = [muArray copy];

    }
    return _dataArray;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.sectionHeaderHeight = 40;
    [self clipExtraCellLine:self.tableView];
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;

    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return self.dataArray.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    JKGroupModel *groupModel = self.dataArray[section];
    NSInteger count =groupModel.isOpen ? groupModel.friends.count :0;

    return count;
}


 - (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
     static NSString *identifier = @"friendCell";
     UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier   ];
     if(!cell){
         cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:identifier];

     }
     JKGroupModel *groupModel = self.dataArray[indexPath.section];
     JKFriendsModel *friendModel = groupModel.friends[indexPath.row];
     cell.imageView.image = [UIImage imageNamed:friendModel.icon];
     cell.textLabel.text = friendModel.name;
     cell.detailTextLabel.text = friendModel.intro;
     


 return cell;
 }
#pragma mark - UITableView delegate
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    HeaderView *header = [HeaderView headerView:tableView];
    header.delegate = self;
    header.groupModel = self.dataArray[section];
    return header;
}
- (void)clickView{
    [self.tableView reloadData];
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    ViewController *viewCtrl = [[ViewController alloc]init];
    //viewCtrl.view.backgroundColor = [UIColor redColor];
    [self.navigationController pushViewController:viewCtrl animated:NO];
}
#pragma  mark -去除多余的
- (void)clipExtraCellLine:(UITableView *)tableView {
    UIView *view = [[UIView alloc] init];
    view.backgroundColor = [UIColor clearColor];
    [self.tableView setTableFooterView:view];
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
