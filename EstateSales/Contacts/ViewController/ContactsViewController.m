//
//  ContactsViewController.m
//  EstateSales
//
//  Created by Jose Zhu on 16/6/1.
//  Copyright © 2016年 Jose Zhu. All rights reserved.
//

#import "ContactsViewController.h"
#import "SeniorSearchViewController.h"
#import "ContactsTableViewCell.h"

@interface ContactsViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, strong) UITextField *searchText;
@property (nonatomic, strong) UIButton *searchBtn;
@property (nonatomic, strong) UITableView *tableView;
@end

@implementation ContactsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self addRightBtnWithImgName:@"book_addfriend" andSelector:@selector(rightBtnClick:)];
    [self createUI];
    [self setupTableview];
}

- (void)createUI
{
    _searchText = [[UITextField alloc]initWithFrame:CGRectMake(10, 64+5, self.view.bounds.size.width - 20, 20)];
    _searchText.layer.cornerRadius = 10.0f;
    _searchText.layer.masksToBounds=YES;
    _searchText.layer.borderColor=[[UIColor grayColor]CGColor];
    _searchText.layer.borderWidth= 1.0f;
    _searchText.placeholder = @"  请输入搜索关键字(姓名、手机号)";
    _searchText.font = [UIFont systemFontOfSize:13];
    
    _searchBtn = [[UIButton alloc]initWithFrame:CGRectMake(self.view.bounds.size.width - 40, 64+5, 20, 20)];
    //_searchBtn.backgroundColor = [UIColor grayColor];
    [_searchBtn setImage:[UIImage imageNamed:@"add_friend_searchicon"] forState:UIControlStateNormal];
    [_searchBtn addTarget:self action:@selector(search) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:_searchText];
    [self.view addSubview:_searchBtn];
}

- (void)setupTableview
{
    _tableView = ({UITableView *tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 64+5+25, self.view.frame.size.width, self.view.frame.size.height - (64+5+25+51)) style:UITableViewStylePlain];
        tableView.delegate = self;
        tableView.dataSource = self;
        tableView.separatorInset = UIEdgeInsetsMake(0, 0, 0, 0);
        tableView;
    });
    [self.view addSubview:_tableView];
}

#pragma mark -tableViewDelegate
- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 100;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identifier = @"foundCell";
    ContactsTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (cell == nil)
    {
        cell = [[ContactsTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    [cell setContents];
    return cell;
}
//去除cell选中
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}
//cell高度
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 75;
}


#pragma  mark -私有方法
- (void)search
{
    NSLog(@"Search");
}
- (void)rightBtnClick:(UIButton *)sender
{
    SeniorSearchViewController *seniorSearchVC = [[SeniorSearchViewController alloc]init];
    seniorSearchVC.hidesBottomBarWhenPushed = YES;
    UIBarButtonItem *barButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"" style:UIBarButtonItemStyleDone target:nil action:nil];
    self.navigationItem.backBarButtonItem = barButtonItem;
    [self.navigationController pushViewController:seniorSearchVC animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
