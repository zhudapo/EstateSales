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
@property (nonatomic, strong) UIView *changeUserInfoViewContainer;
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
    [self.view addSubview:_record];
    [self.view addSubview:_lineView];
    [self.view addSubview:_changeUserInfoBtn];
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
    _changeUserInfoView = [[UIView alloc]initWithFrame:self.view.bounds];
    _changeUserInfoView.alpha = 0.6;
    _changeUserInfoView.backgroundColor = [UIColor blackColor];
    
    [[UIApplication sharedApplication].keyWindow addSubview:_changeUserInfoView];
    
    _changeUserInfoViewContainer = [[UIView alloc]initWithFrame:CGRectMake(15, self.view.bounds.size.height *1/3, self.view.bounds.size.width - 30, self.view.bounds.size.height *1/3)];
    _changeUserInfoViewContainer.backgroundColor = [UIColor grayColor];
    _changeUserInfoViewContainer.layer.cornerRadius = 7.0f;
    [[UIApplication sharedApplication].keyWindow addSubview:_changeUserInfoViewContainer];
    
    
    UILabel *titleLable = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, _changeUserInfoViewContainer.bounds.size.width, _changeUserInfoViewContainer.bounds.size.height*1/6)];
    titleLable.font = [UIFont systemFontOfSize:15];
    titleLable.text = @"修改客户资料";
    titleLable.layer.cornerRadius = 7.0f;
    titleLable.textAlignment = NSTextAlignmentCenter;
    //titleLable.backgroundColor = [UIColor orangeColor];
    
    UILabel *nameLable = [[UILabel alloc]initWithFrame:CGRectMake(5, _changeUserInfoViewContainer.bounds.size.height*1/6, 40, _changeUserInfoViewContainer.bounds.size.height*1/6)];
    nameLable.font = [UIFont systemFontOfSize:13];
    nameLable.text = @"姓名:";
    //nameLable.backgroundColor = [UIColor redColor];
    _nameText = [[UITextView alloc]initWithFrame:CGRectMake(45, _changeUserInfoViewContainer.bounds.size.height*1/6, _changeUserInfoViewContainer.bounds.size.width-50, _changeUserInfoViewContainer.bounds.size.height*1/6)];
    _nameText.layer.cornerRadius=3.0f;
    _nameText.layer.masksToBounds=YES;
    _nameText.layer.borderColor=[[UIColor blackColor]CGColor];
    _nameText.layer.borderWidth= 1.0f;
    _nameText.text = _firstName.text;

    UILabel *sexLable = [[UILabel alloc]initWithFrame:CGRectMake(5, _changeUserInfoViewContainer.bounds.size.height*2/6, 40, _changeUserInfoViewContainer.bounds.size.height*1/6)];
    sexLable.font = [UIFont systemFontOfSize:13];
    sexLable.text = @"性别:";
    //sexLable.backgroundColor = [UIColor orangeColor];
    _sexBtn = [[UIButton alloc]initWithFrame:CGRectMake(45, _changeUserInfoViewContainer.bounds.size.height*2/6, _changeUserInfoViewContainer.bounds.size.width-50, _changeUserInfoViewContainer.bounds.size.height*1/6)];
    [_sexBtn setTitle:@"先生" forState:UIControlStateNormal];
    _sexBtn.titleLabel.font = [UIFont systemFontOfSize:13];
    _sexBtn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    [_sexBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    //_sexBtn.backgroundColor = [UIColor redColor];
    
    
    UILabel *remarkLable = [[UILabel alloc]initWithFrame:CGRectMake(5, _changeUserInfoViewContainer.bounds.size.height*1/2, 40, _changeUserInfoViewContainer.bounds.size.height*1/3)];
    remarkLable.font = [UIFont systemFontOfSize:13];
    remarkLable.text = @"备注:";
    _remarkText = [[UITextView alloc]initWithFrame:CGRectMake(45, _changeUserInfoViewContainer.bounds.size.height*1/2, _changeUserInfoViewContainer.bounds.size.width-50, _changeUserInfoViewContainer.bounds.size.height*1/3)];
    _remarkText.layer.cornerRadius=3.0f;
    _remarkText.text = _remarkDetail.text;
    
    _remarkText.layer.masksToBounds=YES;
    _remarkText.layer.borderColor=[[UIColor blackColor]CGColor];
    _remarkText.layer.borderWidth= 1.0f;
    
    _submitBtn = [[UIButton alloc]initWithFrame:CGRectMake(0, _changeUserInfoViewContainer.bounds.size.height*5/6, _changeUserInfoViewContainer.bounds.size.width*0.5, _changeUserInfoViewContainer.bounds.size.height*1/6)];
    [_submitBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [_submitBtn setTitle:@"确认" forState:UIControlStateNormal];
    [_submitBtn addTarget:self action:@selector(submit) forControlEvents:UIControlEventTouchUpInside];
    
    _cancelBnt = [[UIButton alloc]initWithFrame:CGRectMake(_changeUserInfoViewContainer.bounds.size.width*0.5, _changeUserInfoViewContainer.bounds.size.height*5/6, _changeUserInfoViewContainer.bounds.size.width*0.5, _changeUserInfoViewContainer.bounds.size.height*1/6)];
    [_cancelBnt setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    _cancelBnt.layer.cornerRadius = 7.0f;
    [_cancelBnt setTitle:@"取消" forState:UIControlStateNormal];
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

- (void)submit
{
    _firstName.text = _nameText.text;
    _remarkDetail.text = _remarkText.text;
    [_changeUserInfoViewContainer removeFromSuperview];
    [_changeUserInfoView removeFromSuperview];
    [self changeHeightwithRemarkDetail];
}

- (void)cancel
{
    [_changeUserInfoViewContainer removeFromSuperview];
    [_changeUserInfoView removeFromSuperview];
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


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
