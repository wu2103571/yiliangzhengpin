//
//  FindViewController.m
//  yiliangzhengpin
//
//  Created by 吴祖辉 on 2018/9/4.
//  Copyright © 2018年 吴祖辉. All rights reserved.
//

#import "FindViewController.h"

@interface FindViewController ()

@end

@implementation FindViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor greenColor];
    
    
    [self initTable];
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

- (void)initTable
{
    table = [[UITableView alloc] init];
    table.delegate = self;
    table.dataSource = self;
    table.frame = GetFrame(0, 0, kScreen_width, kScreen_height - 64);
    table.tableFooterView = [UIView new];
    [self.view addSubview:table];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 5;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [self tableView:tableView cellForRowAtIndexPath:indexPath];
    return cell.frame.size.height;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *CellIdentifier = [NSString stringWithFormat:@"Cell%ld%ld", (long)[indexPath section], (long)[indexPath row]];
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    for (UIView *view in cell.subviews) {
        [view removeFromSuperview];
    }
    cell.accessoryType = UITableViewCellAccessoryNone;
    [self setupStatus:cell ForRowAtIndexPath:indexPath];
    
    return cell;
}

- (void)setupStatus:(UITableViewCell *)cell ForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UIImageView *imageView = [[UIImageView alloc] init];
    imageView.frame = CGRectMake(0,0,kScreen_width,175 / (375 / kScreen_width));
    imageView.backgroundColor = [UIColor redColor];
    [cell addSubview:imageView];
    
    UILabel *name = [[UILabel alloc] init];
    name.frame = CGRectMake(14,imageView.bottom,kScreen_width - 28,30);
    name.text = @"荣耀Magic 2探索巅峰 真·全面屏手机将至";
    name.font = [UIFont systemFontOfSize:14];
    name.textColor = [UIColor colorWithRed:0/255.0 green:0/255.0 blue:0/255.0 alpha:1];
    [cell addSubview:name];
    
    UILabel *detailL = [[UILabel alloc] init];
    detailL.frame = CGRectMake(14,name.bottom,kScreen_width - 28,35);
    detailL.text = @"自从智能手机诞生以来，手机屏幕就在一步步侵蚀边框与实体键盘的空间。";
    detailL.font = [UIFont systemFontOfSize:14];
    detailL.textColor = [UIColor colorWithRed:102/255.0 green:102/255.0 blue:102/255.0 alpha:1];
    detailL.numberOfLines = 2;
    [detailL sizeToFit];
    [cell addSubview:detailL];
    
    UILabel *time = [[UILabel alloc] init];
    time.frame = CGRectMake(14,detailL.bottom + 5,100,20);
    time.text = @"08-30";
    time.font = [UIFont systemFontOfSize:12];
    time.textColor = [UIColor colorWithRed:153/255.0 green:153/255.0 blue:153/255.0 alpha:1];
    [cell addSubview:time];
    
    UILabel *number = [[UILabel alloc] init];
    number.frame = CGRectMake(kScreen_width - 114,detailL.bottom + 5,100,20);
    number.text = @"3784 阅读";
    number.font = [UIFont systemFontOfSize:12];
    number.textAlignment = NSTextAlignmentRight;
    number.textColor = [UIColor colorWithRed:153/255.0 green:153/255.0 blue:153/255.0 alpha:1];
    [cell addSubview:number];
    
    UIView *bottomV = [UIView new];
    bottomV.backgroundColor = BACKGROUNDCOLOR;
    bottomV.frame = GetFrame(0, time.bottom + 5, kScreen_width, 8);
    [cell addSubview:bottomV];
    
    
    CGRect rect = cell.frame;
    rect.size.height = CGRectGetMaxY(bottomV.frame) ;
    
    cell.frame = rect;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
