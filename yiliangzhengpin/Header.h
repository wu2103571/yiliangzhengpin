//
//  Header.h
//  yiliangzhengpin
//
//  Created by 吴祖辉 on 2018/9/4.
//  Copyright © 2018年 吴祖辉. All rights reserved.
//

#ifndef Header_h
#define Header_h

#import "UIViewExt.h"
#import "WZHObject.h"

#define KEYWINDOW  [UIApplication sharedApplication].keyWindow
#define kScreen_height [UIScreen mainScreen].bounds.size.height  //高度
#define kScreen_width [UIScreen mainScreen].bounds.size.width    //宽度

#define WIDTH_SCALE     kScreen_width/750.0f // 宽比例 要乘以 标注值
#define HEIGHT_SCALE    kScreen_height/1334.0f  // 高度比 乘以标注值

#define HIDEKEYBOARD  [[UIApplication sharedApplication].keyWindow endEditing:YES]

//#define userId [[NSUserDefaults standardUserDefaults] objectForKey:@"userId"]

/// 通用橙色
#define ORANGECOLOR [UIColor colorWithRed:((float)((0xfc5334 & 0xFF0000) >> 16))/255.0 green:((float)((0xfc5334 & 0xFF00) >> 8))/255.0 blue:((float)(0xfc5334 & 0xFF))/255.0 alpha:1]

#define iPhone5 ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(640, 1136), [[UIScreen mainScreen] currentMode].size) : NO)

#define iPhone6 ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(750, 1334), [[UIScreen mainScreen] currentMode].size) : NO)

#define iPhone6P ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1242, 2208), [[UIScreen mainScreen] currentMode].size) : NO)

#define iPhoneX ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1125, 2436), [[UIScreen mainScreen] currentMode].size) : NO)

//通用背景色
#define BACKGROUNDCOLOR RGBcolor(238, 238, 238)
#define kXMGlobleColor RGBcolor(252, 38, 84)

/// 通用黑色字体
#define TEXTCOLOR [UIColor colorWithRed:((float)((0x333333 & 0xFF0000) >> 16))/255.0 green:((float)((0x333333 & 0xFF00) >> 8))/255.0 blue:((float)(0x333333 & 0xFF))/255.0 alpha:1]

//随机颜色
#define RGBcolor(r,g,b) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:1]
#define UIColorFromRGB(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]

#define GetFrame(X_axis,Y_axis,Width,height) CGRectMake(X_axis, Y_axis, Width, height)
#define GetTextSize(size) kScreen_width == 320 ? size : kScreen_width == 375 ? (size + 1) : (size + 2)
//字体大小
#define Font(s) [UIFont fontWithName:@"PingFang-SC-Regular" size:(GetTextSize(s))];

#define PFR [[[UIDevice currentDevice] systemVersion] floatValue] >= 9.0 ? @"PingFangSC-Regular" : @"PingFang SC"
#define PFR20Font [UIFont fontWithName:PFR size:20];
#define PFR18Font [UIFont fontWithName:PFR size:18];
#define PFR16Font [UIFont fontWithName:PFR size:16];
#define PFR15Font [UIFont fontWithName:PFR size:15];
#define PFR14Font [UIFont fontWithName:PFR size:14];
#define PFR13Font [UIFont fontWithName:PFR size:13];
#define PFR12Font [UIFont fontWithName:PFR size:12];
#define PFR11Font [UIFont fontWithName:PFR size:11];
#define PFR10Font [UIFont fontWithName:PFR size:10];

//系统版本
#define SystemVersion [[UIDevice currentDevice] systemVersion].floatValue

//输出日志
#ifdef DEBUG
#define NSLog(...) NSLog(__VA_ARGS__)
#else
#define NSLog(...);
#endif
//弱引用
#ifndef DYWeakSelf//(type)
#define DYWeakSelf(type)  __weak typeof(type) weak##type = type;
#endif

#endif /* Header_h */
