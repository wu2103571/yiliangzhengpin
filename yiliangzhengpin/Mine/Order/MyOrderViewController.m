//
//  MyOrderViewController.m
//  yiliangzhengpin
//
//  Created by 吴祖辉 on 2018/9/10.
//  Copyright © 2018年 吴祖辉. All rights reserved.
//

#import "MyOrderViewController.h"
#import "OrderDetailViewController.h"

@interface MyOrderViewController ()

@end

@implementation MyOrderViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.title = @"我的订单";
    
    self.view.backgroundColor = BACKGROUNDCOLOR;
    
    [self initTopView];
    
    [self initTable];
}

- (void)initTopView
{
    TopView = [UIView new];
    TopView.frame = CGRectMake(0, 0, kScreen_width, 50);
    TopView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:TopView];
    
    NSArray *arr = @[@"全部",@"待付款",@"待收货",@"待评价",@"退换/售后"];
    
    UIButton *nextB;
    for (int i = 0; i < arr.count; i ++) {
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        [btn setTitle:arr[i] forState:UIControlStateNormal];
        if (_chooseIndex == i) {
            [btn setTitleColor:TEXTCOLOR forState:UIControlStateNormal];
            btn.titleLabel.font = [UIFont systemFontOfSize:18];
        } else {
            [btn setTitleColor:RGBcolor(102, 102, 102) forState:UIControlStateNormal];
            btn.titleLabel.font = [UIFont systemFontOfSize:15];
        }
        if (i == 0) {
            btn.frame = CGRectMake(0, 0, kScreen_width / 5, 49);
        } else {
            btn.frame = CGRectMake(nextB.right, 0, kScreen_width / 5, 49);
        }
        nextB = btn;
        btn.tag = i + 100;
        [btn addTarget:self action:@selector(chooseBtnClick:) forControlEvents:UIControlEventTouchUpInside];
        [TopView addSubview:btn];
    }
    
    UIView *line = [UIView new];
    line.backgroundColor = BACKGROUNDCOLOR;
    line.frame = CGRectMake(0, 49, kScreen_width, 1);
    [TopView addSubview:line];
    
    seleteView = [UIView new];
    seleteView.backgroundColor = TEXTCOLOR;
    seleteView.frame = CGRectMake(_chooseIndex * (kScreen_width / 5), 49, kScreen_width / 5, 1);
    [TopView addSubview:seleteView];
}

- (void)initTable
{
    table = [[UITableView alloc] initWithFrame:CGRectMake(0, TopView.bottom, kScreen_width, kScreen_height - 64 - TopView.size.height) style:UITableViewStyleGrouped];
    table.delegate = self;
    table.dataSource = self;
    table.backgroundColor = BACKGROUNDCOLOR;
    table.sectionHeaderHeight = 8;
    table.sectionFooterHeight = 0;
    table.tableFooterView = [UIView new];
//    table.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
//        page = 1;
//        [self getData];
//    }];
//    // 设置自动切换透明度(在导航栏下面自动隐藏)
//    table.mj_header.automaticallyChangeAlpha = YES;
//
//    table.mj_footer = [MJRefreshBackNormalFooter footerWithRefreshingBlock:^{
//        page ++;
//        [self getData];
//    }];
    [self.view addSubview:table];
}

- (void)chooseBtnClick:(UIButton *)btn
{
    for (int i = 0; i < 5; i ++) {
        UIButton *butn = [TopView viewWithTag:i + 100];
        if (butn == btn) {
            [butn setTitleColor:TEXTCOLOR forState:UIControlStateNormal];
            _chooseIndex = i;
            butn.titleLabel.font = [UIFont systemFontOfSize:18];
        } else {
            butn.titleLabel.font = [UIFont systemFontOfSize:15];
            [butn setTitleColor:RGBcolor(102, 102, 102) forState:UIControlStateNormal];
        }
    }
    
    [UIView animateWithDuration:.3 animations:^{
        seleteView.frame = CGRectMake(_chooseIndex * (kScreen_width / 5), 49, kScreen_width / 5, 1);
    }];
//    page = 1;
    
    
//    [self getData];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 5;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [self tableView:tableView cellForRowAtIndexPath:indexPath];
    return cell.frame.size.height;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 8;
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
    
    //    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    
    [self setupStatus:cell ForRowAtIndexPath:indexPath];
    
    return cell;
}

- (void)setupStatus:(UITableViewCell *)cell ForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UIImageView *headerImg = [UIImageView new];
    headerImg.frame = GetFrame(15, 7, 25, 25);
    headerImg.layer.masksToBounds = YES;
    headerImg.layer.cornerRadius = 25/2;
    headerImg.backgroundColor = [UIColor redColor];
    [cell addSubview:headerImg];
    
    UILabel *label = [WZHObject LabelWithText:@"怡良正品" font:[UIFont systemFontOfSize:15] textColor:TEXTCOLOR theFrame:GetFrame(headerImg.right + 5, 4, 100, 30)];
    [cell addSubview:label];
    
    UILabel *zhuangtai = [[UILabel alloc] init];
    CGFloat W;
    NSString *str;
    NSArray *arr;
    if (indexPath.section == 0) {
        str = @"待付款";
        arr = @[@"取消订单",@"再来一单"];
    } else if (indexPath.section == 1) {
        str = @"已取消";
        arr = @[@"删除订单",@"再来一单"];
    } else if (indexPath.section == 2) {
        str = @"待发货";
        arr = @[@"取消订单",@"再来一单"];
    } else if (indexPath.section == 3) {
        str = @"待收货";
        arr = @[@"申请售后",@"查看物流",@"确认收货"];
    } else {
        str = @"已完成";
        arr = @[@"删除订单",@"订单申诉",@"待评价",@"再来一单"];
    }
    W = [WZHObject widthWithString:str font:[UIFont systemFontOfSize:GetTextSize(13)] andWidth:kScreen_width];
    zhuangtai.text = str;
//    if ([rightD[@"type"] integerValue] >= 500) {
//    } else {
//        W = [WZHObject widthWithString:rightD[@"describe"] font:[UIFont systemFontOfSize:GetTextSize(13)] andWidth:kScreen_width];
//        zhuangtai.text = rightD[@"describe"];
//    }
    zhuangtai.textColor = RGBcolor(153, 153, 153);
    zhuangtai.font = [UIFont systemFontOfSize:GetTextSize(13)];
    zhuangtai.frame = GetFrame(kScreen_width - W - 10, 4, W, 30);
    zhuangtai.textAlignment = NSTextAlignmentRight;
    [cell addSubview:zhuangtai];
    
    UIView * shangV = [[UIView alloc] init];
    shangV.frame = GetFrame(5, zhuangtai.bottom, kScreen_width - 10, 80);
    shangV.backgroundColor = RGBcolor(251, 251, 251);
    [cell addSubview:shangV];
    
    UIImageView *img = [[UIImageView alloc] init];
//    if ([dic[@"IsUnionShop"] isEqualToString:@"Y"]) {
//        [img sd_setImageWithURL:[NSURL URLWithString:dic[@"logo"]] placeholderImage:[UIImage imageNamed:@"ShopDetails_1"]];
//    } else {
//        [img sd_setImageWithURL:[NSURL URLWithString:dict[@"ProdImg"]]];
//    }
    img.backgroundColor = [UIColor redColor];
    img.frame = GetFrame(10, 10, 60, 60);
    img.contentMode = UIViewContentModeScaleAspectFill;
    img.clipsToBounds = YES;
    [shangV addSubview:img];
    
    UILabel *name = [[UILabel alloc] initWithFrame:GetFrame(img.right + 15, 17, kScreen_width - img.width - 35, 40)];
    name.textColor = [UIColor colorWithRed:.2 green:.2 blue:.2 alpha:1];
//    if ([dic[@"IsUnionShop"] isEqualToString:@"Y"]) {
//        name.text = dic[@"UnionName"];
//    } else {
//        name.text = dict[@"ProdName"];
//    }
    name.text = @"【移动专享版】 华为HUAWEI NOVA 3 全面屏 高清四摄6GB + 128GB";
    name.numberOfLines = 2;
    name.font = [UIFont systemFontOfSize:GetTextSize(13)];
    [shangV addSubview:name];
    
    UILabel *moneyL = [WZHObject LabelWithText:@"共1件商品 实付款：￥2999.00" font:[UIFont systemFontOfSize:14] textColor:RGBcolor(51, 51, 51) theFrame:GetFrame(kScreen_width - 210, shangV.bottom, 200, 30)];
    [cell addSubview:moneyL];
    
    UIView *line = [UIView new];
    line.frame = GetFrame(0, moneyL.bottom + 5, kScreen_width, .5);
    line.backgroundColor = BACKGROUNDCOLOR;
    [cell addSubview:line];
    
    UIButton *nextB;
    for (int i = 0; i < arr.count; i ++) {
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        [btn setTitle:arr[arr.count - i - 1] forState:UIControlStateNormal];
        btn.titleLabel.font = [UIFont systemFontOfSize:GetTextSize(13)];
        if (i == 0) {
            [btn setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
            btn.layer.borderColor = [UIColor redColor].CGColor;
        } else {
            [btn setTitleColor:[UIColor colorWithRed:.2 green:.2 blue:.2 alpha:1] forState:UIControlStateNormal];
            btn.layer.borderColor = [UIColor colorWithRed:.2 green:.2 blue:.2 alpha:1].CGColor;
        }
        CGFloat W = [WZHObject widthWithString:arr[arr.count - i - 1] font:[UIFont systemFontOfSize:GetTextSize(13)] andWidth:kScreen_width];
        if (i == 0) {
            btn.frame = GetFrame(kScreen_width - W - 20 - 10, line.bottom + 10, W + 20, 30);
        } else {
            btn.frame = GetFrame(nextB.left - W - 30, line.bottom + 10, W + 20, 30);
        }
        btn.tag = indexPath.row;
        btn.layer.masksToBounds = YES;
        btn.layer.cornerRadius = 15;
        btn.layer.borderWidth = .5;
        [btn addTarget:self action:@selector(btnsAction:) forControlEvents:UIControlEventTouchUpInside];
        nextB = btn;
        [cell addSubview:btn];
    }
    
    CGRect rect = cell.frame;
    rect.size.height = CGRectGetMaxY(nextB.frame) + 10;
    cell.frame = rect;
    
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    OrderDetailViewController *order = [[OrderDetailViewController alloc] init];
    if (indexPath.section == 0) {
        order.orderType = @"1";
    } else if (indexPath.section == 1) {
        order.orderType = @"2";
    } else if (indexPath.section == 2) {
        order.orderType = @"3";
    } else if (indexPath.section == 3) {
        order.orderType = @"4";
    } else {
        order.orderType = @"5";
    }
    [self.navigationController pushViewController:order animated:YES];
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
