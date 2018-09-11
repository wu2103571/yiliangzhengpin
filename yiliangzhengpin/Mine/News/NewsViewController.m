//
//  NewsViewController.m
//  yiliangzhengpin
//
//  Created by 吴祖辉 on 2018/9/7.
//  Copyright © 2018年 吴祖辉. All rights reserved.
//

#import "NewsViewController.h"
#import "NewsDetailViewController.h"

@interface NewsViewController ()

@end

@implementation NewsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.title = @"消息";
    self.view.backgroundColor = BACKGROUNDCOLOR;
    
    UIButton *rightBtn=[[UIButton alloc]initWithFrame:CGRectMake(0, 0, 80, 20)];
    rightBtn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    [rightBtn setTitle:@"清空" forState:UIControlStateNormal];
    [rightBtn setTitleColor:TEXTCOLOR forState:UIControlStateNormal];
    rightBtn.titleLabel.font = [UIFont systemFontOfSize:22];
    [rightBtn addTarget:self action:@selector(newsBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *rightItem=[[UIBarButtonItem alloc]initWithCustomView:rightBtn];
    self.navigationItem.rightBarButtonItem=rightItem;
    
    [self initView];
}

- (void)initView
{
    table = [[UITableView alloc] initWithFrame:GetFrame(0, 0, kScreen_width, kScreen_height - 64) style:UITableViewStyleGrouped];
    table.delegate = self;
    table.dataSource = self;
    table.backgroundColor = BACKGROUNDCOLOR;
    table.sectionFooterHeight = 0;
    table.sectionHeaderHeight = 10;
    table.tableFooterView = [UIView new];
    [self.view addSubview:table];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 5;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 10;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 80;
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
    UIImageView *img = [UIImageView new];
    img.frame = GetFrame(15, 20, 40, 40);
    img.backgroundColor = [UIColor redColor];
    [cell addSubview:img];
    
    UILabel *nameL = [WZHObject LabelWithText:@"物流消息" font:[UIFont systemFontOfSize:15] textColor:TEXTCOLOR theFrame:GetFrame(img.right + 10, 10, 100, 30)];
    [cell addSubview:nameL];
    
    UILabel *detailL = [WZHObject LabelWithText:@"您的订单已发货，请确认查收" font:[UIFont systemFontOfSize:12] textColor:RGBcolor(153, 153, 153) theFrame:GetFrame(img.right + 10, nameL.bottom, kScreen_width - 80, 30)];
    [cell addSubview:detailL];
    
    UILabel *timeL = [WZHObject LabelWithText:@"08-30 12：30" font:[UIFont systemFontOfSize:12] textColor:RGBcolor(153, 153, 153) theFrame:GetFrame(kScreen_width - 140, 10, 100, 30)];
    [cell addSubview:timeL];
    
    UIImageView *rightI = [UIImageView new];
    rightI.frame = GetFrame(timeL.right + 10, 10, 20, 20);
    rightI.backgroundColor = [UIColor redColor];
    [cell addSubview:rightI];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NewsDetailViewController *news = [[NewsDetailViewController alloc] init];
    [self.navigationController pushViewController:news animated:YES];
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
