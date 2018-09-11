//
//  HomeViewController.h
//  yiliangzhengpin
//
//  Created by 吴祖辉 on 2018/9/4.
//  Copyright © 2018年 吴祖辉. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SDCycleScrollView.h"

@interface HomeViewController : UIViewController<UIScrollViewDelegate,SDCycleScrollViewDelegate,UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout>
{
    UIButton *leftButton;
    UIView *titleView;
    
    UIScrollView *scroll;
    
    SDCycleScrollView   *_topBannerView;

    NSMutableArray *bannerA;

}

@property (nonatomic, strong) UICollectionView *shareCollectionView;

@end
