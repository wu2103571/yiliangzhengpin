//
//  AddAddressViewController.m
//  yiliangzhengpin
//
//  Created by 吴祖辉 on 2018/9/7.
//  Copyright © 2018年 吴祖辉. All rights reserved.
//

#import "AddAddressViewController.h"

@interface AddAddressViewController ()

@end

@implementation AddAddressViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    if ([_isAdd isEqualToString:@"1"]) {
        self.title = @"新建收货地址";
    } else {
        self.title = @"编辑收货地址";
    }
    
    self.view.backgroundColor = BACKGROUNDCOLOR;
    
    [self initView];
}

- (void)initView
{
    table = [[UITableView alloc] initWithFrame:GetFrame(0, 10, kScreen_width, kScreen_height - 159) style:UITableViewStylePlain];
    table.delegate = self;
    table.dataSource = self;
    table.backgroundColor = BACKGROUNDCOLOR;
    table.tableFooterView = [UIView new];
    [self.view addSubview:table];
    
    UIButton *btn = [WZHObject btnWithText:@"使用并保存" font:[UIFont systemFontOfSize:16] textColor:[UIColor whiteColor] theFrame:GetFrame(15, kScreen_height - 129, kScreen_width - 30, 45) backColor:RGBcolor(51, 51, 51)];
    btn.layer.masksToBounds = YES;
    btn.layer.cornerRadius = 45/2;
    [btn addTarget:self action:@selector(button1BackGroundHighlighted:) forControlEvents:UIControlEventTouchDown];
    [btn addTarget:self action:@selector(button1BackGroundNormal:) forControlEvents:UIControlEventTouchUpInside];
    [btn addTarget:self action:@selector(addAddressBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
}

//  button1普通状态下的背景色
- (void)button1BackGroundNormal:(UIButton *)sender
{
    sender.backgroundColor = RGBcolor(51, 51, 51);
}

//  button1高亮状态下的背景色
- (void)button1BackGroundHighlighted:(UIButton *)sender
{
    sender.backgroundColor = RGBcolor(102, 102, 102);
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 5;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 4) {
        return 80;
    } else {
        return 55;
    }
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
    [self setupStatus:cell ForRowAtIndexPath:indexPath];
    
    return cell;
}

- (void)setupStatus:(UITableViewCell *)cell ForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSArray *arr = @[@"收货人名",@"手机号码",@"所在地区",@"详细地址",@"默认地址"];\
    NSArray *ar = @[@"请输入收货人姓名",@"请输入收货人手机号码",@"选择所在地区",@"填写详细收货地址"];
    
    UILabel *leftL = [WZHObject LabelWithText:arr[indexPath.row] font:[UIFont systemFontOfSize:15] textColor:TEXTCOLOR theFrame:CGRectZero];
    
    [cell addSubview:leftL];
    
    if (indexPath.row == 4) {
        leftL.frame = GetFrame(15, 10, 100, 30);
        UILabel *bottomL = [WZHObject LabelWithText:@"注：每次下单会使用地址" font:[UIFont systemFontOfSize:13] textColor:RGBcolor(153, 153, 153) theFrame:GetFrame(15, leftL.bottom, 200, 30)];
        [cell addSubview:bottomL];
        
        UISwitch *Myswitch = [[UISwitch alloc] init];
        Myswitch.frame = GetFrame(kScreen_width - 66, 25, 0, 0);
        Myswitch.on = YES;
        [Myswitch setOnTintColor:RGBcolor(102, 102, 102)];
        Myswitch.transform = CGAffineTransformMakeScale(0.7, 0.7);
//        [Myswitch addTarget:self action:@selector(choosePreson:) forControlEvents:UIControlEventValueChanged];
        [cell addSubview:Myswitch];
    } else {
        leftL.frame = GetFrame(15, 0, 100, 55);
        
        UITextField *textF = [[UITextField alloc] init];
        textF.placeholder = ar[indexPath.row];
        textF.font = [UIFont systemFontOfSize:13];
        textF.frame = GetFrame(leftL.right + 5, 0, kScreen_width - 165, 55);
        [cell addSubview:textF];
        
        if (indexPath.row == 2) {
            UIButton *btn = [WZHObject btnWithText:@"" font:[UIFont systemFontOfSize:12] textColor:TEXTCOLOR theFrame:GetFrame(leftL.right + 5, 0, kScreen_width - 135, 55) backColor:[UIColor clearColor]];
            
            [cell addSubview:btn];
            
            UIImageView *img = [[UIImageView alloc] init];
            img.frame = GetFrame(kScreen_width - 30, 17.5, 20, 20);
            img.backgroundColor = [UIColor redColor];
            [cell addSubview:img];
        }
        
    }
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
