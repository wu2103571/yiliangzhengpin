//
//  TabbarItem.m
//  yiliao
//
//  Created by 吴祖辉 on 2018/7/19.
//  Copyright © 2018年 com.app. All rights reserved.
//

#import "TabbarItem.h"

@implementation TabbarItem
{
    UIImageView *bgImg;
    UIImageView *imgView;
    UILabel *titleLabel;
    NSString *imgName;
}

- (id)initWithFrame:(CGRect)frame
              title:(NSString *)title {
    
    self = [super initWithFrame:frame];
    if (self) {
        self.contentMode = UIViewContentModeScaleToFill;
        self.backgroundColor = [UIColor whiteColor];
        
        //设置title
        titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(15, 6.5, frame.size.width - 30, 35)];
        titleLabel.text = title;
        titleLabel.textAlignment = NSTextAlignmentCenter;
        titleLabel.backgroundColor = [UIColor clearColor];
        titleLabel.font = [UIFont systemFontOfSize:12];
        titleLabel.textColor = RGBcolor(153, 153, 153);
        titleLabel.layer.cornerRadius = 35 / 2;
        titleLabel.layer.masksToBounds = YES;
        titleLabel.layer.borderWidth = .6;
        titleLabel.layer.borderColor = RGBcolor(153, 153, 153).CGColor;
        [self addSubview:titleLabel];
    }
    return self;
}

- (void)setIsSelected:(BOOL)selected {
    
    if (selected) {
        titleLabel.textColor = [UIColor whiteColor];
        titleLabel.layer.borderColor = [UIColor colorWithRed:.06 green:.46 blue:1 alpha:1].CGColor;
        titleLabel.backgroundColor = RGBcolor(51, 51, 51);
        titleLabel.layer.borderColor = RGBcolor(0, 0, 0).CGColor;
    } else {
        titleLabel.textColor = RGBcolor(153, 153, 153);
        titleLabel.layer.borderColor = TEXTCOLOR.CGColor;
        titleLabel.backgroundColor = [UIColor whiteColor];
        titleLabel.layer.borderColor = RGBcolor(153, 153, 153).CGColor;
    }
}

@end
