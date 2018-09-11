//
//  TabbarViewController.h
//  yiliao
//
//  Created by 吴祖辉 on 2018/7/19.
//  Copyright © 2018年 com.app. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TabbarItem.h"

@interface TabbarViewController : UITabBarController{
    
    UILabel *_countLabel;
}

@property (nonatomic,strong)TabbarItem *selectedItem;
@property (nonatomic ,strong)NSMutableArray *controllers;

@property (nonatomic, assign)NSInteger cartNum;

- (void)selectAction:(TabbarItem *)item;

@end
