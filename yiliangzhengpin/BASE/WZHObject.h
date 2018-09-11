//
//  WZHObject.h
//  Siluguiren
//
//  Created by 吴祖辉 on 2017/10/14.
//  Copyright © 2017年 com.app. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Header.h"

@interface WZHObject : NSObject

// 计算Label占用的宽度
+ (CGFloat)widthWithString:(NSString *)string font:(UIFont *)font andWidth:(CGFloat )width;
//计算label文字高度
+ (CGFloat)getHeightWithString:(NSString *)string font:(UIFont *)font andWidth:(CGFloat )width;
//分割view
+ (UIView *)addSegView:(CGRect )frame;
//分割线
/// 分割线
+ (UIView *)addSegLine:(CGRect)frame;
+ (UIViewController *)getViewController:(NSString *)className hiddenTabBar:(BOOL)isHidden;

//// 时间计算
+ (NSString *)getUTCFormateDate:(NSString *)newsDate;
+ (NSString *)getUTFString:(NSString *)str;

// 字符串是否为空
+ (BOOL)emptyStr:(NSString *)string;
// 判断 字符串、数组、字典 是否为空
+ (BOOL)empty:(id)value;
//判断字符串是否为数字密码组合
+(BOOL)judgePassWordLegal:(NSString *)pass;

+ (void)clearUserInfo;

+ (void)removeUserInfo;

//Label的偷懒写法
+ (UILabel *)LabelWithText:(NSString *)text font:(UIFont *)font textColor:(UIColor *)color theFrame:(CGRect)fram;
//btn的偷懒写法
+ (UIButton *)btnWithText:(NSString *)text font:(UIFont *)font textColor:(UIColor *)color theFrame:(CGRect)fram backColor:(UIColor *)backColor;

@end
