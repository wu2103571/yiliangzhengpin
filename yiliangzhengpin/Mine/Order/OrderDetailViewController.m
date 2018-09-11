//
//  OrderDetailViewController.m
//  yiliangzhengpin
//
//  Created by 吴祖辉 on 2018/9/10.
//  Copyright © 2018年 吴祖辉. All rights reserved.
//

#import "OrderDetailViewController.h"

@interface OrderDetailViewController ()

@end

@implementation OrderDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.title = @"订单详情";
    
    self.view.backgroundColor = BACKGROUNDCOLOR;
    
    [self initView];
    
    [self initBottomView];
}

- (void)initView
{
    scroll = [[UIScrollView alloc] init];
    scroll.frame = GetFrame(0, 0, kScreen_width, kScreen_height - 118);
    scroll.backgroundColor = BACKGROUNDCOLOR;
//    scroll.mj_header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(getData)];
    [self.view addSubview:scroll];
    
    UIView *blackV = [UIView new];
    blackV.backgroundColor = RGBcolor(51, 51, 51);
    blackV.frame = GetFrame(0, 0, kScreen_width, 120);
    [scroll addSubview:blackV];
    
    UIImageView *theImg = [UIImageView new];
    theImg.frame = GetFrame(15, 35, 20, 20);
    theImg.backgroundColor = [UIColor redColor];
    [blackV addSubview:theImg];
    
    UILabel *leLabel = [WZHObject LabelWithText:@"等待付款" font:[UIFont systemFontOfSize:16] textColor:[UIColor whiteColor] theFrame:GetFrame(theImg.right + 5, 30, 150, 30)];
    [blackV addSubview:leLabel];
    
    UILabel *rightLa = [WZHObject LabelWithText:@"剩余：29：30" font:[UIFont systemFontOfSize:16] textColor:[UIColor whiteColor] theFrame:GetFrame(kScreen_width - 165, 30, 150, 30)];
    [blackV addSubview:rightLa];
    
    
    UIView *goodsV = [UIView new];
    goodsV.frame = GetFrame(0, blackV.bottom, kScreen_width, 300);
    goodsV.backgroundColor = [UIColor whiteColor];
    [scroll addSubview:goodsV];
    
    UIImageView *headerImg = [UIImageView new];
    headerImg.frame = GetFrame(15, 57, 25, 25);
    headerImg.layer.masksToBounds = YES;
    headerImg.layer.cornerRadius = 25/2;
    headerImg.backgroundColor = [UIColor redColor];
    [goodsV addSubview:headerImg];
    
    UILabel *label = [WZHObject LabelWithText:@"怡良正品" font:[UIFont systemFontOfSize:15] textColor:TEXTCOLOR theFrame:GetFrame(headerImg.right + 5, 54, 100, 30)];
    [goodsV addSubview:label];
    
    UILabel *zhuangtai = [[UILabel alloc] init];
    CGFloat W;
    NSString *str;
    NSArray *arr;
    if ([_orderType isEqualToString:@"1"]) {
        str = @"待付款";
        arr = @[@"取消订单",@"再来一单"];
    } else if ([_orderType isEqualToString:@"2"]) {
        str = @"已取消";
        arr = @[@"删除订单",@"再来一单"];
    } else if ([_orderType isEqualToString:@"3"]) {
        str = @"待发货";
        arr = @[@"取消订单",@"再来一单"];
    } else if ([_orderType isEqualToString:@"4"]) {
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
    zhuangtai.frame = GetFrame(kScreen_width - W - 10, 54, W, 30);
    zhuangtai.textAlignment = NSTextAlignmentRight;
//    [goodsV addSubview:zhuangtai];
    
    UIView * shangV = [[UIView alloc] init];
    shangV.frame = GetFrame(0, zhuangtai.bottom + 5, kScreen_width, 80);
    shangV.backgroundColor = [UIColor whiteColor];
    shangV.layer.borderWidth = .5;
    shangV.layer.borderColor = BACKGROUNDCOLOR.CGColor;
    [goodsV addSubview:shangV];
    
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
    
    UILabel *name = [[UILabel alloc] initWithFrame:GetFrame(img.right + 15, 7, kScreen_width - img.width - 35, 40)];
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
    
    UILabel *moneyL = [WZHObject LabelWithText:@"￥2999.00" font:[UIFont systemFontOfSize:15] textColor:TEXTCOLOR theFrame:GetFrame(img.right + 15, name.bottom + 5, kScreen_width - img.width - 145, 30)];
    [shangV addSubview:moneyL];
    
    UILabel *numberL = [WZHObject LabelWithText:@"X 1" font:[UIFont systemFontOfSize:15] textColor:TEXTCOLOR theFrame:GetFrame(moneyL.right, name.bottom + 5, 100, 30)];
    numberL.textAlignment = NSTextAlignmentRight;
    [shangV addSubview:numberL];
    
    UIButton *phoneBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [phoneBtn setTitle:@"联系客服" forState:UIControlStateNormal];
    phoneBtn.titleLabel.font = [UIFont systemFontOfSize:13];
    [phoneBtn setTitleColor:RGBcolor(51, 51, 51) forState:UIControlStateNormal];
    phoneBtn.frame = GetFrame(0, shangV.bottom, kScreen_width, 45);
    [goodsV addSubview:phoneBtn];
    
    CGRect rect = goodsV.frame;
    rect.size.height = CGRectGetMaxY(phoneBtn.frame);
    goodsV.frame = rect;
    
    UIView *centerV = [UIView new];
    centerV.backgroundColor = [UIColor whiteColor];
    centerV.frame = GetFrame(15, 80, kScreen_width - 30, 90);
    centerV.layer.masksToBounds = YES;
    centerV.layer.cornerRadius = 9;
    [scroll addSubview:centerV];
    
    UILabel *nameLabel = [WZHObject LabelWithText:@"吴先生     18508464470" font:[UIFont systemFontOfSize:17] textColor:TEXTCOLOR theFrame:GetFrame(15, 15, kScreen_width - 60, 30)];
    [centerV addSubview:nameLabel];
    
    UILabel *address = [WZHObject LabelWithText:@"长沙市岳麓区环湖路与麓云路交汇处（梅溪湖大桥以西）" font:[UIFont systemFontOfSize:15] textColor:RGBcolor(102, 102, 102) theFrame:GetFrame(15, nameLabel.bottom, kScreen_width - 60, 45)];
    address.numberOfLines = 0;
    [address sizeToFit];
    [centerV addSubview:address];
    
    
    UIView *orderV = [UIView new];
    orderV.frame = GetFrame(0, goodsV.bottom + 8, kScreen_width, 280);
    orderV.backgroundColor = [UIColor whiteColor];
    [scroll addSubview:orderV];
    
    UILabel *orderN = [WZHObject LabelWithText:@"订单编号：789123678231" font:[UIFont systemFontOfSize:15] textColor:TEXTCOLOR theFrame:GetFrame(15, 5, kScreen_width - 30, 30)];
    [orderV addSubview:orderN];
    
    UILabel *payTime = [WZHObject LabelWithText:@"下单时间：2018-08-19 11：24：14" font:[UIFont systemFontOfSize:15] textColor:TEXTCOLOR theFrame:GetFrame(15, orderN.bottom, kScreen_width - 30, 30)];
    [orderV addSubview:payTime];
    
    UILabel *payType = [WZHObject LabelWithText:@"   支付方式：微信支付" font:[UIFont systemFontOfSize:15] textColor:TEXTCOLOR theFrame:GetFrame(0, payTime.bottom + 10, kScreen_width, 40)];
    payType.layer.borderColor = BACKGROUNDCOLOR.CGColor;
    payType.layer.borderWidth = .5;
    [orderV addSubview:payType];
    
    UILabel *PeiType = [WZHObject LabelWithText:@"配送方式：普通快递" font:[UIFont systemFontOfSize:15] textColor:TEXTCOLOR theFrame:GetFrame(15, payType.bottom + 10, kScreen_width - 30, 30)];
    [orderV addSubview:PeiType];
    
    UILabel *endTime = [WZHObject LabelWithText:@"订单截止日期：2018-09-02 11：24：14" font:[UIFont systemFontOfSize:15] textColor:TEXTCOLOR theFrame:GetFrame(15, PeiType.bottom, kScreen_width - 30, 30)];
    [orderV addSubview:endTime];
    
    CGRect rect1 = orderV.frame;
    rect1.size.height = CGRectGetMaxY(endTime.frame) + 10;
    orderV.frame = rect1;
    
    UIView *moneyV = [UIView new];
    moneyV.frame = GetFrame(0, orderV.bottom + 8, kScreen_width, 130);
    moneyV.backgroundColor = [UIColor whiteColor];
    [scroll addSubview:moneyV];
    
    NSArray *leftA = @[@"商品总额",@"运费",@"合计"];
    NSArray *rightA = @[@"￥ 2999.00",@"￥ 0.00",@"￥ 2999.00"];
    for (int i = 0; i < 3; i ++) {
        UILabel *leftL = [WZHObject LabelWithText:leftA[i] font:[UIFont systemFontOfSize:15] textColor:TEXTCOLOR theFrame:GetFrame(15, i * 40 + 10, 150, 40)];
        [moneyV addSubview:leftL];
        
        UILabel *rightL = [WZHObject LabelWithText:rightA[i] font:[UIFont systemFontOfSize:15] textColor:TEXTCOLOR theFrame:GetFrame(leftL.right, i * 40 + 10, kScreen_width - 180, 40)];
        if (i == 2) {
            rightL.textColor = [UIColor redColor];
        }
        rightL.textAlignment = NSTextAlignmentRight;
        [moneyV addSubview:rightL];
    }
    
    CGFloat maxH = CGRectGetMaxY(moneyV.frame);
    scroll.contentSize = CGSizeMake(kScreen_width, maxH + 15);
}

- (void)initBottomView
{
    bottomV = [[UIView alloc] init];
    if (iPhoneX) {
        bottomV.frame = GetFrame(0, kScreen_height - 166, kScreen_width, 54);
    } else {
        bottomV.frame = GetFrame(0, kScreen_height - 118, kScreen_width, 54);
    }
    bottomV.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:bottomV];
    
    UIView *line = [WZHObject addSegLine:GetFrame(0, 0, kScreen_width, .6)];
    [bottomV addSubview:line];
    
    NSArray *arr;
    if ([_orderType isEqualToString:@"1"]) {
        arr = @[@"取消订单",@"再来一单"];
    } else if ([_orderType isEqualToString:@"2"]) {
        arr = @[@"删除订单",@"再来一单"];
    } else if ([_orderType isEqualToString:@"3"]) {
        arr = @[@"取消订单",@"再来一单"];
    } else if ([_orderType isEqualToString:@"4"]) {
        arr = @[@"申请售后",@"查看物流",@"确认收货"];
    } else {
        arr = @[@"删除订单",@"订单申诉",@"待评价",@"再来一单"];
    }
    
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
            btn.frame = GetFrame(kScreen_width - W - 20 - 10, 12, W + 20, 30);
        } else {
            btn.frame = GetFrame(nextB.left - W - 30, 12, W + 20, 30);
        }
//        btn.tag = indexPath.row;
        btn.layer.masksToBounds = YES;
        btn.layer.cornerRadius = 15;
        btn.layer.borderWidth = .5;
        [btn addTarget:self action:@selector(btnsAction:) forControlEvents:UIControlEventTouchUpInside];
        nextB = btn;
        [bottomV addSubview:btn];
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
