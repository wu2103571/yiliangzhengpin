//
//  ControllerTool.m
//  yiliao
//
//  Created by 吴祖辉 on 2018/7/19.
//  Copyright © 2018年 com.app. All rights reserved.
//

#import "ControllerTool.h"
#import "AppDelegate.h"
#import "TabbarViewController.h"
#import "NavigationViewController.h"

@implementation ControllerTool

+ (void)chooseRootViewController
{
    [UIApplication sharedApplication].statusBarHidden = NO;
    AppDelegate *appdelegate = (AppDelegate *)[UIApplication sharedApplication].delegate;
    appdelegate.window.rootViewController = [[TabbarViewController alloc] init];
}

@end
