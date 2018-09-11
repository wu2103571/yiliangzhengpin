//
//  AboutUsViewController.m
//  yiliangzhengpin
//
//  Created by 吴祖辉 on 2018/9/7.
//  Copyright © 2018年 吴祖辉. All rights reserved.
//

#import "AboutUsViewController.h"

@interface AboutUsViewController ()

@end

@implementation AboutUsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"关于我们";
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self initView];
}

- (void)initView
{
    UILabel *nameL = [WZHObject LabelWithText:@"关于我们" font:[UIFont systemFontOfSize:20] textColor:TEXTCOLOR theFrame:GetFrame(15, 20, 100, 30)];
    [self.view addSubview:nameL];
    
    UILabel *label = [[UILabel alloc] init];
    label.frame = CGRectMake(15,nameL.bottom + 10,kScreen_width - 30,200);
    label.text = @"怡良正品APP是中国深受欢迎的网购零售平台，目前拥有近1亿的注册用户数，每天有超过1000万的固定访客，同时每天的在线商品数已经超过了2亿件，平均每分钟售出0.8万件商品";
    label.font = [UIFont fontWithName:@"MicrosoftYaHei" size:15];
    label.textColor = [UIColor colorWithRed:102/255.0 green:102/255.0 blue:102/255.0 alpha:1];
    label.numberOfLines = 0;
    [label sizeToFit];
    [self.view addSubview:label];
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
