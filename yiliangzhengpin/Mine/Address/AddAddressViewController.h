//
//  AddAddressViewController.h
//  yiliangzhengpin
//
//  Created by 吴祖辉 on 2018/9/7.
//  Copyright © 2018年 吴祖辉. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AddAddressViewController : UIViewController<UITableViewDelegate,UITableViewDataSource>
{
    UITableView *table;
}

@property (nonatomic ,copy)NSString *isAdd;//1------新增  2------编辑

@end
