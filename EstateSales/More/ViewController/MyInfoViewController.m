//
//  MyInfoViewController.m
//  EstateSales
//
//  Created by Jose Zhu on 16/6/1.
//  Copyright © 2016年 Jose Zhu. All rights reserved.
//

#import "MyInfoViewController.h"

@interface MyInfoViewController ()
@property(nonatomic)BOOL IsShowFrameView;
@property (nonatomic , strong) UIView *showIPFrameView;
@property (nonatomic, strong) UIButton *callStyleBtn;
@property (nonatomic , strong) NSArray *callStyleArray;
@property (nonatomic, strong) UIButton *bindPhoneNumber;
@end

@implementation MyInfoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"我的信息";
    self.view.backgroundColor = [UIColor colorWithRed:231.0/255 green:231.0/255 blue:231.0/255 alpha:1.0];
    [self createUI];
}

- (void)createUI
{
    UIButton *accountbtn = [[UIButton alloc]initWithFrame:CGRectMake(0, 64, self.view.bounds.size.width, 50)];
    [accountbtn setTitle:@"   账号:" forState:UIControlStateNormal];
    accountbtn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    [accountbtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    accountbtn.titleLabel.font = [UIFont systemFontOfSize: 13.0];
    accountbtn.backgroundColor = [UIColor whiteColor];
    UIView *firstLine = [[UIView alloc]initWithFrame:CGRectMake(0, 64+50, self.view.bounds.size.width, 1)];
    firstLine.backgroundColor = [UIColor grayColor];
    
    UIButton *namebtn = [[UIButton alloc]initWithFrame:CGRectMake(0, 64+50+1, self.view.bounds.size.width, 50)];
    [namebtn setTitle:@"   姓名:" forState:UIControlStateNormal];
    namebtn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    [namebtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    namebtn.titleLabel.font = [UIFont systemFontOfSize: 13.0];
    namebtn.backgroundColor = [UIColor whiteColor];
    UIView *secondLine = [[UIView alloc]initWithFrame:CGRectMake(0, 64+100, self.view.bounds.size.width, 1)];
    secondLine.backgroundColor = [UIColor grayColor];
    
    UIButton *phonebtn = [[UIButton alloc]initWithFrame:CGRectMake(0, 64+100+1, self.view.bounds.size.width, 50)];
    [phonebtn setTitle:@"   电话:" forState:UIControlStateNormal];
    phonebtn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    [phonebtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    phonebtn.titleLabel.font = [UIFont systemFontOfSize: 13.0];
    phonebtn.backgroundColor = [UIColor whiteColor];
    UIView *thirdLine = [[UIView alloc]initWithFrame:CGRectMake(0, 64+150, self.view.bounds.size.width, 1)];
    thirdLine.backgroundColor = [UIColor grayColor];
    
    _bindPhoneNumber = [[UIButton alloc]initWithFrame:CGRectMake(self.view.bounds.size.width - 100, 10, 90, 30)];
    _bindPhoneNumber.backgroundColor = [UIColor redColor];
    [_bindPhoneNumber setTitle:@"绑定手机号码" forState:UIControlStateNormal];
    _bindPhoneNumber.titleLabel.font = [UIFont systemFontOfSize: 13.0];
    _bindPhoneNumber.layer.cornerRadius = 10.0f;
    [phonebtn addSubview:_bindPhoneNumber];
    [_bindPhoneNumber addTarget:self action:@selector(bindPhoneNumber:) forControlEvents:UIControlEventTouchUpInside];
    
    
    _callStyleBtn = [[UIButton alloc]initWithFrame:CGRectMake(0, 64+150+1, self.view.bounds.size.width, 50)];
    [_callStyleBtn setTitle:@"   呼叫方式:" forState:UIControlStateNormal];
    _callStyleBtn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    [_callStyleBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    _callStyleBtn.titleLabel.font = [UIFont systemFontOfSize: 13.0];
    _callStyleBtn.backgroundColor = [UIColor whiteColor];
    [_callStyleBtn addTarget:self action:@selector(chooseCallStyle:) forControlEvents:UIControlEventTouchUpInside];
    UIView *forthLine = [[UIView alloc]initWithFrame:CGRectMake(0, 64+200, self.view.bounds.size.width, 1)];
    forthLine.backgroundColor = [UIColor grayColor];
    
    UIButton *nowItembtn = [[UIButton alloc]initWithFrame:CGRectMake(0, 64+200+1, self.view.bounds.size.width, 50)];
    [nowItembtn setTitle:@"   当前项目:" forState:UIControlStateNormal];
    nowItembtn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    [nowItembtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    nowItembtn.titleLabel.font = [UIFont systemFontOfSize: 13.0];
    nowItembtn.backgroundColor = [UIColor whiteColor];
    
    
    [self.view addSubview:accountbtn];
    [self.view addSubview:firstLine];
    [self.view addSubview:namebtn];
    [self.view addSubview:secondLine];
    [self.view addSubview:phonebtn];
    [self.view addSubview:thirdLine];
    [self.view addSubview:_callStyleBtn];
    [self.view addSubview:forthLine];
    [self.view addSubview:nowItembtn];
}

- (void)chooseCallStyle:(UIButton *)btn
{
    UIView *view = nil;
    if (!_showIPFrameView) {
        view = [[UIView alloc]initWithFrame:CGRectMake(0, 64+200+1, self.view.bounds.size.width, 100)];
        view.backgroundColor = [UIColor grayColor];
        self.showIPFrameView = view;
        
        self.callStyleArray = [NSArray arrayWithObjects:@"IP呼叫",@"运营商呼叫", nil];
        for (int i = 0; i < _callStyleArray.count; i++) {
            UIButton *btn = [[UIButton alloc]initWithFrame:CGRectMake(0, i*(50), view.bounds.size.width, 50)];
            [btn setTitle:_callStyleArray[i] forState:UIControlStateNormal];
            btn.titleLabel.font = [UIFont systemFontOfSize:15];
            [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
            //btn.backgroundColor = [UIColor orangeColor];
            btn.tag = i;
            [btn addTarget:self action:@selector(chooseCallStyleClick:) forControlEvents:UIControlEventTouchUpInside];
            [_showIPFrameView addSubview:btn];
        }
    }
    if (_IsShowFrameView) {
        _IsShowFrameView = NO;
        [_showIPFrameView removeFromSuperview];
        return;
    }
    
    [self.view addSubview:_showIPFrameView];
    _IsShowFrameView = YES;

}

- (void)chooseCallStyleClick:(UIButton *)btn
{
    NSString *title = [_callStyleArray objectAtIndex:btn.tag];
    NSString *callstyleStr = @"   呼叫方式:  ";
    NSString *callstyleTitle = [callstyleStr stringByAppendingString:title];
    [_callStyleBtn setTitle:callstyleTitle forState:UIControlStateNormal];
    _IsShowFrameView = NO;
    [_showIPFrameView removeFromSuperview];
}

- (void)bindPhoneNumber:(UIButton *)btn
{
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
