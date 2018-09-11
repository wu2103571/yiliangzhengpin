//
//  HomeCollectionViewCell.h
//  yiliangzhengpin
//
//  Created by 吴祖辉 on 2018/9/5.
//  Copyright © 2018年 吴祖辉. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HomeCollectionViewCell : UICollectionViewCell
@property (weak, nonatomic) IBOutlet UIImageView *TopImage;
@property (weak, nonatomic) IBOutlet UILabel *NameLabel;
@property (weak, nonatomic) IBOutlet UILabel *MoneyLabel;
@property (weak, nonatomic) IBOutlet UILabel *saleLabel;
@property (weak, nonatomic) IBOutlet UILabel *GoodLabel;

@end
