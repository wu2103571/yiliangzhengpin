//
//  ContactViewController.m
//  yiliangzhengpin
//
//  Created by 吴祖辉 on 2018/9/7.
//  Copyright © 2018年 吴祖辉. All rights reserved.
//

#import "ContactViewController.h"

@interface ContactViewController ()

@end

@implementation ContactViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.title = @"商务合作联系";
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self initView];
}
- (void)initView
{
    UILabel *topL = [WZHObject LabelWithText:@"商务合作联系" font:[UIFont systemFontOfSize:20] textColor:TEXTCOLOR theFrame:GetFrame(15, 35, kScreen_width - 30, 30)];
    [self.view addSubview:topL];
    
    UILabel *nameL = [WZHObject LabelWithText:@"联系人：      怡良商城" font:[UIFont systemFontOfSize:15] textColor:RGBcolor(102, 102, 102) theFrame:GetFrame(15, topL.bottom + 20, kScreen_width - 30, 30)];
    [self.view addSubview:nameL];
    
    UILabel *phonrL = [WZHObject LabelWithText:@"联系电话：  15067890178" font:[UIFont systemFontOfSize:15] textColor:RGBcolor(102, 102, 102) theFrame:GetFrame(15, nameL.bottom + 5, kScreen_width - 30, 30)];
    [self.view addSubview:phonrL];
    
    UILabel *emailL = [WZHObject LabelWithText:@"邮  箱：        471684313@qq.com" font:[UIFont systemFontOfSize:15] textColor:RGBcolor(102, 102, 102) theFrame:GetFrame(15, phonrL.bottom + 5, kScreen_width - 30, 30)];
    [self.view addSubview:emailL];
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
