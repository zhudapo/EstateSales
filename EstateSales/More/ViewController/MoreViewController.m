//
//  MoreViewController.m
//  EstateSales
//
//  Created by Jose Zhu on 16/6/1.
//  Copyright © 2016年 Jose Zhu. All rights reserved.
//

#import "MoreViewController.h"
#import "MyCustomersViewController.h"
#import "CalculatorViewController.h"
#import "ChangePwdViewController.h"
#import "MyInfoViewController.h"

@interface MoreViewController ()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong)UITableView * tableView;
//名字数组
@property(nonatomic,copy)NSArray * dataArr;
//图片数组
@property(nonatomic,copy)NSArray * imgArr;
@property (nonatomic, strong) UIButton *logoutBtn;
@end

@implementation MoreViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self preData];
    [self createTableView];
}

//准备数据
- (void)preData
{
    _dataArr = @[@"我推荐的客户",@"房贷计算器",@"版本检测",@"修改密码",@"我的信息"];
    
    _imgArr = @[@"found_quan",@"found_saoyisao",@"found_yao",@"found_nearby",@"found_shop"];
    
}

//创建tableView
- (void)createTableView
{
    _tableView = ({UITableView *tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height - 44) style:UITableViewStyleGrouped];
        tableView.delegate = self;
        tableView.dataSource = self;
        tableView.separatorInset = UIEdgeInsetsMake(0, 0, 0, 0);
        tableView;
    });
    [self.view addSubview:_tableView];
    
    _logoutBtn = [[UIButton alloc]initWithFrame:CGRectMake(20, self.view.frame.size.height - 192, self.view.bounds.size.width-40, 44)];
    [_logoutBtn setTitle:@"注销" forState:UIControlStateNormal];
    _logoutBtn.backgroundColor = [UIColor colorWithRed:88/255.0 green:159/255.0 blue:223/255.0 alpha:1];
    [_tableView addSubview:_logoutBtn];
}

#pragma mark --tableView--

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _dataArr.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identifier = @"foundCell";
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    
    if (cell == nil)
    {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
        //右侧小箭头
        cell.accessoryType=UITableViewCellAccessoryDisclosureIndicator;
    }
    return cell;
}

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    cell.textLabel.text = [_dataArr objectAtIndex:indexPath.row];
    cell.imageView.image = [UIImage imageNamed:[_imgArr objectAtIndex:indexPath.row]];
    
}

//设置row高度
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return WGiveHeight(50);
}

//设置头视图高度
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return WGiveHeight(15);
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 0){
        MyCustomersViewController *myCustomerVC = [[MyCustomersViewController alloc]init];
        myCustomerVC.hidesBottomBarWhenPushed = YES;
        UIBarButtonItem *barButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"" style:UIBarButtonItemStyleDone target:nil action:nil];
        self.navigationItem.backBarButtonItem = barButtonItem;
        [self.navigationController pushViewController:myCustomerVC animated:YES];
    }else if (indexPath.row == 1){
        CalculatorViewController *calculatorVC = [[CalculatorViewController alloc]init];
        calculatorVC.hidesBottomBarWhenPushed = YES;
        UIBarButtonItem *barButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"" style:UIBarButtonItemStyleDone target:nil action:nil];
        self.navigationItem.backBarButtonItem = barButtonItem;
        [self.navigationController pushViewController:calculatorVC animated:YES];
    }else if (indexPath.row == 2){
        
    }else if (indexPath.row == 3){
        ChangePwdViewController *changePwdVC = [[ChangePwdViewController alloc]init];
        changePwdVC.hidesBottomBarWhenPushed = YES;
        UIBarButtonItem *barButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"" style:UIBarButtonItemStyleDone target:nil action:nil];
        self.navigationItem.backBarButtonItem = barButtonItem;
        [self.navigationController pushViewController:changePwdVC animated:YES];
    }else if (indexPath.row == 4){
        MyInfoViewController *myInfoVC = [[MyInfoViewController alloc]init];
        myInfoVC.hidesBottomBarWhenPushed = YES;
        UIBarButtonItem *barButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"" style:UIBarButtonItemStyleDone target:nil action:nil];
        self.navigationItem.backBarButtonItem = barButtonItem;
        [self.navigationController pushViewController:myInfoVC animated:YES];
    }
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
