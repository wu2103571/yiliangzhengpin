//
//  TabbarViewController.m
//  yiliao
//
//  Created by 吴祖辉 on 2018/7/19.
//  Copyright © 2018年 com.app. All rights reserved.
//

#import "TabbarViewController.h"
#import "HomeViewController.h"
#import "ClassificationViewController.h"
#import "FindViewController.h"
#import "MineViewController.h"
#import "NavigationViewController.h"

@interface TabbarViewController ()

@end

@implementation TabbarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self _createTabbarView];
    
    [self _createViewControllers];
}

//创建标签页
- (void)_createTabbarView{
    
//    NSArray *imageArray = @[@"hh_shoukuan",@"hh_liushui",@"hh_wode"];
    // 按钮的标题数组
    NSArray *titleArray = @[@"首页",@"分类",@"发现",@"我的"];
    
    // 按钮的宽、高
    CGFloat width = kScreen_width / (float)titleArray.count;
    CGFloat height;
    if (iPhoneX) {
        height = 83;
    } else {
        height = self.tabBar.frame.size.height;
    }
    
    for (int i = 0; i < titleArray.count; i++) {
        
        CGRect frame = CGRectMake(width * i, 0, width, height);
        //使用自定义的按钮样式
        TabbarItem *item = [[TabbarItem alloc] initWithFrame:frame
                                                       title:titleArray[i]];
        item.tag = i;
        if (i == 0) {
            item.isSelected = YES;
            _selectedItem = item;
        }
        
        [item addTarget:self action:@selector(selectAction:)
       forControlEvents:UIControlEventTouchUpInside];
        [self.tabBar addSubview:item];
    }
    
}

- (void)selectAction:(TabbarItem *)item {
    
    if (item != _selectedItem) {
        // 更改选中按钮的状态
        item.isSelected = YES;
        _selectedItem.isSelected = NO;
        _selectedItem = item;
        //跳转至对应的控制器
        self.selectedIndex = item.tag;
    }
}

//创建子控制器
- (void)_createViewControllers{
    
    _controllers = [NSMutableArray array];
    
    //首页 分类 发现 我的
    
    HomeViewController *HVC = [[HomeViewController alloc] init];
    NavigationViewController *HNVC = [[NavigationViewController alloc] initWithRootViewController:HVC];
    HVC.title = @"首页";
    [_controllers addObject:HNVC];

    ClassificationViewController *AVC = [[ClassificationViewController alloc] init];
    NavigationViewController  *ANVC = [[NavigationViewController alloc] initWithRootViewController:AVC];
    AVC.title = @"分类";
    [_controllers addObject:ANVC];

    FindViewController *AHVC = [[FindViewController alloc] init];
    NavigationViewController *AHNVC = [[NavigationViewController alloc] initWithRootViewController:AHVC];
    AHVC.title = @"发现";
    [_controllers addObject:AHNVC];
    
    MineViewController *mine = [[MineViewController alloc] init];
    NavigationViewController *mineVc = [[NavigationViewController alloc] initWithRootViewController:mine];
    mine.title = @"我的";
    [_controllers addObject:mineVc];
    
    self.viewControllers = _controllers;
    
}

//去掉原有标签控制器按钮
- (void)viewWillLayoutSubviews{
    
    [super viewWillLayoutSubviews];
    
    NSArray *subViews = self.tabBar.subviews;
    for (UIView *view in subViews) {
        
        Class cla = NSClassFromString(@"UITabBarButton");
        if ([view isKindOfClass:cla]) {
            
            [view removeFromSuperview];
            
        }
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
