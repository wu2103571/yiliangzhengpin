//
//  MyOrderViewController.h
//  yiliangzhengpin
//
//  Created by 吴祖辉 on 2018/9/10.
//  Copyright © 2018年 吴祖辉. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MyOrderViewController : UIViewController<UITableViewDelegate,UITableViewDataSource>
{
    UIView *TopView;
    
    UIView *seleteView;
    
    UITableView *table;
}
@property (nonatomic, assign)NSInteger chooseIndex;  //0-----全部  1-----待付款  2------待收货  3-----待评价  4-----退换/售后

@end
