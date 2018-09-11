//
//  NewsViewController.h
//  yiliangzhengpin
//
//  Created by 吴祖辉 on 2018/9/7.
//  Copyright © 2018年 吴祖辉. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NewsViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>
{
    UITableView *table;
}
@end
