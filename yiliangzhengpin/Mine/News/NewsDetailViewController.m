//
//  NewsDetailViewController.m
//  yiliangzhengpin
//
//  Created by 吴祖辉 on 2018/9/7.
//  Copyright © 2018年 吴祖辉. All rights reserved.
//

#import "NewsDetailViewController.h"

@interface NewsDetailViewController ()

@end

@implementation NewsDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"详情";
    self.view.backgroundColor = [UIColor whiteColor];
    
    UILabel *nameL = [WZHObject LabelWithText:@"物流消息" font:[UIFont systemFontOfSize:20] textColor:TEXTCOLOR theFrame:GetFrame(15, 20, 100, 30)];
    [self.view addSubview:nameL];
    
    UILabel *timeL = [WZHObject LabelWithText:@"时间：2018-08-30 12：10" font:[UIFont systemFontOfSize:15] textColor:RGBcolor(153, 153, 153) theFrame:GetFrame(15, nameL.bottom + 5, kScreen_width - 30, 30)];
    [self.view addSubview:timeL];
    
    UILabel *detailL = [WZHObject LabelWithText:@"您的订单已发货，请确认查收。" font:[UIFont systemFontOfSize:15] textColor:RGBcolor(102, 102, 102) theFrame:GetFrame(15, timeL.bottom + 20, kScreen_width - 30, 100)];
    detailL.numberOfLines = 0;
    [detailL sizeToFit];
    [self.view addSubview:detailL];
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
