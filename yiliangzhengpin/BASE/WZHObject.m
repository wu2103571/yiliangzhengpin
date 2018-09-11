//
//  WZHObject.m
//  Siluguiren
//
//  Created by 吴祖辉 on 2017/10/14.
//  Copyright © 2017年 com.app. All rights reserved.
//

#import "WZHObject.h"

@implementation WZHObject

// 计算Label占用的宽度
+ (CGFloat)widthWithString:(NSString *)string font:(UIFont *)font andWidth:(CGFloat )width
{
    CGRect rect = [string boundingRectWithSize:CGSizeMake(width, 8000)//限制最大的宽度和高度
                                       options:NSStringDrawingTruncatesLastVisibleLine | NSStringDrawingUsesFontLeading  | NSStringDrawingUsesLineFragmentOrigin //采用换行模式
                                    attributes:@{NSFontAttributeName: font}//传人的字体字典
                                       context:nil];
    return rect.size.width;
}
+ (CGFloat)getHeightWithString:(NSString *)string font:(UIFont *)font andWidth:(CGFloat )width
{
    CGRect rect = [string boundingRectWithSize:CGSizeMake(width, 8000)//限制最大的宽度和高度
                                       options:NSStringDrawingTruncatesLastVisibleLine | NSStringDrawingUsesFontLeading  | NSStringDrawingUsesLineFragmentOrigin //采用换行模式
                                    attributes:@{NSFontAttributeName: font}//传人的字体字典
                                       context:nil];
    return rect.size.height;
}

+ (UIView *)addSegView:(CGRect )frame
{
    UIView * segView               = [[UIView alloc] initWithFrame:frame];
    segView.backgroundColor = BACKGROUNDCOLOR;
    for (int i = 0 ;  frame.size.height < 7 ? i < 1 : i < 2 ;  i++) {
        UIView * lineView               = [[UIView alloc] initWithFrame:GetFrame(0, i == 0 ? 0 : frame.size.height - 0.6, kScreen_width, 0.6)];
        lineView.backgroundColor = [UIColor colorWithWhite:0.7 alpha:.3];
        [segView addSubview:lineView];
    }
    return segView;
}

/// 分割线
+ (UIView *)addSegLine:(CGRect)frame
{
    UIView* segView         = [[UIView alloc] initWithFrame:frame];
    segView.backgroundColor = BACKGROUNDCOLOR;
    return segView;
}

+ (UIViewController *)getViewController:(NSString *)className hiddenTabBar:(BOOL)isHidden
{
    UIViewController * vc                 = [(UIViewController *)[NSClassFromString(className) alloc] init];
    vc.hidesBottomBarWhenPushed = isHidden;
    return vc;
}

//// 时间计算
+ (NSString *)getUTCFormateDate:(NSString *)newsDate
{
    NSDateFormatter * dateFormatter = [[NSDateFormatter alloc] init];
    if (newsDate.length             > 18)
    {
        [dateFormatter setDateFormat:@"yyyy/MM/dd HH:mm:ss"];
    }
    else
    {
        [dateFormatter setDateFormat:@"yyyy/MM/dd HH:mm"];
    }
    
    NSDate * newsDateFormatted      = [dateFormatter dateFromString:newsDate];
    [dateFormatter setTimeZone:[NSTimeZone localTimeZone]];
    NSDate * current_date           = [[NSDate alloc] init];
    NSTimeInterval time             = [current_date timeIntervalSinceDate:newsDateFormatted]; //间隔的秒数
    int month                       = ((int)time) / (3600 * 24 * 30);
    int days                        = ((int)time) / (3600 * 24);
    int hours                       = ((int)time) % (3600 * 24 ) / 3600;
    int minute                      = ((int)time) % (3600 * 24 ) / 60;
    NSString * dateContent          = [newsDate substringToIndex:16];
    if (days                        == 0 && month == 0 && hours == 0 && minute == 0)
    {
        dateContent                 = @"刚刚";
    }
    if (days                        == 0 && month == 0 && hours == 0 && minute != 0)
    {
        dateContent                 = [NSString stringWithFormat:@"%i%@",minute,@"分钟前"];
    }
    if (days                        == 0 && month == 0 && hours != 0 && minute != 0)
    {
        int rom                     = minute - hours * 60;
        if (rom                     == 0)
        {
            dateContent             = [NSString stringWithFormat:@"%i%@",hours,@"小时前"];
        }
        else
        {
            dateContent             = [NSString stringWithFormat:@"%i%@%i%@",hours,@"小时",rom,@"分钟前"];
        }
    }
    if (days                        != 0 && month == 0 && hours != 0 && minute != 0) {
        dateContent                 = [NSString stringWithFormat:@"%i%@",days,@"天前"];
    }
    //    if (days                        != 0 && month != 0 && hours != 0 && minute != 0) {
    //        dateContent                 = [NSString stringWithFormat:@"%i%@",month,@"个月前"];
    //    }
    return dateContent;
}

+ (NSString *)getUTFString:(NSString *)str
{
    NSString *encode = [str stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLQueryAllowedCharacterSet]];
    return encode;
}

+ (BOOL)emptyStr:(NSString *)string {
    return [string isKindOfClass:[NSNull class]] || string == nil || [string isEqualToString:@""] || [string isEqualToString:@"0"];
}

+ (BOOL)empty:(id)value {
    if ([value isKindOfClass:[NSNull class]] || value == nil) {
        return true;
    }
    if ([value isKindOfClass:[NSString class]]) {
        return [value isEqualToString:@""];
    }
    else if ([value isKindOfClass:[NSArray class]]) {
        return [(NSArray *)value count] == 0;
    }
    else if ([value isKindOfClass:[NSDictionary class]]) {
        return [(NSDictionary *)value count] == 0;
    }
    return false;
}

+(BOOL)judgePassWordLegal:(NSString *)pass {
    BOOL result = false;
    if ([pass length] >= 8){
        // 判断长度大于8位后再接着判断是否同时包含数字和字符
        NSString * regex = @"^(?![0-9]+$)(?![a-zA-Z]+$)[0-9A-Za-z]{8,20}$";
        NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
        result = [pred evaluateWithObject:pass];
    }
    return result;
}

/***初级写法***/
+ (void)clearUserInfo {
    [[NSUserDefaults standardUserDefaults] removeObjectForKey:@"headImgUrl"];
    [[NSUserDefaults standardUserDefaults] removeObjectForKey:@"loginName"];
    [[NSUserDefaults standardUserDefaults] removeObjectForKey:@"phone"];
    [[NSUserDefaults standardUserDefaults] removeObjectForKey:@"pwd"];
    [[NSUserDefaults standardUserDefaults] removeObjectForKey:@"sex"];
    [[NSUserDefaults standardUserDefaults] removeObjectForKey:@"userId"];
    [[NSUserDefaults standardUserDefaults] removeObjectForKey:@"islogin"];
    [[NSUserDefaults standardUserDefaults] removeObjectForKey:@"shopId"];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

+ (UILabel *)LabelWithText:(NSString *)text font:(UIFont *)font textColor:(UIColor *)color theFrame:(CGRect)fram
{
    UILabel *label = [UILabel new];
    label.text = text;
    label.frame = fram;
    label.textColor = color;
    label.font = font;
    
    return label;
}

+ (UIButton *)btnWithText:(NSString *)text font:(UIFont *)font textColor:(UIColor *)color theFrame:(CGRect)fram backColor:(UIColor *)backColor
{
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn setTitle:text forState:UIControlStateNormal];
    btn.frame = fram;
    [btn setTitleColor:color forState:UIControlStateNormal];
    btn.titleLabel.font = font;
    [btn setBackgroundColor:backColor];
    return btn;
}

///***清除Document目录下文件，销毁单例对象数据**/
//+ (void)removeUserInfo {
//    NSFileManager *fileManager = [NSFileManager defaultManager];
//    [fileManager removeItemAtPath:UserLoginPath error:nil];
//    [UserModel tearDown];
//}

@end
