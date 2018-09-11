//
//  MineViewController.h
//  yiliangzhengpin
//
//  Created by 吴祖辉 on 2018/9/4.
//  Copyright © 2018年 吴祖辉. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MineViewController : UIViewController<UITableViewDelegate,UITableViewDataSource>
{
    NSArray *fiveBtnArr;
    
    NSArray *midCellArr;
    
    NSArray *imgArr;
    
    UITableView *table;
}
@end
