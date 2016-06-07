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
#import "MJRefresh.h"
#import "DetailViewController.h"
#import "IQKeyboardManager.h"

@interface ContactsViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, strong) UITextField *searchText;
@property (nonatomic, strong) UIButton *searchBtn;
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSArray *array;

@end

@implementation ContactsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self addRightBtnWithImgName:@"book_addfriend" andSelector:@selector(rightBtnClick:)];
    [self createUI];
    [self setupTableview];
    [self setupRefresh];
    
    _array = @[@[@"朱",@"先生",@"未到访",@"号码错",@"18506922901",@"2016-06-03",@"备注:",@"我就是一条单纯的备注",@"add_friend_icon_contacts"],
               @[@"丁",@"女士",@"有意向",@"啦啦啦",@"18650464053",@"2016-06-06",@"备注:",@"林庆福是逗逼林庆福是逗逼林庆福是逗逼林庆福是逗逼林庆福是逗逼林庆福是逗逼",@"add_friend_icon_contacts"],
               @[@"张",@"先生",@"未到访",@"号码错",@"18506922901",@"2016-06-06",@"备注:",@"我就是一条单纯的备注",@"add_friend_icon_contacts"],
               @[@"刘",@"女士",@"有意向",@"啦啦啦",@"18650464053",@"2016-06-06",@"备注:",@"林庆福是逗逼",@"add_friend_icon_contacts"],
               @[@"钟",@"先生",@"未到访",@"号码错",@"18506922901",@"2016-06-06",@"备注:",@"林庆福是逗逼庆福是逗逼林庆福是逗逼林庆福是逗逼林庆福是逗逼林庆福是逗逼林庆福是逗逼林庆福是逗逼林庆福是逗逼林庆福是逗逼林庆福是逗逼林庆福是逗逼林庆福是逗逼庆福是逗逼林庆福是逗逼林庆福是逗逼林庆福是逗逼林庆福是逗逼林庆福是逗逼林庆福是逗逼林庆福是逗逼林庆福是逗逼林庆福是逗逼林庆福是逗逼林庆福是逗逼林庆福是逗逼林庆福是逗逼林庆福是逗逼林庆福是逗逼",@"add_friend_icon_contacts"],
               @[@"李",@"女士",@"有意向",@"啦啦啦",@"18650464053",@"2016-06-06",@"备注:",@"我就是一条单纯的备注",@"add_friend_icon_contacts"],
               @[@"何",@"先生",@"未到访",@"号码错",@"18506922901",@"2016-06-06",@"备注:",@"林庆福是逗逼",@"add_friend_icon_contacts"],
               @[@"王",@"女士",@"有意向",@"啦啦啦",@"18650464053",@"2016-06-06",@"备注:",@"我就是一条单纯的备注",@"add_friend_icon_contacts"],
               @[@"黄",@"先生",@"未到访",@"号码错",@"18506922901",@"2016-06-06",@"备注:",@"林庆福是逗逼林庆福是逗逼林庆福是逗逼林庆福是逗逼林庆福是逗逼林庆福是逗逼林庆福是逗逼林庆福是逗逼林庆福是逗逼林庆福是逗逼林庆福是逗逼林庆福是逗逼",@"add_friend_icon_contacts"],
               @[@"游",@"女士",@"有意向",@"啦啦啦",@"18650464053",@"2016-06-06",@"备注:",@"我就是一条单纯的备注",@"add_friend_icon_contacts"],
               @[@"赵",@"先生",@"未到访",@"号码错",@"18506922901",@"2016-06-06",@"备注:",@"林庆福是逗逼",@"add_friend_icon_contacts"]];
    [IQKeyboardManager sharedManager].shouldResignOnTouchOutside = YES;
}

- (void)setupMoreContents
{
    __unsafe_unretained __typeof(self) weakSelf = self;
    
    // 设置回调（一旦进入刷新状态就会调用这个refreshingBlock）
    self.tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        [weakSelf loadNewData];
    }];
    
    // 马上进入刷新状态
    [self.tableView.mj_header beginRefreshing];

}

- (void)setupRefresh
{
    //下拉
    // 设置回调（一旦进入刷新状态，就调用target的action，也就是调用self的loadNewData方法）
    MJRefreshNormalHeader *header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(loadNewData)];
    
    // 设置自动切换透明度(在导航栏下面自动隐藏)
    header.automaticallyChangeAlpha = YES;
    
    // 隐藏时间
    header.lastUpdatedTimeLabel.hidden = YES;
    
    // 马上进入刷新状态
    [header beginRefreshing];
    
    //上拉
    // 设置header
    self.tableView.mj_header = header;
    
    [self setupMoreContents];
    
    // 设置回调（一旦进入刷新状态，就调用target的action，也就是调用self的loadMoreData方法）
    self.tableView.mj_footer = [MJRefreshBackNormalFooter footerWithRefreshingTarget:self refreshingAction:@selector(loadMoreData)];
    // 设置了底部inset
    self.tableView.contentInset = UIEdgeInsetsMake(0, 0, 30, 0);
    // 忽略掉底部inset
    self.tableView.mj_footer.ignoredScrollViewContentInsetBottom = 30;

}

- (void)createUI
{
    _searchText = [[UITextField alloc]initWithFrame:CGRectMake(10, 64+5, self.view.bounds.size.width - 20, 30)];
    _searchText.layer.cornerRadius = 10.0f;
    _searchText.layer.masksToBounds=YES;
    _searchText.layer.borderColor=[[UIColor grayColor]CGColor];
    _searchText.layer.borderWidth= 1.0f;
    _searchText.placeholder = @"  请输入搜索关键字(姓名、手机号)";
    _searchText.font = [UIFont systemFontOfSize:13];
    
    _searchBtn = [[UIButton alloc]initWithFrame:CGRectMake(self.view.bounds.size.width - 40, 64+5, 20, 30)];
    //_searchBtn.backgroundColor = [UIColor grayColor];
    [_searchBtn setImage:[UIImage imageNamed:@"add_friend_searchicon"] forState:UIControlStateNormal];
    [_searchBtn addTarget:self action:@selector(search) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:_searchText];
    [self.view addSubview:_searchBtn];
}

- (void)setupTableview
{
    _tableView = ({UITableView *tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 64+5+35, self.view.frame.size.width, self.view.frame.size.height - (64+5+15+51)) style:UITableViewStylePlain];
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
    return _array.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identifier = @"foundCell";
    ContactsTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (cell == nil)
    {
        cell = [[ContactsTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    [cell setContents:_array[indexPath.row]];
    return cell;
}

//去除cell选中高亮
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"%ld",(long)indexPath.row);
    DetailViewController *detailVC = [[DetailViewController alloc]init];
    detailVC.array = _array[indexPath.row];
    detailVC.hidesBottomBarWhenPushed = YES;
    
    UIBarButtonItem *barButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"" style:UIBarButtonItemStyleDone target:nil action:nil];
    self.navigationItem.backBarButtonItem = barButtonItem;
    [self.navigationController pushViewController:detailVC animated:YES];
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}
//cell高度
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 75;
}

#pragma mark -刷新数据
- (void)loadNewData
{
    // 1.添加假数据
//    for (int i = 0; i<5; i++) {
//        [self.data insertObject:MJRandomData atIndex:0];
//    }
    
    // 2.模拟2秒后刷新表格UI（真实开发中，可以移除这段gcd代码）
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        // 刷新表格
        [self.tableView reloadData];
        
        // 拿到当前的下拉刷新控件，结束刷新状态
        [self.tableView.mj_header endRefreshing];
    });
}


- (void)loadMoreData
{
    // 1.添加假数据
//    for (int i = 0; i<5; i++) {
//        [self.data addObject:MJRandomData];
//    }
    
    // 2.模拟2秒后刷新表格UI（真实开发中，可以移除这段gcd代码）
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        // 刷新表格
        [self.tableView reloadData];
        
        // 拿到当前的上拉刷新控件，结束刷新状态
        [self.tableView.mj_footer endRefreshing];
    });
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
