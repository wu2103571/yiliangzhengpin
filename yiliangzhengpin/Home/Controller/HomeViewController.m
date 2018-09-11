//
//  HomeViewController.m
//  yiliangzhengpin
//
//  Created by 吴祖辉 on 2018/9/4.
//  Copyright © 2018年 吴祖辉. All rights reserved.
//

#import "HomeViewController.h"
#import "HomeCollectionViewCell.h"

static NSString *headerViewIdentifier = @"hederview";

@interface HomeViewController ()

@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor yellowColor];
    
    [self initNavBar];
    
    [self initHeaderView];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    [self.navigationController.navigationBar setBarTintColor:RGBcolor(248, 248, 248)];
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    
    
    [self.navigationController.navigationBar setBarTintColor:[UIColor whiteColor]];
}

- (void)initNavBar
{
    [[[self.navigationController.navigationBar subviews] objectAtIndex:0] setAlpha:0];
    leftButton = [[UIButton alloc]initWithFrame:CGRectMake(20, 0, 30.f, 30.f)];
    leftButton.tag = 101;
    [leftButton setImage:[UIImage imageNamed:@"扫码"] forState:UIControlStateNormal];
    [leftButton addTarget:self
                    action:@selector(NavAction:)
          forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *leftItem = [[UIBarButtonItem alloc]initWithCustomView:leftButton];
    leftButton.backgroundColor = [UIColor whiteColor];
    leftButton.layer.cornerRadius = 30 / 2;
    leftButton.layer.borderWidth = .5;
    leftButton.layer.borderColor = [UIColor colorWithRed:.7 green:.7 blue:.7 alpha:.3].CGColor;
    self.navigationItem.rightBarButtonItem = leftItem;
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    CGRect mainViewBounds = self.navigationController.view.bounds;
    btn.frame = CGRectMake(20, CGRectGetMinY(mainViewBounds)+22, CGRectGetWidth(mainViewBounds)-100, 35);
    btn.layer.cornerRadius = 35 / 2;
    [btn setBackgroundColor:[UIColor whiteColor]];
    [btn setImage:[UIImage imageNamed:@"搜索"] forState:UIControlStateNormal];
    [btn setTitle:@"请输入关键词" forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor colorWithRed:.76 green:.76 blue:.77 alpha:1] forState:UIControlStateNormal];
    btn.titleLabel.font = [UIFont systemFontOfSize:GetTextSize(13)];
    btn.layer.borderWidth = .5;
    btn.layer.borderColor = [UIColor colorWithRed:.7 green:.7 blue:.7 alpha:.3].CGColor;
    [btn addTarget:self action:@selector(searchBtnClick) forControlEvents:UIControlEventTouchUpInside];
    [titleView addSubview:btn];
    [self.navigationController.view addSubview:btn];
}

- (void)initHeaderView
{
    CGFloat itemWidth = (kScreen_width - 10) / 2;
    CGFloat itemHeight = (kScreen_width - 10) / 2 + 90;
    UICollectionViewFlowLayout *shareflowLayout = [[UICollectionViewFlowLayout alloc] init];
    shareflowLayout.scrollDirection = UICollectionViewScrollDirectionVertical;
    shareflowLayout.itemSize =CGSizeMake(itemWidth, itemHeight);
    shareflowLayout.minimumLineSpacing = 10.0f;
    shareflowLayout.minimumInteritemSpacing = 10.0f;
    _shareCollectionView = [[UICollectionView alloc] initWithFrame:GetFrame(0, 0, kScreen_width, kScreen_height - 64)collectionViewLayout:shareflowLayout];
    _shareCollectionView.backgroundColor = BACKGROUNDCOLOR;
    _shareCollectionView.delegate = self;
    _shareCollectionView.dataSource = self;
    [_shareCollectionView registerClass:[UICollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:headerViewIdentifier];
    [_shareCollectionView registerNib:[UINib nibWithNibName:@"HomeCollectionViewCell" bundle:nil] forCellWithReuseIdentifier:@"GradientCell"];
    [self.view addSubview:_shareCollectionView];

    
    
}

- (void)initBtnViewWithtitleArr:(NSArray *)arr andImageArr:(NSArray *)imgArr withInde:(NSInteger)inde withView:(UIView *)view
{
    UIView *btnView = [UIView new];
    btnView.frame = GetFrame(inde * (kScreen_width / arr.count),0 , kScreen_width / arr.count, kScreen_width / 4);
    [view addSubview:btnView];
    
    UIImageView *img = [[UIImageView alloc] init];
//    img.image = [UIImage imageNamed:imgArr[inde]];
    img.backgroundColor = [UIColor redColor];
    img.frame = GetFrame(20, 15, kScreen_width / arr.count - 40, kScreen_width / arr.count - 40);
    [btnView addSubview:img];
    
    UILabel *label = [UILabel new];
    label.text = arr[inde];
    label.font = [UIFont systemFontOfSize:14];
    label.textColor = RGBcolor(102, 102, 102);
    label.frame = GetFrame(0, img.bottom + 10, kScreen_width / arr.count, 20);
    label.textAlignment = NSTextAlignmentCenter;
    [btnView addSubview:label];
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = GetFrame(0, 0, kScreen_width / arr.count, kScreen_width / 4);
    btn.tag = inde + 10;
    [btn addTarget:self action:@selector(threeBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    [btnView addSubview:btn];
    
}

- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath

{
    
    //如果是头视图
    
    if ([kind isEqualToString:UICollectionElementKindSectionHeader]) {
        
        UICollectionReusableView *header=[collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:headerViewIdentifier forIndexPath:indexPath];
        
        UIView *headerV = [UIView new];
        headerV.backgroundColor = BACKGROUNDCOLOR;
        
        bannerA = [NSMutableArray array];
        
        NSArray *banA = @[@"banner01",@"banner02"];
        
        _topBannerView = [SDCycleScrollView cycleScrollViewWithFrame:CGRectMake(0, 0, kScreen_width, (kScreen_width / 4) * 2) imageNamesGroup:banA];
        _topBannerView.infiniteLoop = YES;
        _topBannerView.delegate = self;
        _topBannerView.pageDotColor = [UIColor colorWithRed:1 green:1 blue:1 alpha:.4];
        [headerV addSubview:_topBannerView];
        
        UIView *fourView = [UIView new];
        fourView.backgroundColor = [UIColor whiteColor];
        fourView.frame = GetFrame(0, _topBannerView.bottom, kScreen_width, kScreen_width / 4 + 10);
        [headerV addSubview:fourView];
        
        UIView *line = [UIView new];
        line.backgroundColor = [UIColor colorWithRed:.95 green:.95 blue:.95 alpha:1];
        line.frame = GetFrame(0, kScreen_width / 4 + 9, kScreen_width, 1);
        [fourView addSubview:line];
        
        //    NSArray *arr = @[@"收款码",@"收款",@"银行直联",@"收入"];
        //    NSArray *imgArr = @[@"sy_shoukuanma",@"sy_shoukuan",@"sy_yinghangzhilian",@"sy_shouru"];
        NSArray *arr = @[@"手机数码",@"家用电器",@"精品箱包",@"珠宝首饰",@"美妆护肤"];
        NSArray *imgArr = @[@"sy_shoukuanma",@"sy_shoukuan",@"sy_yinghangzhilian"];
        for (int i = 0; i < arr.count; i ++) {
            [self initBtnViewWithtitleArr:arr andImageArr:imgArr withInde:i withView:fourView];
        }
        
        UIView *centerView = [UIView new];
        centerView.frame = GetFrame(0, fourView.bottom + 15, kScreen_width, 40);
        centerView.backgroundColor = [UIColor whiteColor];
        [headerV addSubview:centerView];
        
        UIView *shu = [[UIView alloc] init];
        shu.frame = CGRectMake(15,27 / 2,2,13);
        shu.backgroundColor = [UIColor colorWithRed:102/255.0 green:102/255.0 blue:102/255.0 alpha:1];
        shu.layer.cornerRadius = 2;
        [centerView addSubview:shu];
        
        UILabel *label = [[UILabel alloc] init];
        label.frame = CGRectMake(shu.right + 12,0,100,40);
        label.text = @"热门推荐";
        label.font = [UIFont systemFontOfSize:14];
        label.textColor = [UIColor colorWithRed:51/255.0 green:51/255.0 blue:51/255.0 alpha:1];
        [centerView addSubview:label];
        
        headerV.frame = GetFrame(0, 0, kScreen_width, 380);
        
        [header addSubview:headerV];
        
        return header;
        
    }
    
    //如果底部视图
    
    return nil;
    
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section {
    
    if (section == 0) {
        
        return CGSizeMake(kScreen_width, 380);
        
    }
    
    else {
        
        return CGSizeMake(0, 0);
        
    }
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}

#pragma mark  返回多少行

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section

{
    
    return 13;
    
}

#pragma markk 返回的单元格

-(HomeCollectionViewCell*)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath

{
    static NSString * CellIdentifier = @"GradientCell";
    
    HomeCollectionViewCell *cell=[collectionView dequeueReusableCellWithReuseIdentifier:CellIdentifier forIndexPath:indexPath];
    
    cell.backgroundColor = [UIColor whiteColor];
    
    cell.TopImage.backgroundColor = [UIColor redColor];
    
    cell.NameLabel.text = @"小米8 全面屏游戏智能手机";
    
    cell.MoneyLabel.text = @"￥2599.00";
    cell.MoneyLabel.textColor = [UIColor redColor];
    
    cell.saleLabel.text = @"月销量 1100285";
    cell.saleLabel.font = [UIFont systemFontOfSize:12];
    cell.saleLabel.textColor = [UIColor colorWithRed:153/255.0 green:153/255.0 blue:153/255.0 alpha:1];
    
    cell.GoodLabel.text = @"99%好评";
    cell.GoodLabel.font = [UIFont systemFontOfSize:12];
    cell.GoodLabel.textAlignment = NSTextAlignmentRight;
    cell.GoodLabel.textColor = [UIColor colorWithRed:153/255.0 green:153/255.0 blue:153/255.0 alpha:1];
    
    return cell;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
