//
//  MineViewController.m
//  yiliangzhengpin
//
//  Created by 吴祖辉 on 2018/9/4.
//  Copyright © 2018年 吴祖辉. All rights reserved.
//

#import "MineViewController.h"
#import "SetUpViewController.h"
#import "IntegralViewController.h"
#import "ModifyPWDViewController.h"
#import "AddressViewController.h"
#import "PersonalViewController.h"
#import "NewsViewController.h"
#import "MyOrderViewController.h"

@interface MineViewController ()

@end

@implementation MineViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor redColor];
    
    fiveBtnArr = @[@"待付款",@"待收货",@"待评价",@"退换/售后"];
    midCellArr = @[@"诚信积分",@"收货地址",@"修改密码"];
    imgArr = @[@"account_icon",@"safe_icon",@"code_icon"];
    
    UIButton *leftbutton=[[UIButton alloc]initWithFrame:CGRectMake(0, 0, 80, 20)];
    leftbutton.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    [leftbutton setTitle:@"我的" forState:UIControlStateNormal];
    leftbutton.titleLabel.font = [UIFont systemFontOfSize:22];
    [leftbutton addTarget:self action:@selector(settingBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *leftitem=[[UIBarButtonItem alloc]initWithCustomView:leftbutton];
    self.navigationItem.leftBarButtonItem=leftitem;
    
    UIButton *rightBtn=[[UIButton alloc]initWithFrame:CGRectMake(0, 0, 80, 20)];
    rightBtn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    [rightBtn setTitle:@"我的" forState:UIControlStateNormal];
    rightBtn.titleLabel.font = [UIFont systemFontOfSize:22];
    [rightBtn addTarget:self action:@selector(newsBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *rightItem=[[UIBarButtonItem alloc]initWithCustomView:rightBtn];
    self.navigationItem.rightBarButtonItem=rightItem;
    
    [self initView];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    [self.navigationController.navigationBar setBarTintColor:RGBcolor(248, 248, 248)];
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    
    
    [self.navigationController.navigationBar setBarTintColor:[UIColor whiteColor]];
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
    UIView *header = [[UIView alloc] init];
    header.tag = 1987;
    header.backgroundColor = [UIColor whiteColor];
    
    
    UIImageView *backImg = [UIImageView new];
    backImg.image = [UIImage imageNamed:@"top_img"];
    backImg.backgroundColor = [UIColor redColor];
    backImg.frame = GetFrame(0, 0, kScreen_width, 160);
    [header addSubview:backImg];
    
    UIImageView *headerImg = [[UIImageView alloc] init];
    headerImg.frame = CGRectMake(20, 52.5, 55, 55);
    headerImg.layer.masksToBounds = YES;
    headerImg.layer.cornerRadius = 55/2;
    headerImg.layer.borderColor = [UIColor whiteColor].CGColor;
    headerImg.layer.borderWidth = 1;
    headerImg.tag = 567;
    NSString *str = [[NSUserDefaults standardUserDefaults] objectForKey:@"headImgUrl"];
    [header addSubview:headerImg];
    
    UILabel *nameLabel = [[UILabel alloc] init];
//    nameLabel.text = [[NSUserDefaults standardUserDefaults] objectForKey:@"loginName"];
    nameLabel.text = @"18508464470";
    nameLabel.textColor = [UIColor whiteColor];
    nameLabel.font = [UIFont systemFontOfSize:GetTextSize(16)];
    nameLabel.frame = CGRectMake(headerImg.origin.x + headerImg.size.width + 10, headerImg.origin.y, 200, 30);
    nameLabel.tag = 678;
    [header addSubview:nameLabel];
    

    UIButton *goodsNumB = [UIButton buttonWithType:UIButtonTypeCustom];
    [goodsNumB setTitle:@"消息积分：12580" forState:UIControlStateNormal];
    [goodsNumB setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    goodsNumB.titleLabel.font = [UIFont systemFontOfSize:13];
    goodsNumB.frame = CGRectMake(headerImg.origin.x + headerImg.size.width + 10, nameLabel.origin.y + nameLabel.size.height, 200, 30);
//    [goodsNumB addTarget:self action:@selector(collectionBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    goodsNumB.tag = 9999;
    [header addSubview:goodsNumB];
    
    UIButton *butn = [WZHObject btnWithText:@"" font:[UIFont systemFontOfSize:12] textColor:TEXTCOLOR theFrame:GetFrame(0, 0, kScreen_width, 160) backColor:[UIColor clearColor]];
    [butn addTarget:self action:@selector(personBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    [header addSubview:butn];
    
//    CGFloat W1 = [WZHObject widthWithString:[NSString stringWithFormat:@"收藏店铺(%@)",favShopStr] font:[UIFont systemFontOfSize:13] andWidth:kScreen_width];
//    UIButton *shopNumB = [UIButton buttonWithType:UIButtonTypeCustom];
//    [shopNumB setTitle:[NSString stringWithFormat:@"收藏店铺(%@)",favShopStr] forState:UIControlStateNormal];
//    [shopNumB setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
//    shopNumB.titleLabel.font = [UIFont systemFontOfSize:13];
//    shopNumB.frame = CGRectMake(goodsNumB.right + 15, goodsNumB.origin.y, W1, 30);
//    [shopNumB addTarget:self action:@selector(collectionBtnClick:) forControlEvents:UIControlEventTouchUpInside];
//    shopNumB.tag = 9998;
//    [header addSubview:shopNumB];
    
//    UIImageView *img = [[UIImageView alloc] init];
//    img.image = [UIImage imageNamed:@"clipboard_icon"];
//    img.frame = CGRectMake(10, backImg.bottom + 10, 17, 20);
//    [header addSubview:img];
    
    UILabel *myOrderL = [[UILabel alloc] init];
    myOrderL.text = @"我的订单";
    myOrderL.textColor = TEXTCOLOR;
    myOrderL.font = [UIFont systemFontOfSize:15 ];
    myOrderL.frame = CGRectMake(15, backImg.bottom, 100, 30);
    [header addSubview:myOrderL];
    
    CGFloat W = [WZHObject widthWithString:@"全部订单  ＞" font:[UIFont systemFontOfSize:13] andWidth:kScreen_width];
    UIButton *rightBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [rightBtn setTitle:@"全部订单  ＞" forState:UIControlStateNormal];
    [rightBtn setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
    rightBtn.titleLabel.font = [UIFont systemFontOfSize:13];
    rightBtn.frame = CGRectMake(kScreen_width - W - 10, backImg.bottom, W, 30);
    [rightBtn addTarget:self action:@selector(orderBtnClick) forControlEvents:UIControlEventTouchUpInside];
    [header addSubview:rightBtn];
    
    UIView *line = [[UIView alloc] initWithFrame:CGRectMake(10, myOrderL.origin.y + myOrderL.size.height + 5, kScreen_width - 10, .4)];
    line.backgroundColor = BACKGROUNDCOLOR;
    [header addSubview:line];
    
    UIButton *nextB;
    NSArray *imgA = @[@"payment_icon",@"ship_icon",@"receipt_icon",@"service_icon"];
    for (int i = 0; i < fiveBtnArr.count; i ++) {
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        [btn setTitle:fiveBtnArr[i] forState:UIControlStateNormal];
        [btn setImage:[UIImage imageNamed:imgA[i]] forState:UIControlStateNormal];
        [btn setTitleColor:TEXTCOLOR forState:UIControlStateNormal];
        btn.titleLabel.font = [UIFont systemFontOfSize:13];
        if (i == 0) {
            btn.frame = CGRectMake(0, line.origin.y + line.size.height, kScreen_width / fiveBtnArr.count, kScreen_width / fiveBtnArr.count);
        } else {
            btn.frame = CGRectMake(nextB.origin.x + nextB.size.width, line.origin.y + line.size.height, kScreen_width / fiveBtnArr.count, kScreen_width / fiveBtnArr.count);
        }
        CGFloat imageWith = btn.imageView.frame.size.width;
        CGFloat imageHeight = btn.imageView.frame.size.height;
        UIEdgeInsets imageEdgeInsets = UIEdgeInsetsZero;
        UIEdgeInsets labelEdgeInsets = UIEdgeInsetsZero;
        CGFloat labelWidth = 0.0;
        CGFloat labelHeight = 0.0;
        if ([UIDevice currentDevice].systemVersion.floatValue >= 8.0) {
            // 由于iOS8中titleLabel的size为0，用下面的这种设置
            labelWidth = btn.titleLabel.intrinsicContentSize.width;
            labelHeight = btn.titleLabel.intrinsicContentSize.height;
        } else {
            labelWidth = btn.titleLabel.frame.size.width;
            labelHeight = btn.titleLabel.frame.size.height;
        }
        imageEdgeInsets = UIEdgeInsetsMake(-labelHeight-10/2.0, 0, 0, -labelWidth);
        labelEdgeInsets = UIEdgeInsetsMake(0, -imageWith, -imageHeight-10/2.0, 0);
        btn.titleEdgeInsets = labelEdgeInsets;
        btn.imageEdgeInsets = imageEdgeInsets;
        nextB = btn;
        btn.tag = i + 110;
        [btn addTarget:self action:@selector(fiveBtnClick:) forControlEvents:UIControlEventTouchUpInside];
        [header addSubview:btn];
        
//        if (i < fiveBtnArr.count - 1) {
//            UILabel *countLabel = [UILabel new];
//            countLabel.backgroundColor = [UIColor redColor];
//            if (countArr.count > 0) {
//                if ([countArr[i] intValue] > 99) {
//                    countLabel.text = @"99+";
//                    countLabel.font = [UIFont systemFontOfSize:7];
//                } else {
//                    countLabel.text = [countArr[i] stringValue];
//                    countLabel.font = [UIFont systemFontOfSize:9];
//                }
//                if ([[countArr[i] stringValue] isEqualToString:@"0"]) {
//                    countLabel.hidden = YES;
//                }
//                countLabel.textAlignment = NSTextAlignmentCenter;
//                countLabel.textColor = [UIColor whiteColor];
//                if (iPhone5) {
//                    countLabel.frame = GetFrame(i * (kScreen_width / fiveBtnArr.count) + 36, 50, 16, 16);
//                } else if (iPhone6P) {
//                    countLabel.frame = GetFrame(i * (kScreen_width / fiveBtnArr.count) + 45, 58, 16, 16);
//                } else if (iPhone6) {
//                    countLabel.frame = GetFrame(i * (kScreen_width / fiveBtnArr.count) + 39, 53, 16, 16);
//                } else {
//                    countLabel.frame = GetFrame(i * (kScreen_width / fiveBtnArr.count) + 41, 56, 16, 16);
//                }
//                countLabel.layer.masksToBounds = YES;
//                countLabel.layer.cornerRadius = 8;
//                [cell addSubview:countLabel];
//            }
//        }
    }
    CGFloat H = CGRectGetMaxY(nextB.frame);
    header.frame = CGRectMake(0, 0, kScreen_width, H);
    
    return header;
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 3;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 10;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 44;
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
    leftImg.image = [UIImage imageNamed:imgArr[indexPath.row]];
    leftImg.frame = CGRectMake(10, 12, 20, 20);
    [cell addSubview:leftImg];
    
    UILabel *label = [[UILabel alloc] init];
    label.text = midCellArr[indexPath.row];
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
    if (indexPath.row == 0) {//诚信积分
        IntegralViewController *integral = [[IntegralViewController alloc] init];
        integral.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:integral animated:YES];
    } else if (indexPath.row == 1) {//收货地址
        AddressViewController *address = [[AddressViewController alloc] init];
        address.hidesBottomBarWhenPushed = YES;
        address.isChange = @"2";
        [self.navigationController pushViewController:address animated:YES];
    } else {//修改密码
        ModifyPWDViewController *modify = [[ModifyPWDViewController alloc] init];
        modify.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:modify animated:YES];
    }
}

- (void)settingBtnClick:(UIButton *)btn
{
    SetUpViewController *set = [[SetUpViewController alloc] init];
    set.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:set animated:YES];
}

- (void)personBtnClick:(UIButton *)btn
{
    PersonalViewController *personal = [[PersonalViewController alloc] init];
    personal.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:personal animated:YES];
}

- (void)newsBtnClick:(UIButton *)btn
{
    NewsViewController *news = [[NewsViewController alloc] init];
    news.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:news animated:YES];
}

- (void)orderBtnClick
{
    MyOrderViewController *order = [[MyOrderViewController alloc] init];
    order.hidesBottomBarWhenPushed = YES;
    order.chooseIndex = 0;
    [self.navigationController pushViewController:order animated:YES];
}

- (void)fiveBtnClick:(UIButton *)btn
{
    MyOrderViewController *order = [[MyOrderViewController alloc] init];
    order.hidesBottomBarWhenPushed = YES;
    if (btn.tag == 110) {
        order.chooseIndex = 1;
    } else if (btn.tag == 111) {
        order.chooseIndex = 2;
    } else if (btn.tag == 112) {
        order.chooseIndex = 3;
    } else {
        order.chooseIndex = 4;
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
