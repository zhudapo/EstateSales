//
//  DetailViewController.m
//  EstateSales
//
//  Created by Jose Zhu on 16/6/6.
//  Copyright © 2016年 Jose Zhu. All rights reserved.
//

#import "DetailViewController.h"
#import "ContactsTableViewCell.h"

@interface DetailViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, strong) UIButton *imageBtn;
@property (nonatomic, strong) UILabel *firstName;
@property (nonatomic, strong) UILabel *phoneNumber;
@property (nonatomic, strong) UILabel *createTime;
@property (nonatomic, strong) UILabel *remark;
@property (nonatomic, strong) UILabel *remarkDetail;

@property (nonatomic, strong) UITableView *tableView;
@end

@implementation DetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"详情";
    [self createUI];
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
    
    UILabel *record = [[UILabel alloc]initWithFrame:CGRectMake(20, 120+txtFrame.size.height+10, 60, 30)];
    record.textColor = [UIColor grayColor];
    record.text = @"历史记录";
    record.font = [UIFont systemFontOfSize:13];
    //record.backgroundColor = [UIColor redColor];
    
    UIButton *changeUserInfoBtn = [[UIButton alloc]initWithFrame:CGRectMake(self.view.bounds.size.width - 40, 74, 30, 80)];
    changeUserInfoBtn.backgroundColor = [UIColor redColor];
    [changeUserInfoBtn addTarget:self action:@selector(showChangeUserInfoBtn) forControlEvents:UIControlEventTouchUpInside];
    
    UIView *lineView = [[UIView alloc]initWithFrame:CGRectMake(10, 120+txtFrame.size.height + 25+10, self.view.bounds.size.width - 20, 1)];
    lineView.backgroundColor = [UIColor grayColor];
    
    _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 120+txtFrame.size.height + 20 + 10+10, self.view.bounds.size.width, self.view.bounds.size.height - (42+120+txtFrame.size.height))];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    
    
    [self.view addSubview:_imageBtn];
    [self.view addSubview:_firstName];
    [self.view addSubview:_phoneNumber];
    [self.view addSubview:createLable];
    [self.view addSubview:_createTime];
    [self.view addSubview:remarkLabel];
    [self.view addSubview:_remarkDetail];
    [self.view addSubview:record];
    [self.view addSubview:lineView];
    [self.view addSubview:changeUserInfoBtn];
    [self.view addSubview:_tableView];
}
#pragma -mark tableViewDelegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 20;
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

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"%ld",(long)indexPath.row);

    UIBarButtonItem *barButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"" style:UIBarButtonItemStyleDone target:nil action:nil];
    self.navigationItem.backBarButtonItem = barButtonItem;
    
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
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
