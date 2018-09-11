//
//  AddressViewController.m
//  yiliangzhengpin
//
//  Created by 吴祖辉 on 2018/9/7.
//  Copyright © 2018年 吴祖辉. All rights reserved.
//

#import "AddressViewController.h"
#import "AddAddressViewController.h"

@interface AddressViewController ()

@end

@implementation AddressViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    if ([_isChange isEqualToString:@"2"]) {
        self.title = @"收货地址管理";
    } else {
        self.title = @"收货地址";
    }
    self.view.backgroundColor = BACKGROUNDCOLOR;
    
    [self initView];
    
}

- (void)initView
{
    table = [[UITableView alloc] initWithFrame:GetFrame(0, 0, kScreen_width, kScreen_height - 149) style:UITableViewStyleGrouped];
    table.delegate = self;
    table.dataSource = self;
    table.backgroundColor = BACKGROUNDCOLOR;
    table.sectionHeaderHeight = 10;
    table.sectionFooterHeight = 0;
    table.tableFooterView = [UIView new];
    [self.view addSubview:table];
    
    UIButton *btn = [WZHObject btnWithText:@"十 新建收货地址" font:[UIFont systemFontOfSize:16] textColor:[UIColor whiteColor] theFrame:GetFrame(15, kScreen_height - 129, kScreen_width - 30, 45) backColor:RGBcolor(51, 51, 51)];
    btn.layer.masksToBounds = YES;
    btn.layer.cornerRadius = 45/2;
    [btn addTarget:self action:@selector(button1BackGroundHighlighted:) forControlEvents:UIControlEventTouchDown];
    [btn addTarget:self action:@selector(button1BackGroundNormal:) forControlEvents:UIControlEventTouchUpInside];
    [btn addTarget:self action:@selector(addAddressBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
}

//  button1普通状态下的背景色
- (void)button1BackGroundNormal:(UIButton *)sender
{
    sender.backgroundColor = RGBcolor(51, 51, 51);
}

//  button1高亮状态下的背景色
- (void)button1BackGroundHighlighted:(UIButton *)sender
{
    sender.backgroundColor = RGBcolor(102, 102, 102);
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 7;
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
    UITableViewCell *cell = [self tableView:tableView cellForRowAtIndexPath:indexPath];
    return cell.frame.size.height;
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
    UILabel *topL = [WZHObject LabelWithText:@"收货地址" font:[UIFont systemFontOfSize:14] textColor:RGBcolor(102, 102, 102) theFrame:GetFrame(15, 5, 100, 30)];
    [cell addSubview:topL];
    
    if ([_isChange isEqualToString:@"2"]) {
        UIButton *deletebtn = [WZHObject btnWithText:@"" font:[UIFont systemFontOfSize:12] textColor:TEXTCOLOR theFrame:GetFrame(kScreen_width - 40, 5, 30, 30) backColor:[UIColor redColor]];
        [cell addSubview:deletebtn];
        
        UIButton *bianji = [WZHObject btnWithText:@"" font:[UIFont systemFontOfSize:12] textColor:TEXTCOLOR theFrame:GetFrame(kScreen_width - 80, 5, 30, 30) backColor:[UIColor redColor]];
        [cell addSubview:bianji];
        
        UIView *shu = [[UIView alloc] init];
        shu.frame = GetFrame(bianji.right + 5, 10, 0.5, 20);
        shu.backgroundColor = [UIColor colorWithRed:238/255.0 green:238/255.0 blue:238/255.0 alpha:1];
        [cell addSubview:shu];
    }
    
    UIView *line = [UIView new];
    line.frame = GetFrame(15, topL.bottom + 5, kScreen_width - 30, .5);
    line.backgroundColor = [UIColor colorWithRed:238/255.0 green:238/255.0 blue:238/255.0 alpha:1];
    [cell addSubview:line];
    
    UILabel *nameL = [WZHObject LabelWithText:@"张一二  18508464470" font:[UIFont systemFontOfSize:15] textColor:TEXTCOLOR theFrame:GetFrame(15, line.bottom + 15, kScreen_width - 30, 30)];
    [cell addSubview:nameL];
    
    UILabel *addressL = [WZHObject LabelWithText:@"长沙市岳麓区环湖路与麓云路交汇处（梅溪湖大桥以西）" font:[UIFont systemFontOfSize:12] textColor:RGBcolor(153, 153, 153) theFrame:GetFrame(15, nameL.bottom, kScreen_width - 30, 40)];
    addressL.numberOfLines = 0;
    [addressL sizeToFit];
    [cell addSubview:addressL];
    
    UIImageView *img = [[UIImageView alloc] init];
    img.backgroundColor = [UIColor redColor];
    img.frame = GetFrame(kScreen_width - 30, line.bottom + 20, 20, 20);
    [cell addSubview:img];
    
    CGRect rect = cell.frame;
    rect.size.height = CGRectGetMaxY(addressL.frame) + 15;
    cell.frame = rect;
}

- (void)addAddressBtnClick:(UIButton *)btn
{
    AddAddressViewController *add = [[AddAddressViewController alloc] init];
    [self.navigationController pushViewController:add animated:YES];
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
