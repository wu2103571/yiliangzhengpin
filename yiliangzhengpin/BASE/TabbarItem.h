//
//  TabbarItem.h
//  yiliao
//
//  Created by 吴祖辉 on 2018/7/19.
//  Copyright © 2018年 com.app. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TabbarItem : UIControl

@property (nonatomic, assign)BOOL isSelected;

- (id)initWithFrame:(CGRect)frame
              title:(NSString *)title;
@end
