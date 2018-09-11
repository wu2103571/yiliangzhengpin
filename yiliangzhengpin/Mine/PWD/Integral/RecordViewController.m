//
//  RecordViewController.m
//  yiliangzhengpin
//
//  Created by 吴祖辉 on 2018/9/7.
//  Copyright © 2018年 吴祖辉. All rights reserved.
//

#import "RecordViewController.h"

@interface RecordViewController ()

@end

@implementation RecordViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"积分记录";
    
    self.view.backgroundColor = BACKGROUNDCOLOR;
    
    [self initView];
}

- (void)initView
{
    table = [[UITableView alloc] initWithFrame:GetFrame(0, 10, kScreen_width, kScreen_height - 74) style:UITableViewStylePlain];
    table.delegate = self;
    table.dataSource = self;
    table.backgroundColor = BACKGROUNDCOLOR;
    table.tableFooterView = [UIView new];
    [self.view addSubview:table];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 3;
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
    UILabel *nameL = [WZHObject LabelWithText:@"购买商品" font:[UIFont systemFontOfSize:16] textColor:RGBcolor(51, 51, 51) theFrame:GetFrame(15, 10, 200, 30)];
    [cell addSubview:nameL];
    
    UILabel *timeL = [WZHObject LabelWithText:@"08-30 12：10" font:[UIFont systemFontOfSize:12] textColor:RGBcolor(153, 153, 153) theFrame:GetFrame(15, nameL.bottom, 200, 30)];
    [cell addSubview:timeL];
    
    UILabel *moneyL = [WZHObject LabelWithText:@"+1" font:[UIFont systemFontOfSize:14] textColor:RGBcolor(51, 51, 51) theFrame:GetFrame(kScreen_width - 100, 25, 80, 30)];
    moneyL.textAlignment = NSTextAlignmentRight;
    [cell addSubview:moneyL];
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
