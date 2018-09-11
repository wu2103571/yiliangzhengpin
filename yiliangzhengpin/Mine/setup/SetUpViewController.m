//
//  SetUpViewController.m
//  yiliangzhengpin
//
//  Created by 吴祖辉 on 2018/9/6.
//  Copyright © 2018年 吴祖辉. All rights reserved.
//

#import "SetUpViewController.h"
#import "ContactViewController.h"
#import "AboutUsViewController.h"

@interface SetUpViewController ()

@end

@implementation SetUpViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"设置";
    
    [self initTable];
}

- (void)initTable
{
    table = [[UITableView alloc] initWithFrame:GetFrame(0, 0, kScreen_width, kScreen_height - 64) style:UITableViewStyleGrouped];
    table.delegate = self;
    table.dataSource = self;
    table.tableFooterView = [UIView new];
    table.sectionHeaderHeight = 25;
    table.sectionFooterHeight = 0;
    [self.view addSubview:table];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 4;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section == 0) {
        return 1;
    } else if (section == 1) {
        return 2;
    } else if (section == 2) {
        return 3;
    } else {
        return 1;
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 55;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    if (section == 3) {
        return 15;
    } else {
        return 35;
    }
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView *view = [UIView new];
    view.frame = GetFrame(0, 0, kScreen_width, 35);
    
    UILabel *label = [[UILabel alloc] init];
    if (section == 0) {
        label.text = @"设置";
    } else if (section == 1) {
        label.text = @"反馈";
    } else if (section == 2){
        label.text = @"关于";
    }
    label.textColor = [UIColor colorWithRed:153/255.0 green:153/255.0 blue:153/255.0 alpha:1];
    label.font = [UIFont systemFontOfSize:13];
    label.frame = GetFrame(15, 0, 100, 35);
    [view addSubview:label];
    
    return view;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *CellIdentifier = [NSString stringWithFormat:@"Cell%ld%ld", (long)[indexPath section], (long)[indexPath row]];
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    for (UIView *view in cell.subviews) {
        [view removeFromSuperview];
    }
    if (indexPath.section == 2) {
        if (indexPath.row == 2) {
            cell.accessoryType = UITableViewCellAccessoryNone;
        } else {
            cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        }
    } else if (indexPath.section == 3) {
        cell.accessoryType = UITableViewCellAccessoryNone;
    } else {
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }
    [self setupStatus:cell ForRowAtIndexPath:indexPath];
    
    return cell;
}

- (void)setupStatus:(UITableViewCell *)cell ForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSArray *arr = @[@[@"清除缓存"],@[@"意见与反馈",@"商务合作联系"],@[@"关于我们",@"用户协议",@"版本号"],@[@"退出登录"]];
    
    UILabel *leftL = [[UILabel alloc] init];
    leftL.frame = GetFrame(15, 0, 180, 55);
    NSArray *array = arr[indexPath.section];
    leftL.text = array[indexPath.row];
    leftL.font = [UIFont fontWithName:@"MicrosoftYaHei" size:14];
    leftL.textColor = [UIColor colorWithRed:51/255.0 green:51/255.0 blue:51/255.0 alpha:1];
    [cell addSubview:leftL];
    
    if (indexPath.section == 2) {
        if (indexPath.row == 2) {
            UILabel *rightL = [[UILabel alloc] init];
            rightL.frame = CGRectMake(kScreen_width - 95,0,80,55);
            NSDictionary *infoDictionary = [[NSBundle mainBundle] infoDictionary];
            // app版本
            NSString *app_Version = [infoDictionary objectForKey:@"CFBundleShortVersionString"];
            rightL.text = app_Version;
            rightL.font = [UIFont fontWithName:@"MicrosoftYaHei" size:14];
            rightL.textColor = [UIColor colorWithRed:153/255.0 green:153/255.0 blue:153/255.0 alpha:1];
            rightL.textAlignment = NSTextAlignmentRight;
            [cell addSubview:rightL];
        }
    }
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {//清除缓存
        
    } else if (indexPath.section == 1) {
        if (indexPath.row == 0) {//意见与反馈
            
        } else {//商务合作联系
            ContactViewController *contact = [[ContactViewController alloc] init];
            [self.navigationController pushViewController:contact animated:YES];
        }
    } else if (indexPath.section == 2) {
        if (indexPath.row == 0) {//关于我们
            AboutUsViewController *about = [[AboutUsViewController alloc] init];
            [self.navigationController pushViewController:about animated:YES];
        } else if (indexPath.row == 1) {//用户协议
            
        }
    } else {//退出登录
        
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
