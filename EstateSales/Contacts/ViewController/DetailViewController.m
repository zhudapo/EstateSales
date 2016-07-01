//
//  DetailViewController.m
//  EstateSales
//
//  Created by Jose Zhu on 16/6/6.
//  Copyright © 2016年 Jose Zhu. All rights reserved.
//

#import "DetailViewController.h"
#import "ContactsDetailTableViewCell.h"
#import "MJRefresh.h"

@interface DetailViewController ()<UITableViewDelegate,UITableViewDataSource,UITextFieldDelegate>
{
    int height;
}
@property (nonatomic, strong) UIView *changeUserInfoViewContainer;
@property (nonatomic, strong) UIView *chooseSexViewContainer;
@property (nonatomic, strong) UIView *alertChooseView;
@property (nonatomic, strong) UIButton *imageBtn;
@property (nonatomic, strong) UILabel *firstName;
@property (nonatomic, strong) UILabel *phoneNumber;
@property (nonatomic, strong) UILabel *createTime;
@property (nonatomic, strong) UILabel *remark;
@property (nonatomic, strong) UILabel *remarkDetail;
@property (nonatomic, strong) UIView *changeUserInfoView;
@property (nonatomic, strong) UITextView *nameText;
@property (nonatomic, strong) UIButton *sexBtn;
@property (nonatomic, strong) UITextView *remarkText;
@property (nonatomic, strong) UIButton *submitBtn;
@property (nonatomic, strong) UIButton *cancelBnt;
@property (nonatomic, strong) UILabel *record;
@property (nonatomic, strong) UIButton *changeUserInfoBtn;
@property (nonatomic, strong) UIView *lineView;
@property (nonatomic, strong) UIScrollView *changeUserInfoScrollView;

@property (nonatomic, strong) UIButton *callResultBtn;
@property (nonatomic, strong) UIButton *intentionBtn;
@property (nonatomic, strong) UIButton *comingTimeBtn;
@property (nonatomic, strong) UITextView *sizeText;
@property (nonatomic, strong) UITextView *budgetText;
@property (nonatomic, strong) UITextView *cancelReasonText;
@property (nonatomic, strong) UITextView *callRemarkText;
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSArray *detailArray;

@property (nonatomic, strong) UIButton *manBtn;
@property (nonatomic, strong) UIButton *womanBtn;
@property (nonatomic, strong) UIButton *sexSubmitBtn;
@property (nonatomic, strong) UIButton *sexCancelBtn;



@end

@implementation DetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"详情";
    [self createUI];
    [self setupRefresh];
    _detailArray = @[@[@"2016-06-08",@"0:00:20",@"号码错",@"admin",@"add_friend_icon_contacts"],
               @[@"2016-06-09",@"0:00:00",@"未接通",@"admin",@"add_friend_icon_contacts"],
               @[@"2016-06-10",@"0:00:00",@"号码错",@"admin",@"add_friend_icon_contacts"],
               @[@"2016-06-11",@"0:00:00",@"号码错",@"admin",@"add_friend_icon_contacts"],
               @[@"2016-06-12",@"0:00:00",@"号码错",@"admin",@"add_friend_icon_contacts"],
               @[@"2016-06-13",@"0:05:20",@"号码错",@"admin",@"add_friend_icon_contacts"],
               @[@"2016-06-14",@"0:07:20",@"号码错",@"admin",@"add_friend_icon_contacts"],
               @[@"2016-06-15",@"0:02:20",@"号码错",@"admin",@"add_friend_icon_contacts"],
               @[@"2016-06-16",@"0:00:00",@"号码错",@"admin",@"add_friend_icon_contacts"],
               @[@"2016-06-17",@"0:00:00",@"号码错",@"admin",@"add_friend_icon_contacts"],
               @[@"2016-06-18",@"0:00:00",@"号码错",@"admin",@"add_friend_icon_contacts"]];
}

- (void)createUI
{
    _imageBtn = [[UIButton alloc]initWithFrame:CGRectMake(0, 64, 80, 80)];
    //_imageBtn.backgroundColor = [UIColor redColor];
    [_imageBtn setBackgroundImage:[UIImage imageNamed:@"avatar_default_big"] forState:UIControlStateNormal];
    
    _firstName = [[UILabel alloc]initWithFrame:CGRectMake(100, 69, 20, 20)];
    _firstName.font = [UIFont systemFontOfSize:15];
    _firstName.text = _array[0];
    //_firstName.backgroundColor = [UIColor grayColor];
    
    _phoneNumber = [[UILabel alloc]initWithFrame:CGRectMake(120, 74, 90, 10)];
    _phoneNumber.font = [UIFont systemFontOfSize:13];
    _phoneNumber.textColor = [UIColor grayColor];
    _phoneNumber.text = _array[4];
    //_phoneNumber.backgroundColor = [UIColor orangeColor];
    
    UILabel *createLable = [[UILabel alloc]initWithFrame:CGRectMake(100, 94, 30, 20)];
    createLable.font = [UIFont systemFontOfSize:13];
    createLable.textColor = [UIColor grayColor];
    createLable.text = @"创建:";
    //createLable.backgroundColor = [UIColor brownColor];
    
    _createTime = [[UILabel alloc]initWithFrame:CGRectMake(135, 100, 90, 10)];
    _createTime.font = [UIFont systemFontOfSize:13];
    _createTime.textColor = [UIColor grayColor];
    _createTime.text = _array[5];
    //_createTime.backgroundColor = [UIColor blueColor];
    
    UILabel *remarkLabel = [[UILabel alloc]initWithFrame:CGRectMake(100, 119, 30, 20)];
    remarkLabel.font = [UIFont systemFontOfSize:13];
    remarkLabel.textColor = [UIColor grayColor];
    remarkLabel.text = _array[6];
    //remarkLabel.backgroundColor = [UIColor cyanColor];
    
    
    _remarkDetail = [[UILabel alloc]initWithFrame:CGRectMake(130, 120, self.view.bounds.size.width - 120 - 50, 50)];
    [_remarkDetail setNumberOfLines:0];
    _remarkDetail.text = _array[7];
    _remarkDetail.font = [UIFont systemFontOfSize:13];
    _remarkDetail.textColor = [UIColor grayColor];
    //自动折行设置
    _remarkDetail.lineBreakMode = UILineBreakModeWordWrap;
    _remarkDetail.numberOfLines = 0;
    
    //自适应高度
    CGRect txtFrame = _remarkDetail.frame;
    
    _remarkDetail.frame = CGRectMake(130, 122, self.view.bounds.size.width - 120 - 30,
                             txtFrame.size.height =[_remarkDetail.text boundingRectWithSize:
                                                    CGSizeMake(txtFrame.size.width, CGFLOAT_MAX)
                                                                            options:NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading
                                                                         attributes:[NSDictionary dictionaryWithObjectsAndKeys:_remarkDetail.font,NSFontAttributeName, nil] context:nil].size.height);
    _remarkDetail.frame = CGRectMake(130, 122, self.view.bounds.size.width - 120 - 50, txtFrame.size.height);
    
    _record = [[UILabel alloc]initWithFrame:CGRectMake(20, 120+txtFrame.size.height+10, 60, 30)];
    _record.textColor = [UIColor grayColor];
    _record.text = @"历史记录";
    _record.font = [UIFont systemFontOfSize:13];
    //record.backgroundColor = [UIColor redColor];
    
    _changeUserInfoBtn = [[UIButton alloc]initWithFrame:CGRectMake(self.view.bounds.size.width - 40, 74, 30, 80)];
    _changeUserInfoBtn.backgroundColor = [UIColor redColor];
    [_changeUserInfoBtn addTarget:self action:@selector(showChangeUserInfoBtn) forControlEvents:UIControlEventTouchUpInside];
    
    _lineView = [[UIView alloc]initWithFrame:CGRectMake(10, 120+txtFrame.size.height + 25+10, self.view.bounds.size.width - 20, 1)];
    _lineView.backgroundColor = [UIColor grayColor];
    
    _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 120+txtFrame.size.height + 20 + 10+10, self.view.bounds.size.width, self.view.bounds.size.height - (12+120+txtFrame.size.height))];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    
    
    [self.view addSubview:_imageBtn];
    [self.view addSubview:_firstName];
    [self.view addSubview:_phoneNumber];
    [self.view addSubview:createLable];
    [self.view addSubview:_createTime];
    [self.view addSubview:remarkLabel];
    [self.view addSubview:_remarkDetail];
    [self.view addSubview:_record];
    [self.view addSubview:_lineView];
    [self.view addSubview:_changeUserInfoBtn];
    [self.view addSubview:_tableView];
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

#pragma -mark tableViewDelegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _detailArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identifier = @"foundCell";
    ContactsDetailTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (cell == nil)
    {
        cell = [[ContactsDetailTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    [cell setContents:_detailArray[indexPath.row]];
    return cell;

}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"%ld",(long)indexPath.row);

    UIBarButtonItem *barButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"" style:UIBarButtonItemStyleDone target:nil action:nil];
    self.navigationItem.backBarButtonItem = barButtonItem;
    
    [self showCallResultInfo:[_detailArray objectAtIndex:indexPath.row]];
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}
//cell高度
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 75;
}


#pragma -mark 私有方法
- (void)showChangeUserInfoBtn
{
    
    
    _changeUserInfoView = [[UIView alloc]initWithFrame:self.view.bounds];
    _changeUserInfoView.alpha = 0.4;
    _changeUserInfoView.backgroundColor = [UIColor blackColor];
    [[UIApplication sharedApplication].keyWindow addSubview:_changeUserInfoView];
    
    _changeUserInfoScrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 64, self.view.bounds.size.width, self.view.bounds.size.height *4/5-64)];
    //_changeUserInfoScrollView.backgroundColor = [UIColor orangeColor];
    [[UIApplication sharedApplication].keyWindow addSubview:_changeUserInfoScrollView];
    
    _changeUserInfoViewContainer = [[UIView alloc]initWithFrame:CGRectMake(15, self.view.bounds.size.height *2/5-84, self.view.bounds.size.width - 30, self.view.bounds.size.height *2/5)];
    _changeUserInfoViewContainer.backgroundColor = [UIColor whiteColor];
    _changeUserInfoViewContainer.layer.cornerRadius = 7.0f;
    CGFloat changeUserInfoViewContainerHeight = _changeUserInfoViewContainer.bounds.size.height;
    CGFloat changeUserInfoViewContainerwidth = _changeUserInfoViewContainer.bounds.size.width;
    
    [_changeUserInfoScrollView addSubview:_changeUserInfoViewContainer];
    
    UILabel *titleLable = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, changeUserInfoViewContainerwidth, changeUserInfoViewContainerHeight*1/6)];
    titleLable.font = [UIFont systemFontOfSize:15];
    titleLable.text = @"修改客户资料";
    titleLable.layer.cornerRadius = 7.0f;
    titleLable.layer.masksToBounds = YES;
    titleLable.textAlignment = NSTextAlignmentCenter;
    titleLable.backgroundColor = [UIColor colorWithRed:238.0/255 green:238.0/255 blue:238.0/255 alpha:1.0];
    
    UILabel *nameLable = [[UILabel alloc]initWithFrame:CGRectMake(5, changeUserInfoViewContainerHeight*1/6, 40, changeUserInfoViewContainerHeight*1/6)];
    nameLable.font = [UIFont systemFontOfSize:13];
    nameLable.text = @"姓名:";
    //nameLable.backgroundColor = [UIColor redColor];
    _nameText = [[UITextView alloc]initWithFrame:CGRectMake(45, changeUserInfoViewContainerHeight*1/6, changeUserInfoViewContainerwidth-50, changeUserInfoViewContainerHeight*1/6)];
    _nameText.layer.cornerRadius=3.0f;
    _nameText.layer.masksToBounds=YES;
    _nameText.layer.borderColor=[[UIColor blackColor]CGColor];
    _nameText.layer.borderWidth= 1.0f;
    _nameText.text = _firstName.text;

    UILabel *sexLable = [[UILabel alloc]initWithFrame:CGRectMake(5, changeUserInfoViewContainerHeight*2/6, 40, changeUserInfoViewContainerHeight*1/6)];
    sexLable.font = [UIFont systemFontOfSize:13];
    sexLable.text = @"性别:";
    //sexLable.backgroundColor = [UIColor orangeColor];
    _sexBtn = [[UIButton alloc]initWithFrame:CGRectMake(45, changeUserInfoViewContainerHeight*2/6, changeUserInfoViewContainerwidth-50, changeUserInfoViewContainerHeight*1/6)];
    [_sexBtn setTitle:_array[1] forState:UIControlStateNormal];
    _sexBtn.titleLabel.font = [UIFont systemFontOfSize:13];
    _sexBtn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    [_sexBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [_sexBtn addTarget:self action:@selector(chooseSex) forControlEvents:UIControlEventTouchUpInside];
    //_sexBtn.backgroundColor = [UIColor redColor];
    
    
    UILabel *remarkLable = [[UILabel alloc]initWithFrame:CGRectMake(5, changeUserInfoViewContainerHeight*1/2, 40, changeUserInfoViewContainerHeight*1/3)];
    remarkLable.font = [UIFont systemFontOfSize:13];
    remarkLable.text = @"备注:";
    _remarkText = [[UITextView alloc]initWithFrame:CGRectMake(45, changeUserInfoViewContainerHeight*1/2, changeUserInfoViewContainerwidth-50, changeUserInfoViewContainerHeight*1/3)];
    _remarkText.layer.cornerRadius=3.0f;
    _remarkText.text = _remarkDetail.text;
    
    _remarkText.layer.masksToBounds=YES;
    _remarkText.layer.borderColor=[[UIColor blackColor]CGColor];
    _remarkText.layer.borderWidth= 1.0f;
    
    _submitBtn = [[UIButton alloc]initWithFrame:CGRectMake(0, changeUserInfoViewContainerHeight*5/6, changeUserInfoViewContainerwidth*0.5, changeUserInfoViewContainerHeight*1/6)];
    [_submitBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [_submitBtn setTitle:@"确认" forState:UIControlStateNormal];
    _submitBtn.layer.cornerRadius = 7.0f;
    _submitBtn.backgroundColor = [UIColor colorWithRed:238.0/255 green:238.0/255 blue:238.0/255 alpha:1.0];
    [_submitBtn addTarget:self action:@selector(submit) forControlEvents:UIControlEventTouchUpInside];
    
    _cancelBnt = [[UIButton alloc]initWithFrame:CGRectMake(changeUserInfoViewContainerwidth*0.5, changeUserInfoViewContainerHeight*5/6, changeUserInfoViewContainerwidth*0.5, changeUserInfoViewContainerHeight*1/6)];
    [_cancelBnt setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    _cancelBnt.layer.cornerRadius = 7.0f;
    [_cancelBnt setTitle:@"取消" forState:UIControlStateNormal];
    _cancelBnt.backgroundColor = [UIColor colorWithRed:238.0/255 green:238.0/255 blue:238.0/255 alpha:1.0];
    [_cancelBnt addTarget:self action:@selector(cancel) forControlEvents:UIControlEventTouchUpInside];
    
    
    [_changeUserInfoViewContainer addSubview:titleLable];
    [_changeUserInfoViewContainer addSubview:nameLable];
    [_changeUserInfoViewContainer addSubview:_nameText];
    [_changeUserInfoViewContainer addSubview:sexLable];
    [_changeUserInfoViewContainer addSubview:_sexBtn];
    [_changeUserInfoViewContainer addSubview:remarkLable];
    [_changeUserInfoViewContainer addSubview:_remarkText];
    [_changeUserInfoViewContainer addSubview:_submitBtn];
    [_changeUserInfoViewContainer addSubview:_cancelBnt];
}

- (void)showCallResultInfo:(NSArray *)rowArray
{
    
    _changeUserInfoView = [[UIView alloc]initWithFrame:self.view.bounds];
    _changeUserInfoView.alpha = 0.3;
    _changeUserInfoView.backgroundColor = [UIColor blackColor];
    [[UIApplication sharedApplication].keyWindow addSubview:_changeUserInfoView];
    
    _changeUserInfoScrollView = [[UIScrollView alloc]initWithFrame:self.view.bounds];
    //_changeUserInfoScrollView.backgroundColor = [UIColor orangeColor];
    [[UIApplication sharedApplication].keyWindow addSubview:_changeUserInfoScrollView];
    
    _changeUserInfoViewContainer = [[UIView alloc]initWithFrame:CGRectMake(15, 64, self.view.bounds.size.width - 30, self.view.bounds.size.height -88)];
    _changeUserInfoViewContainer.backgroundColor = [UIColor whiteColor];
    _changeUserInfoViewContainer.layer.cornerRadius = 7.0f;
    [_changeUserInfoScrollView addSubview:_changeUserInfoViewContainer];
    
    CGFloat changeUserInfoViewContainerHeight = _changeUserInfoViewContainer.bounds.size.height;
    CGFloat changeUserInfoViewContainerWidth = _changeUserInfoViewContainer.bounds.size.width;
    
    UILabel *titleLable = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, changeUserInfoViewContainerWidth, (changeUserInfoViewContainerHeight-88)*1/8)];
    titleLable.font = [UIFont systemFontOfSize:18];
    titleLable.text = @"通话结果";
    titleLable.layer.cornerRadius = 7.0f;
    titleLable.layer.masksToBounds = YES;
    titleLable.textAlignment = NSTextAlignmentCenter;
    titleLable.backgroundColor = [UIColor colorWithRed:238.0/255 green:238.0/255 blue:238.0/255 alpha:1.0];
    
    

    UILabel *callResultLable = [[UILabel alloc]initWithFrame:CGRectMake(5, (changeUserInfoViewContainerHeight-88)*3/24, 75, (changeUserInfoViewContainerHeight-88)*1/12)];
    callResultLable.font = [UIFont systemFontOfSize:13];
    callResultLable.text = @"*通话结果：";
    //callResultLable.backgroundColor = [UIColor redColor];
    _callResultBtn = [[UIButton alloc]initWithFrame:CGRectMake(80, (changeUserInfoViewContainerHeight-88)*3/24, changeUserInfoViewContainerWidth-80, (changeUserInfoViewContainerHeight-88)*1/12)];
    [_callResultBtn setTitle:@"号码错误" forState:UIControlStateNormal];
    _callResultBtn.titleLabel.font = [UIFont systemFontOfSize:13];
    _callResultBtn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    [_callResultBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    //_callResultBtn.backgroundColor = [UIColor redColor];
    UIView *firstLine = [[UIView alloc]initWithFrame:CGRectMake(0, (changeUserInfoViewContainerHeight-88)*5/24 +1, changeUserInfoViewContainerWidth, 2)];
    firstLine.backgroundColor = [UIColor colorWithRed:238.0/255 green:238.0/255 blue:238.0/255 alpha:1.0];
    
    UILabel *intentionLable = [[UILabel alloc]initWithFrame:CGRectMake(5, (changeUserInfoViewContainerHeight-88)*5/24 +3, 75, (changeUserInfoViewContainerHeight-88)*1/12)];
    intentionLable.font = [UIFont systemFontOfSize:13];
    intentionLable.text = @"意向产品：";
    //intentionLable.backgroundColor = [UIColor orangeColor];
    _intentionBtn = [[UIButton alloc]initWithFrame:CGRectMake(80, (changeUserInfoViewContainerHeight-88)*5/24 +3, changeUserInfoViewContainerWidth-80, (changeUserInfoViewContainerHeight-88)*1/12)];
    [_intentionBtn setTitle:@"写字楼" forState:UIControlStateNormal];
    _intentionBtn.titleLabel.font = [UIFont systemFontOfSize:13];
    _intentionBtn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    //_intentionBtn.backgroundColor = [UIColor orangeColor];
    [_intentionBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    UIView *secondLine = [[UIView alloc]initWithFrame:CGRectMake(0, (changeUserInfoViewContainerHeight-88)*7/24 +1, changeUserInfoViewContainerWidth, 2)];
    secondLine.backgroundColor = [UIColor colorWithRed:238.0/255 green:238.0/255 blue:238.0/255 alpha:1.0];
    
    
    UILabel *comingTimeLable = [[UILabel alloc]initWithFrame:CGRectMake(5, (changeUserInfoViewContainerHeight-88)*7/24+3, 95, (changeUserInfoViewContainerHeight-88)*1/12)];
    comingTimeLable.font = [UIFont systemFontOfSize:13];
    comingTimeLable.text = @"预约到访时间：";
    //comingTimeLable.backgroundColor = [UIColor orangeColor];
    _comingTimeBtn = [[UIButton alloc]initWithFrame:CGRectMake(100, (changeUserInfoViewContainerHeight-88)*7/24+3, changeUserInfoViewContainerWidth-100, (changeUserInfoViewContainerHeight-88)*1/12)];
    [_comingTimeBtn setTitle:@"写字楼" forState:UIControlStateNormal];
    _comingTimeBtn.titleLabel.font = [UIFont systemFontOfSize:13];
    _comingTimeBtn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    //_comingTimeBtn.backgroundColor = [UIColor orangeColor];
    [_comingTimeBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    UIView *thirdLine = [[UIView alloc]initWithFrame:CGRectMake(0, (changeUserInfoViewContainerHeight-88)*9/24 +3, changeUserInfoViewContainerWidth, 2)];
    thirdLine.backgroundColor = [UIColor colorWithRed:238.0/255 green:238.0/255 blue:238.0/255 alpha:1.0];
    
    
    UILabel *sizeLable = [[UILabel alloc]initWithFrame:CGRectMake(5, (changeUserInfoViewContainerHeight-88)*10/24, 75, (changeUserInfoViewContainerHeight-88)*1/12)];
    sizeLable.font = [UIFont systemFontOfSize:13];
    sizeLable.text = @"意向面积：";
    //sizeLable.backgroundColor = [UIColor orangeColor];
    _sizeText = [[UITextView alloc]initWithFrame:CGRectMake(80, (changeUserInfoViewContainerHeight-88)*10/24, changeUserInfoViewContainerWidth-95, (changeUserInfoViewContainerHeight-88)*1/12)];
    _sizeText.layer.cornerRadius=3.0f;
    _sizeText.layer.masksToBounds=YES;
    _sizeText.layer.borderColor=[[UIColor blackColor]CGColor];
    _sizeText.layer.borderWidth= 1.0f;
    UIView *forthLine = [[UIView alloc]initWithFrame:CGRectMake(0, (changeUserInfoViewContainerHeight-88)*12/24 +15, changeUserInfoViewContainerWidth, 2)];
    forthLine.backgroundColor = [UIColor colorWithRed:238.0/255 green:238.0/255 blue:238.0/255 alpha:1.0];
    
    
    UILabel *budgeLabel = [[UILabel alloc]initWithFrame:CGRectMake(5, (changeUserInfoViewContainerHeight-88)*13/24 +15, 75, (changeUserInfoViewContainerHeight-88)*1/12)];
    budgeLabel.font = [UIFont systemFontOfSize:13];
    budgeLabel.text = @"意向预算：";
    //budgeLabel.backgroundColor = [UIColor orangeColor];
    _budgetText = [[UITextView alloc]initWithFrame:CGRectMake(80, (changeUserInfoViewContainerHeight-88)*13/24+15, changeUserInfoViewContainerWidth-95, (changeUserInfoViewContainerHeight-88)*1/12)];
    _budgetText.layer.cornerRadius=3.0f;
    _budgetText.layer.masksToBounds=YES;
    _budgetText.layer.borderColor=[[UIColor blackColor]CGColor];
    _budgetText.layer.borderWidth= 1.0f;
    UIView *fifthLine = [[UIView alloc]initWithFrame:CGRectMake(0, (changeUserInfoViewContainerHeight-88)*15/24+30, changeUserInfoViewContainerWidth, 2)];
    fifthLine.backgroundColor = [UIColor colorWithRed:238.0/255 green:238.0/255 blue:238.0/255 alpha:1.0];
    
    UILabel *cancelReasonLable = [[UILabel alloc]initWithFrame:CGRectMake(5, (changeUserInfoViewContainerHeight-88)*16/24+30, 75, (changeUserInfoViewContainerHeight-88)*1/12)];
    cancelReasonLable.font = [UIFont systemFontOfSize:13];
    cancelReasonLable.text = @"放弃原因：";
    //cancelReasonLable.backgroundColor = [UIColor orangeColor];
    _cancelReasonText = [[UITextView alloc]initWithFrame:CGRectMake(80, (changeUserInfoViewContainerHeight-88)*16/24+30, changeUserInfoViewContainerWidth-95, (changeUserInfoViewContainerHeight-88)*1/12)];
    _cancelReasonText.layer.cornerRadius=3.0f;
    _cancelReasonText.layer.masksToBounds=YES;
    _cancelReasonText.layer.borderColor=[[UIColor blackColor]CGColor];
    _cancelReasonText.layer.borderWidth= 1.0f;
    UIView *sixthLine = [[UIView alloc]initWithFrame:CGRectMake(0, (changeUserInfoViewContainerHeight-88)*18/24+45, changeUserInfoViewContainerWidth, 2)];
    sixthLine.backgroundColor = [UIColor colorWithRed:238.0/255 green:238.0/255 blue:238.0/255 alpha:1.0];
    
    UILabel *callRemarkLable = [[UILabel alloc]initWithFrame:CGRectMake(5, (changeUserInfoViewContainerHeight-88)*19/24+45, 75, (changeUserInfoViewContainerHeight-88)*1/12)];
    callRemarkLable.font = [UIFont systemFontOfSize:13];
    callRemarkLable.text = @"通话备注：";
    //callRemarkLable.backgroundColor = [UIColor orangeColor];
    _callRemarkText = [[UITextView alloc]initWithFrame:CGRectMake(80, (changeUserInfoViewContainerHeight-88)*19/24+45, changeUserInfoViewContainerWidth-95, (changeUserInfoViewContainerHeight-88)*1/12)];
    _callRemarkText.layer.cornerRadius=3.0f;
    _callRemarkText.layer.masksToBounds=YES;
    _callRemarkText.layer.borderColor=[[UIColor blackColor]CGColor];
    _callRemarkText.layer.borderWidth= 1.0f;

    
    _submitBtn = [[UIButton alloc]initWithFrame:CGRectMake(0, changeUserInfoViewContainerHeight*7/8+20, changeUserInfoViewContainerWidth*0.5, changeUserInfoViewContainerHeight*1/8-20)];
    [_submitBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [_submitBtn setTitle:@"确认" forState:UIControlStateNormal];
    _submitBtn.layer.cornerRadius = 7.0f;
    [_submitBtn addTarget:self action:@selector(submit) forControlEvents:UIControlEventTouchUpInside];
    _submitBtn.backgroundColor = [UIColor colorWithRed:238.0/255 green:238.0/255 blue:238.0/255 alpha:1.0];
    
    _cancelBnt = [[UIButton alloc]initWithFrame:CGRectMake(changeUserInfoViewContainerWidth*0.5, changeUserInfoViewContainerHeight*7/8+20, changeUserInfoViewContainerWidth*0.5, changeUserInfoViewContainerHeight*1/8-20)];
    [_cancelBnt setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    _cancelBnt.layer.cornerRadius = 7.0f;
    [_cancelBnt setTitle:@"取消" forState:UIControlStateNormal];
    [_cancelBnt addTarget:self action:@selector(cancel) forControlEvents:UIControlEventTouchUpInside];
    _cancelBnt.backgroundColor = [UIColor colorWithRed:238.0/255 green:238.0/255 blue:238.0/255 alpha:1.0];
    
    
    [_changeUserInfoViewContainer addSubview:titleLable];
    [_changeUserInfoViewContainer addSubview:callResultLable];
    [_changeUserInfoViewContainer addSubview:_callResultBtn];
    [_changeUserInfoViewContainer addSubview:firstLine];
    [_changeUserInfoViewContainer addSubview:intentionLable];
    [_changeUserInfoViewContainer addSubview:_intentionBtn];
    [_changeUserInfoViewContainer addSubview:secondLine];
    [_changeUserInfoViewContainer addSubview:comingTimeLable];
    [_changeUserInfoViewContainer addSubview:_comingTimeBtn];
    [_changeUserInfoViewContainer addSubview:thirdLine];
    [_changeUserInfoViewContainer addSubview:sizeLable];
    [_changeUserInfoViewContainer addSubview:_sizeText];
    [_changeUserInfoViewContainer addSubview:forthLine];
    [_changeUserInfoViewContainer addSubview:budgeLabel];
    [_changeUserInfoViewContainer addSubview:_budgetText];
    [_changeUserInfoViewContainer addSubview:fifthLine];
    [_changeUserInfoViewContainer addSubview:cancelReasonLable];
    [_changeUserInfoViewContainer addSubview:_cancelReasonText];
    [_changeUserInfoViewContainer addSubview:sixthLine];
    [_changeUserInfoViewContainer addSubview:callRemarkLable];
    [_changeUserInfoViewContainer addSubview:_callRemarkText];
    
    [_changeUserInfoViewContainer addSubview:_submitBtn];
    [_changeUserInfoViewContainer addSubview:_cancelBnt];
}

- (void)submit
{
    _firstName.text = _nameText.text;
    _remarkDetail.text = _remarkText.text;
    [_changeUserInfoScrollView removeFromSuperview];
    
    [_changeUserInfoView removeFromSuperview];
    [self changeHeightwithRemarkDetail];
}

- (void)cancel
{
    [_changeUserInfoScrollView removeFromSuperview];
    [_changeUserInfoView removeFromSuperview];
}

- (void)chooseSex
{
    _chooseSexViewContainer = [[UIView alloc]initWithFrame:self.view.bounds];
    _chooseSexViewContainer.alpha = 0.6;
    _chooseSexViewContainer.backgroundColor = [UIColor blackColor];
    [[UIApplication sharedApplication].keyWindow addSubview:_chooseSexViewContainer];
    
    _alertChooseView = [[UIView alloc]initWithFrame:self.view.bounds];
    _alertChooseView = [[UIView alloc]initWithFrame:CGRectMake(15, self.view.bounds.size.height*0.5, self.view.bounds.size.width - 30, self.view.bounds.size.height*1/5)];
    _alertChooseView.backgroundColor = [UIColor whiteColor];
    _alertChooseView.layer.cornerRadius = 7.0f;
    [[UIApplication sharedApplication].keyWindow addSubview:_alertChooseView];
    
    CGFloat alertChooseViewHeight = _alertChooseView.bounds.size.height;
    CGFloat alertChooseViewWidth = _alertChooseView.bounds.size.width;
    
    UILabel *titleLable = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, alertChooseViewWidth, alertChooseViewHeight*1/4)];
    titleLable.font = [UIFont systemFontOfSize:15];
    titleLable.text = @"性别";
    titleLable.layer.cornerRadius = 7.0f;
    titleLable.layer.masksToBounds = YES;
    titleLable.textAlignment = NSTextAlignmentCenter;
    titleLable.backgroundColor = [UIColor colorWithRed:238.0/255 green:238.0/255 blue:238.0/255 alpha:1.0];

    _manBtn = [[UIButton alloc]initWithFrame:CGRectMake(0, alertChooseViewHeight*1/4, alertChooseViewWidth, alertChooseViewHeight*1/4)];
    _manBtn.titleLabel.font = [UIFont systemFontOfSize:13];
    [_manBtn setTitle:@"    先生" forState:UIControlStateNormal];
    [_manBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    _manBtn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    [_manBtn addTarget:self action:@selector(chooseSomeBody:) forControlEvents:UIControlEventTouchUpInside];
    //_manBtn.backgroundColor = [UIColor colorWithRed:238.0/255 green:238.0/255 blue:238.0/255 alpha:1.0];
    
    UIView *line = [[UIView alloc]initWithFrame:CGRectMake(0, alertChooseViewHeight*2/4 +1, alertChooseViewWidth, 2)];
    line.backgroundColor = [UIColor colorWithRed:238.0/255 green:238.0/255 blue:238.0/255 alpha:1.0];

    
    _womanBtn = [[UIButton alloc]initWithFrame:CGRectMake(0, alertChooseViewHeight*2/4+2, alertChooseViewWidth, alertChooseViewHeight*1/4)];
    _womanBtn.titleLabel.font = [UIFont systemFontOfSize:13];
    [_womanBtn setTitle:@"    女士" forState:UIControlStateNormal];
    [_womanBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    _womanBtn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    [_womanBtn addTarget:self action:@selector(chooseSomeBody:) forControlEvents:UIControlEventTouchUpInside];
    //_womanBtn.backgroundColor = [UIColor colorWithRed:238.0/255 green:238.0/255 blue:238.0/255 alpha:1.0];
    
    _sexSubmitBtn = [[UIButton alloc]initWithFrame:CGRectMake(0, alertChooseViewHeight*3/4, alertChooseViewWidth*0.5, alertChooseViewHeight*1/4)];
    _sexSubmitBtn.titleLabel.font = [UIFont systemFontOfSize:13];
    [_sexSubmitBtn setTitle:@"确认" forState:UIControlStateNormal];
    [_sexSubmitBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [_sexSubmitBtn addTarget:self action:@selector(chooseSexSubmit) forControlEvents:UIControlEventTouchUpInside];
    _sexSubmitBtn.layer.cornerRadius = 7.0f;
    _sexSubmitBtn.backgroundColor = [UIColor colorWithRed:238.0/255 green:238.0/255 blue:238.0/255 alpha:1.0];
    
    
    _sexCancelBtn = [[UIButton alloc]initWithFrame:CGRectMake(alertChooseViewWidth*0.5, alertChooseViewHeight*3/4, alertChooseViewWidth*0.5, alertChooseViewHeight*1/4)];
    _sexCancelBtn.titleLabel.font = [UIFont systemFontOfSize:13];
    [_sexCancelBtn setTitle:@"取消" forState:UIControlStateNormal];
    [_sexCancelBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [_sexCancelBtn addTarget:self action:@selector(chooseSexCancel) forControlEvents:UIControlEventTouchUpInside];
    _sexCancelBtn.layer.cornerRadius = 7.0f;
    _sexCancelBtn.backgroundColor = [UIColor colorWithRed:238.0/255 green:238.0/255 blue:238.0/255 alpha:1.0];
    
    
    
    [_alertChooseView addSubview: titleLable];
    [_alertChooseView addSubview: _manBtn];
    [_alertChooseView addSubview: line];
    [_alertChooseView addSubview: _womanBtn];
    [_alertChooseView addSubview: _sexSubmitBtn];
    [_alertChooseView addSubview: _sexCancelBtn];
}

- (void)chooseSexSubmit
{
    [_chooseSexViewContainer removeFromSuperview];
    [_alertChooseView removeFromSuperview];
}

- (void)chooseSexCancel
{
    [_chooseSexViewContainer removeFromSuperview];
    [_alertChooseView removeFromSuperview];
}

- (void)chooseSomeBody:(UIButton *)btn
{
    
    _sexBtn.titleLabel.text = [btn.titleLabel.text stringByReplacingOccurrencesOfString:@" " withString:@""];
    
    NSLog(@"%@",btn.titleLabel.text);
    [self chooseSexSubmit];
}

- (void)changeHeightwithRemarkDetail
{
    //自适应高度
    CGRect txtFrame = _remarkDetail.frame;
    
    _remarkDetail.frame = CGRectMake(130, 122, self.view.bounds.size.width - 120 - 30,
                                     txtFrame.size.height =[_remarkDetail.text boundingRectWithSize:
                                                            CGSizeMake(txtFrame.size.width, CGFLOAT_MAX)
                                                                                            options:NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading
                                                                                         attributes:[NSDictionary dictionaryWithObjectsAndKeys:_remarkDetail.font,NSFontAttributeName, nil] context:nil].size.height);
    _remarkDetail.frame = CGRectMake(130, 122, self.view.bounds.size.width - 120 - 50, txtFrame.size.height);
    
    _record.frame = CGRectMake(20, 120+txtFrame.size.height+10, 60, 30);
    
    _changeUserInfoBtn.frame = CGRectMake(self.view.bounds.size.width - 40, 74, 30, 80);
    
    _lineView.frame = CGRectMake(10, 120+txtFrame.size.height + 25+10, self.view.bounds.size.width - 20, 1);
    
    _tableView.frame = CGRectMake(0, 120+txtFrame.size.height + 20 + 10+10, self.view.bounds.size.width, self.view.bounds.size.height - (42+120+txtFrame.size.height));

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


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
