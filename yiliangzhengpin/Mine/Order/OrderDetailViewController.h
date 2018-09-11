//
//  OrderDetailViewController.h
//  yiliangzhengpin
//
//  Created by 吴祖辉 on 2018/9/10.
//  Copyright © 2018年 吴祖辉. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface OrderDetailViewController : UIViewController
{
    UIScrollView *scroll;
    
    UIView *bottomV;
}

@property (nonatomic, copy)NSString *orderType; //1-----待付款 2---已取消 3---待发货  4---待收货  5----已完成

@end
