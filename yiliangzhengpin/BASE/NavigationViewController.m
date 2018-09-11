//
//  NavigationViewController.m
//  yiliao
//
//  Created by 吴祖辉 on 2018/7/19.
//  Copyright © 2018年 com.app. All rights reserved.
//

#import "NavigationViewController.h"
#import "UIBarButtonItem+CustomButtonItem.h"

@interface NavigationViewController ()

@end

@implementation NavigationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    NSDictionary *textAttributes = @{
                                     NSFontAttributeName: [UIFont fontWithName:@"PingFang SC" size:20.0f],
                                     NSForegroundColorAttributeName: TEXTCOLOR
                                     };
    [self.navigationBar setTitleTextAttributes:textAttributes];
    [self.navigationBar setBarTintColor:[UIColor whiteColor]];
    self.navigationBar.translucent = NO;
    self.interactivePopGestureRecognizer.enabled = NO;
}

-(void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    if (self.viewControllers.count > 0) {
        
        viewController.hidesBottomBarWhenPushed = YES;
        
        UIBarButtonItem *negativeSpacer = [[UIBarButtonItem alloc]
                                           initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace
                                           target:nil action:nil];
        negativeSpacer.width = -15;
        viewController.navigationItem.leftBarButtonItem = [UIBarButtonItem ItemWithImage:[UIImage imageNamed:@"sk_fanhui"] WithHighlighted:[UIImage imageNamed:@"sk_fanhui"] Target:self action:@selector(popViewController)];
        
    }
    [super pushViewController:viewController animated:YES];
}

/**
 *  返回上级页面
 */
-(void)popViewController
{
    [self popViewControllerAnimated:YES];
}

/**
 *  设置状态栏字体为白色
 *
 *  @return UIStatusBarStyle
 */
//- (UIStatusBarStyle)preferredStatusBarStyle
//{
//    return UIStatusBarStyleLightContent;
//}

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
