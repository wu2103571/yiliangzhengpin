//
//  IntegralViewController.m
//  yiliangzhengpin
//
//  Created by 吴祖辉 on 2018/9/7.
//  Copyright © 2018年 吴祖辉. All rights reserved.
//

#import "IntegralViewController.h"
#import "RecordViewController.h"

@interface IntegralViewController ()

@end

@implementation IntegralViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.title = @"诚信积分";
    
    self.view.backgroundColor = BACKGROUNDCOLOR;
    
    [self initView];
}

- (void)initView
{
    table = [[UITableView alloc] initWithFrame:GetFrame(0, 0, kScreen_width, kScreen_height - 64) style:UITableViewStyleGrouped];
    table.delegate = self;
    table.dataSource = self;
    table.backgroundColor = BACKGROUNDCOLOR;
    table.sectionHeaderHeight = 12;
    table.tableHeaderView = [self tableHeader];
    table.tableFooterView = [UIView new];
    [self.view addSubview:table];
}

- (UIView *)tableHeader
{
    UIView *header = [UIView new];
    header.backgroundColor = [UIColor colorWithRed:51/255.0 green:51/255.0 blue:51/255.0 alpha:1];
    
    UILabel *numberL = [WZHObject LabelWithText:@"148" font:[UIFont systemFontOfSize:55] textColor:RGBcolor(102, 255, 255) theFrame:GetFrame((kScreen_width - 100) / 2, 25, 100, 50)];
    numberL.textAlignment = NSTextAlignmentCenter;
    [header addSubview:numberL];
    
    UILabel *centerL = [WZHObject LabelWithText:@"信用极好" font:[UIFont systemFontOfSize:15] textColor:RGBcolor(102, 255, 255) theFrame:GetFrame((kScreen_width - 100) / 2, numberL.bottom, 100, 30)];
    centerL.textAlignment = NSTextAlignmentCenter;
    [header addSubview:centerL];
    
    UILabel *timeL = [WZHObject LabelWithText:@"评估时间： 2018-09-02" font:[UIFont systemFontOfSize:13] textColor:RGBcolor(153, 153, 153) theFrame:GetFrame((kScreen_width - 150) / 2, centerL.bottom + 15, 150, 30)];
    timeL.textAlignment = NSTextAlignmentCenter;
    [header addSubview:timeL];
    
    header.frame = GetFrame(0, 0, kScreen_width, timeL.origin.y + timeL.size.height + 25);
    
    return header;
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 2;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 10;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 55;
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
    [self setupStatus:cell ForRowAtIndexPath:indexPath];
    
    return cell;
}

- (void)setupStatus:(UITableViewCell *)cell ForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UIImageView *leftImg = [[UIImageView alloc] init];
//    leftImg.image = [UIImage imageNamed:imgArr[indexPath.row]];
    leftImg.frame = CGRectMake(10, 12, 20, 20);
    [cell addSubview:leftImg];
    
    NSArray *arr = @[@"积分记录",@"诚信积分说明"];
    UILabel *label = [[UILabel alloc] init];
    label.text = arr[indexPath.row];
    label.textColor = TEXTCOLOR;
    label.font = [UIFont systemFontOfSize:15];
    label.frame = CGRectMake(leftImg.origin.x + leftImg.size.width + 8, 0, 200, 43);
    [cell addSubview:label];
    
    UIImageView *rightImg = [UIImageView new];
    rightImg.image = [UIImage imageNamed:@"next_black"];
    rightImg.frame = GetFrame(kScreen_width - 18, 15.65, 8, 12.7);
    [cell addSubview:rightImg];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 0) {//积分记录
        RecordViewController *record = [[RecordViewController alloc] init];
        [self.navigationController pushViewController:record animated:YES];
    } else {
        
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
