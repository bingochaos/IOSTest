//
//  BCMainViewController.m
//  UITableView
//
//  Created by 黄斌超 on 15/9/8.
//  Copyright (c) 2015年 bingoc. All rights reserved.
//

#import "BCMainViewController.h"
#import "BCContact.h"
#import "BCContactGroup.h"

@interface BCMainViewController ()<UITableViewDataSource,UITableViewDelegate,UIAlertViewDelegate,UISearchBarDelegate>{
    UITableView *_tableView;
    NSMutableArray *_contacts;
    NSIndexPath *_selectedIndexPath;
    UISearchBar *_searchBar;
    BOOL _isSearching;
}

@end

@implementation BCMainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initData];
    _tableView = [[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
    _tableView.dataSource = self;
    _tableView.delegate = self;
    [self addSearchBar];
    [self.view addSubview:_tableView];

    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark 加载数据
-(void)initData{
    _contacts=[[NSMutableArray alloc]init];

    BCContact *contact1=[BCContact initWithFirstName:@"Cui" andLastName:@"Kenshin" andPhoneNumber:@"18500131234"];
    BCContact *contact2=[BCContact initWithFirstName:@"Cui" andLastName:@"Tom" andPhoneNumber:@"18500131237"];
    BCContactGroup *group1=[BCContactGroup initWithName:@"C" andDetail:@"With names beginning with C" andContacts:[NSMutableArray arrayWithObjects:contact1,contact2, nil]];
    [_contacts addObject:group1];



    BCContact *contact3=[BCContact initWithFirstName:@"Lee" andLastName:@"Terry" andPhoneNumber:@"18500131238"];
    BCContact *contact4=[BCContact initWithFirstName:@"Lee" andLastName:@"Jack" andPhoneNumber:@"18500131239"];
    BCContact *contact5=[BCContact initWithFirstName:@"Lee" andLastName:@"Rose" andPhoneNumber:@"18500131240"];
    BCContactGroup *group2=[BCContactGroup initWithName:@"L" andDetail:@"With names beginning with L" andContacts:[NSMutableArray arrayWithObjects:contact3,contact4,contact5, nil]];
    [_contacts addObject:group2];



    BCContact *contact6=[BCContact initWithFirstName:@"Sun" andLastName:@"Kaoru" andPhoneNumber:@"18500131235"];
    BCContact *contact7=[BCContact initWithFirstName:@"Sun" andLastName:@"Rosa" andPhoneNumber:@"18500131236"];

    BCContactGroup *group3=[BCContactGroup initWithName:@"S" andDetail:@"With names beginning with S" andContacts:[NSMutableArray arrayWithObjects:contact6,contact7, nil]];
    [_contacts addObject:group3];


    BCContact *contact8=[BCContact initWithFirstName:@"Wang" andLastName:@"Stephone" andPhoneNumber:@"18500131241"];
    BCContact *contact9=[BCContact initWithFirstName:@"Wang" andLastName:@"Lucy" andPhoneNumber:@"18500131242"];
    BCContact *contact10=[BCContact initWithFirstName:@"Wang" andLastName:@"Lily" andPhoneNumber:@"18500131243"];
    BCContact *contact11=[BCContact initWithFirstName:@"Wang" andLastName:@"Emily" andPhoneNumber:@"18500131244"];
    BCContact *contact12=[BCContact initWithFirstName:@"Wang" andLastName:@"Andy" andPhoneNumber:@"18500131245"];
    BCContactGroup *group4=[BCContactGroup initWithName:@"W" andDetail:@"With names beginning with W" andContacts:[NSMutableArray arrayWithObjects:contact8,contact9,contact10,contact11,contact12, nil]];
    [_contacts addObject:group4];


    BCContact *contact13=[BCContact initWithFirstName:@"Zhang" andLastName:@"Joy" andPhoneNumber:@"18500131246"];
    BCContact *contact14=[BCContact initWithFirstName:@"Zhang" andLastName:@"Vivan" andPhoneNumber:@"18500131247"];
    BCContact *contact15=[BCContact initWithFirstName:@"Zhang" andLastName:@"Joyse" andPhoneNumber:@"18500131248"];
    BCContactGroup *group5=[BCContactGroup initWithName:@"Z" andDetail:@"With names beginning with Z" andContacts:[NSMutableArray arrayWithObjects:contact13,contact14,contact15, nil]];
    [_contacts addObject:group5];

}
#pragma mark - 返回分组数
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    NSLog(@"计算分组数");
    return _contacts.count;
}
#pragma mark - 返回每组行数
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    NSLog(@"计算每组（组%li）行数",(long)section);
    BCContactGroup *contactGroup = _contacts[section];
    return  contactGroup.contacts.count;

}

#pragma mark - 返回每行单位格
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    NSLog(@"生成单元格(组：%li，行%li)",(long)indexPath.section,(long)indexPath.row);
    BCContactGroup *group = _contacts[indexPath.section];
    BCContact *contact = group.contacts[indexPath.row];

    static NSString *cellIdentifier = @"UITableViewCellIdentifierKey1";
    static NSString *cellIdentifierSwitch = @"UITableViewCellIdentifierSwitch";

    UITableViewCell *cell ;
    if(indexPath.row ==0){
        cell= [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    }else{
        cell=  [tableView dequeueReusableCellWithIdentifier:cellIdentifierSwitch];
    }
    if(!cell){
        if(indexPath.row ==0){
            cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:cellIdentifier];
            UISwitch *sw = [[UISwitch alloc]init];
            [sw addTarget:self action:@selector(switchValueChange:) forControlEvents:UIControlEventValueChanged];
            cell.accessoryView = sw;
        }else{

            cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:cellIdentifierSwitch];
            cell.accessoryType = UITableViewCellAccessoryDetailButton;
        }

    }
    if(indexPath.row == 0){
        ((UISwitch *)cell.accessoryView).tag = indexPath.section;

    }
    //    UITableViewCell *cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:nil];
    cell.textLabel.text = [contact getName];
    cell.detailTextLabel.text = contact.phoneNumber;
    return  cell;
}
#pragma mark - 返回每组标题
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    NSLog(@"生成组（组%li）名称",(long)section);
    BCContactGroup *group = _contacts[section];
    return group.name;
}
#pragma mark - 返回每组尾部说明
- (NSString *)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section{
    NSLog(@"生成尾部（组%li）详情",(long)section);
    BCContactGroup *group = _contacts[section];
    return group.detail;
}
#pragma mark - 返回每组标题索引
-(NSArray *)sectionIndexTitlesForTableView:(UITableView *)tableView{
    NSLog(@"生成组索引");
    NSMutableArray *indexs = [[NSMutableArray alloc]init];
    for(BCContactGroup *group in _contacts){
        [indexs addObject:group.name];
    }
    return indexs;
}

#pragma mark - 代理方法TabView
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    if(section == 0){
        return 50;
    }
    return 40;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 45;

}
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return  40;
}
#pragma mark - 点击行
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    _selectedIndexPath = indexPath;
    BCContactGroup *group = _contacts[indexPath.section];
    BCContact *contact = group.contacts[indexPath.row];

    UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"System Info" message:[contact getName] delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:@"OK", nil];
    alert.alertViewStyle = UIAlertViewStylePlainTextInput;
    UITextField *textField = [alert textFieldAtIndex:0];
    textField.text = contact.phoneNumber;
    [alert show];
}
#pragma mark - 窗口代理方法 保存数据
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    if(buttonIndex == 1){
        UITextField *textField = [alertView textFieldAtIndex:0];

        BCContactGroup *group = _contacts[_selectedIndexPath.section];
        BCContact *contact = group.contacts[_selectedIndexPath.row];
        contact.phoneNumber = textField.text;
        //[_tableView reloadData];//全部刷新
        //刷新表格
        NSArray *indexPaths=@[_selectedIndexPath];//需要局部刷新的单元格的组、行
        [_tableView reloadRowsAtIndexPaths:indexPaths withRowAnimation:UITableViewRowAnimationLeft];//后面的参数代表更新时的动画
    }
}
-(UIStatusBarStyle)preferredStatusBarStyle{
    return  UIStatusBarStyleLightContent;
}
#pragma mark 切换开关转化事件
-(void)switchValueChange:(UISwitch *)sw{
    [self remove];
    NSLog(@"section:%li,switch:%i",(long)sw.tag, sw.on);
}
-(void)remove{
    [_tableView setEditing:!_tableView.isEditing animated:true];
}
-(void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath{
    BCContactGroup *group = _contacts[indexPath.section];
    BCContact *contact = group.contacts[indexPath.row];
    if(editingStyle == UITableViewCellEditingStyleDelete){
        [group.contacts removeObject:contact];
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationBottom];
        if(group.contacts.count == 0){
            [_contacts removeObject:group];

            [tableView reloadData];
        }
    }
}
#pragma mark - 可编辑移动状态
-(void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)sourceIndexPath toIndexPath:(NSIndexPath *)destinationIndexPath{
    BCContactGroup *sourceGroup = _contacts[sourceIndexPath.section];
    BCContact *sourceContact = sourceGroup.contacts[sourceIndexPath.row];
    BCContactGroup *destinationGroup = _contacts[destinationIndexPath.section];
    [sourceGroup.contacts removeObject:sourceContact];

    [destinationGroup.contacts insertObject:sourceContact atIndex:destinationIndexPath.row];
    if(sourceGroup.contacts.count == 0){
        [_contacts removeObject:sourceGroup];
        [tableView reloadData];
    }
}
-(void)addSearchBar{
    CGRect searchBarRect=CGRectMake(0, 0, self.view.frame.size.width, 50);
    _searchBar=[[UISearchBar alloc]initWithFrame:searchBarRect];
    _searchBar.placeholder=@"Please input key word...";
    //_searchBar.keyboardType=UIKeyboardTypeAlphabet;//键盘类型
    //_searchBar.autocorrectionType=UITextAutocorrectionTypeNo;//自动纠错类型
    //_searchBar.autocapitalizationType=UITextAutocapitalizationTypeNone;//哪一次shitf被自动按下
    _searchBar.showsCancelButton=YES;//显示取消按钮
    //添加搜索框到页眉位置
    _searchBar.delegate=self;
    _tableView.tableHeaderView=_searchBar;
}
-(void)searchBarCancelButtonClicked:(UISearchBar *)searchBar{

}
-(void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText{
    if([_searchBar.text isEqual:@""]){
        _isSearching=NO;
        [_tableView reloadData];
        return;
    }
    [self searchDataWithKeyWord:_searchBar.text];
}
-(void)searchBarSearchButtonClicked:(UISearchBar *)searchBar{

    [self searchDataWithKeyWord:_searchBar.text];

    [_searchBar resignFirstResponder];//放弃第一响应者对象，关闭虚拟键盘
}
-(void)searchDataWithKeyWord:(NSString *)keyWord{
    _isSearching=YES;
    _contacts=[NSMutableArray array];
    [_contacts enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        BCContactGroup *group=obj;
        [group.contacts enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
            BCContact *contact=obj;
            if ([contact.firstName.uppercaseString containsString:keyWord.uppercaseString]||[contact.lastName.uppercaseString containsString:keyWord.uppercaseString]||[contact.phoneNumber containsString:keyWord]) {
                [_contacts addObject:contact];
            }
        }];
    }];

    //刷新表格
    [_tableView reloadData];
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
