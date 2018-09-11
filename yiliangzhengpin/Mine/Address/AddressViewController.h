//
//  AddressViewController.h
//  yiliangzhengpin
//
//  Created by 吴祖辉 on 2018/9/7.
//  Copyright © 2018年 吴祖辉. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AddressViewController : UIViewController<UITableViewDelegate,UITableViewDataSource>
{
    UITableView *table;
}

@property (nonatomic, copy)NSString *isChange;//选择收货地址----1   编辑新增收货地址----2

@end
