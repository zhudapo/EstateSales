//
//  ChangePwdViewController.m
//  EstateSales
//
//  Created by Jose Zhu on 16/6/1.
//  Copyright © 2016年 Jose Zhu. All rights reserved.
//

#import "ChangePwdViewController.h"

@interface ChangePwdViewController ()
@property (nonatomic, strong) UITextField *oldPwdText;
@property (nonatomic, strong) UITextField *changePwdText;
@property (nonatomic, strong) UITextField *changePwdAgainText;
@property (nonatomic, strong) UIButton *changePwdBtn;
@end

@implementation ChangePwdViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"修改密码";
    [self createUI];
}

- (void)createUI
{
    UILabel *oldLabel = [[UILabel alloc]initWithFrame:CGRectMake(10, 64+20, 80, 30)];
    //oldLabel.backgroundColor = [UIColor redColor];
    oldLabel.text = @"旧密码:";
    oldLabel.font = [UIFont systemFontOfSize:13];
    
    UILabel *newLabel = [[UILabel alloc]initWithFrame:CGRectMake(10, 64+20+50, 80, 30)];
    //newLabel.backgroundColor = [UIColor orangeColor];
    newLabel.text = @"新密码:";
    newLabel.font = [UIFont systemFontOfSize:13];
    
    UILabel *newAgainLabel = [[UILabel alloc]initWithFrame:CGRectMake(10, 64+20+50+50, 80, 30)];
    //newAgainLabel.backgroundColor = [UIColor blueColor];
    newAgainLabel.text = @"确认新密码:";
    newAgainLabel.font = [UIFont systemFontOfSize:13];
    
    _oldPwdText = [[UITextField alloc]initWithFrame:CGRectMake(90, 64+20, self.view.bounds.size.width - 20 - 80, 30)];
    _changePwdText = [[UITextField alloc]initWithFrame:CGRectMake(90, 64+20+50, self.view.bounds.size.width - 20 - 80, 30)];
    _changePwdAgainText = [[UITextField alloc]initWithFrame:CGRectMake(90, 64+20+50+50, self.view.bounds.size.width - 20 - 80, 30)];
    [self setTextField:_oldPwdText];
    [self setTextField:_changePwdText];
    [self setTextField:_changePwdAgainText];
    
    _changePwdBtn = [[UIButton alloc]initWithFrame:CGRectMake(20, 64+20+50+50+60, self.view.bounds.size.width-40, heightBtn)];
    [_changePwdBtn setTitle:@"确定" forState:UIControlStateNormal];
    _changePwdBtn.backgroundColor = [UIColor colorWithRed:111/255.0 green:172/255.0 blue:226/255.0 alpha:1];
    _changePwdBtn.layer.cornerRadius=3.0f;
    [_changePwdBtn addTarget:self action:@selector(changePwd:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_changePwdBtn];
    
    [self.view addSubview:oldLabel];
    [self.view addSubview:newLabel];
    [self.view addSubview:newAgainLabel];
    [self.view addSubview:_oldPwdText];
    [self.view addSubview:_changePwdText];
    [self.view addSubview:_changePwdAgainText];
    
}

- (void)setTextField:(UITextField *)textField
{
    textField.layer.cornerRadius=3.0f;
    textField.layer.masksToBounds=YES;
    textField.layer.borderColor=[[UIColor grayColor]CGColor];
    textField.layer.borderWidth= 1.0f;
    [self.view addSubview:textField];
}

- (void)changePwd:(UIButton *)btn
{
    NSLog(@"change password submit");
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
