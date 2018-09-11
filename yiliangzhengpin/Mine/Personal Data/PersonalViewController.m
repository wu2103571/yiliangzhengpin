//
//  PersonalViewController.m
//  yiliangzhengpin
//
//  Created by 吴祖辉 on 2018/9/7.
//  Copyright © 2018年 吴祖辉. All rights reserved.
//

#import "PersonalViewController.h"
#import "ConsumptionViewController.h"

@interface PersonalViewController ()

@end

@implementation PersonalViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.title = @"个人资料";
    
    self.view.backgroundColor = BACKGROUNDCOLOR;
    
    [self initView];
}

- (void)initView
{
    table = [[UITableView alloc] initWithFrame:GetFrame(0, 0, kScreen_width, kScreen_height - 64) style:UITableViewStyleGrouped];
    table.delegate = self;
    table.dataSource = self;
    table.backgroundColor = BACKGROUNDCOLOR;
    table.sectionHeaderHeight = 35;
    table.tableFooterView = [UIView new];
    [self.view addSubview:table];
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 4;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 35;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView *view = [UIView new];
    view.backgroundColor = BACKGROUNDCOLOR;
    view.frame = GetFrame(0, 0, kScreen_width, 35);
    
    UILabel *label = [WZHObject LabelWithText:@"基本资料" font:[UIFont systemFontOfSize:14] textColor:RGBcolor(153, 153, 153) theFrame:GetFrame(15, 0, kScreen_width - 15, 35)];
    [view addSubview:label];
    
    return view;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 0) {
        return 70;
    } else {
        return 55;
    }
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
    NSArray *arr = @[@"头像",@"昵称",@"手机号",@"消费积分"];

    
    UILabel *label = [[UILabel alloc] init];
    label.text = arr[indexPath.row];
    label.textColor = TEXTCOLOR;
    label.font = [UIFont systemFontOfSize:15];
    if (indexPath.row == 0) {
        label.frame = CGRectMake(15, 0, 100, 70);
    } else {
        label.frame = CGRectMake(15, 0, 100, 55);
    }
    [cell addSubview:label];
    
    if (indexPath.row == 3) {
        UIImageView *rightImg = [UIImageView new];
        rightImg.image = [UIImage imageNamed:@"next_black"];
        rightImg.frame = GetFrame(kScreen_width - 18, (55 - 12.7)/2, 8, 12.7);
        rightImg.backgroundColor = [UIColor redColor];
        [cell addSubview:rightImg];
        
        UILabel *rightL = [WZHObject LabelWithText:@"12580分" font:[UIFont systemFontOfSize:13] textColor:TEXTCOLOR theFrame:GetFrame(kScreen_width - 128, 0, 100, 55)];
        rightL.textAlignment = NSTextAlignmentRight;
        [cell addSubview:rightL];
    } else if (indexPath.row == 0) {
        UIImageView *img = [UIImageView new];
        img.frame = GetFrame(kScreen_width - 55, 15, 40, 40);
        img.layer.masksToBounds = YES;
        img.layer.cornerRadius = 20;
        img.backgroundColor = [UIColor redColor];
        [cell addSubview:img];
    } else {
        UILabel *rightL = [WZHObject LabelWithText:@"" font:[UIFont systemFontOfSize:13] textColor:TEXTCOLOR theFrame:GetFrame(label.right, 0, kScreen_width - 130, 55)];
        rightL.textAlignment = NSTextAlignmentRight;
        if (indexPath.row == 1) {
            rightL.text = @"呵呵";
        } else {
            rightL.text = @"18508464470";
        }
        [cell addSubview:rightL];
    }
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 3) {
        ConsumptionViewController *Consumption = [[ConsumptionViewController alloc] init];
        [self.navigationController pushViewController:Consumption animated:YES];
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
