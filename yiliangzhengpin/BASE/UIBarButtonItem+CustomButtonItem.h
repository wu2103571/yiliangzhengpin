//
//  UIBarButtonItem+CustomButtonItem.h
//  ZhiKe
//
//  Created by 谭楚明 on 2017/11/3.
//  Copyright © 2017年 谭楚明. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIBarButtonItem (CustomButtonItem)

+ (UIBarButtonItem *)ItemWithImage:(UIImage *)image
                   WithHighlighted:(UIImage *)HighlightedImage
                            Target:(id)target
                            action:(SEL)action;

+ (UIBarButtonItem *)ItemWithImage:(UIImage *)image
                      WithSelected:(UIImage *)SelectedImage
                            Target:(id)target
                            action:(SEL)action;

#pragma mark ======返回======
+ (UIBarButtonItem *)backItemWithImage:(UIImage *)image
                  WithHighlightedImage:(UIImage *)HighlightedImage
                                Target:(id)target
                                action:(SEL)action
                                 title:(NSString *)title;

@end
