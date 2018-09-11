//
//  ModifyPWDViewController.m
//  yiliangzhengpin
//
//  Created by 吴祖辉 on 2018/9/7.
//  Copyright © 2018年 吴祖辉. All rights reserved.
//

#import "ModifyPWDViewController.h"

@interface ModifyPWDViewController ()

@end

@implementation ModifyPWDViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.title = @"修改密码";
    self.view.backgroundColor = BACKGROUNDCOLOR;
    
    [self initView];
}

- (void)initView
{
    UIView *view = [UIView new];
    view.backgroundColor = [UIColor whiteColor];
    view.frame = GetFrame(0, 15, kScreen_width, 100);
    [self.view addSubview:view];
    
    NSArray *ar = @[@"当前登录密码",@"确认新密码"];
    NSArray *arr = @[@"请输入当前登录密码",@"确认新密码"];
    for (int i = 0; i < ar.count; i ++) {
        UILabel *leftL = [WZHObject LabelWithText:ar[i] font:[UIFont systemFontOfSize:14] textColor:TEXTCOLOR theFrame:GetFrame(15, i * 50, 150, 50)];
        [view addSubview:leftL];
        
        UITextField *textF = [[UITextField alloc] init];
        textF.placeholder = arr[i];
        textF.frame = GetFrame(leftL.right + 10, i * 50, kScreen_width - 180, 50);
        textF.font = [UIFont systemFontOfSize:14];
        [view addSubview:textF];
    }
    
    UIView *line = [UIView new];
    line.frame = GetFrame(15, 50, kScreen_width - 15, .7);
    [view addSubview:line];
    
    UIButton *btn = [WZHObject btnWithText:@"确认" font:[UIFont systemFontOfSize:16] textColor:[UIColor whiteColor] theFrame:GetFrame(20, view.bottom + 35, kScreen_width - 40, 45) backColor:RGBcolor(51, 51, 51)];
    btn.layer.masksToBounds = YES;
    btn.layer.cornerRadius = 45/2;
    [btn addTarget:self action:@selector(button1BackGroundHighlighted:) forControlEvents:UIControlEventTouchDown];
    [btn addTarget:self action:@selector(button1BackGroundNormal:) forControlEvents:UIControlEventTouchUpInside];
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
