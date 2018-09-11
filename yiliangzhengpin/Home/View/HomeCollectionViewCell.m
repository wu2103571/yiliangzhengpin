//
//  HomeCollectionViewCell.m
//  yiliangzhengpin
//
//  Created by 吴祖辉 on 2018/9/5.
//  Copyright © 2018年 吴祖辉. All rights reserved.
//

#import "HomeCollectionViewCell.h"

@implementation HomeCollectionViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    
    _TopImage.frame = GetFrame(0, 0, (kScreen_width - 10) / 2, (kScreen_width - 10) / 2);
    
    _NameLabel.frame = GetFrame(10, _TopImage.bottom , (kScreen_width - 10) / 2 - 10, 30);
    
    _MoneyLabel.frame = GetFrame(10, _NameLabel.bottom, (kScreen_width - 10) / 2 - 10, 30);
    
    _saleLabel.frame = GetFrame(10, _MoneyLabel.bottom, (kScreen_width - 10) / 2 - 90, 30);
    
    _GoodLabel.frame = GetFrame(_saleLabel.right, _MoneyLabel.bottom, 60, 30);
    
}

@end
