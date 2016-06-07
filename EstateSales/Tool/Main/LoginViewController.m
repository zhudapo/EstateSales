//
//  LoginViewController.m
//  EstateSales
//
//  Created by Jose Zhu on 16/6/7.
//  Copyright © 2016年 Jose Zhu. All rights reserved.
//

#import "LoginViewController.h"
#import "Masonry.h"
#import "IQKeyboardManager.h"
#import "TabBarViewController.h"


@interface LoginViewController ()
@property (nonatomic, strong) UIButton *loginImage;
@property (nonatomic, strong) UITextField *account;
@property (nonatomic, strong) UITextField *passWord;
@property (nonatomic, strong) UIButton *remember;
@property (nonatomic, strong) UIButton *login;
@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self createUI];
    [IQKeyboardManager sharedManager].shouldResignOnTouchOutside = YES;
}

- (void)createUI
{
    UIButton *imageBtn = [[UIButton alloc]initWithFrame:CGRectMake(self.view.bounds.size.width*1/3, self.view.bounds.size.height*1/5, self.view.bounds.size.width*1/3, self.view.bounds.size.height*1/5)];
    [imageBtn setImage:[UIImage imageNamed:@"picture"] forState:UIControlStateNormal];
    [imageBtn setAdjustsImageWhenHighlighted:NO];
    
    
    _loginImage = [[UIButton alloc]initWithFrame:CGRectMake(10, self.view.bounds.size.height*2/5 + self.view.bounds.size.height*1/10, self.view.bounds.size.width - 20,109)];
    [_loginImage setImage:[UIImage imageNamed:@"loginPicture"] forState:UIControlStateNormal];
    [_loginImage setAdjustsImageWhenHighlighted:NO];
    
    _account = [[UITextField alloc]initWithFrame:CGRectMake(self.view.bounds.size.width*0.25, self.view.bounds.size.height*2/5 + self.view.bounds.size.height*1/10, self.view.bounds.size.width - self.view.bounds.size.width*0.2 -20, 54)];
    _account.text = @"123";
    
    _passWord = [[UITextField alloc]initWithFrame:CGRectMake(self.view.bounds.size.width*0.25, self.view.bounds.size.height*2/5 + self.view.bounds.size.height*1/10 +54, self.view.bounds.size.width - self.view.bounds.size.width*0.2 -20, 54)];
    _passWord.text = @"123";
    
    _remember = [[UIButton alloc]initWithFrame:CGRectMake(30, self.view.bounds.size.height*3/5+74, 40, 40)];
    _remember.backgroundColor = [UIColor orangeColor];
    
    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(90, self.view.bounds.size.height*3/5+84, 110, 30)];
    label.font = [UIFont systemFontOfSize:15];
    label.text = @"记住密码";
    //label.backgroundColor = [UIColor redColor];
    
    _login = [[UIButton alloc]initWithFrame:CGRectMake(10, self.view.bounds.size.height*7/10+84, self.view.bounds.size.width - 20, self.view.bounds.size.height*1/15)];
    [_login setTitle:@"登录" forState:UIControlStateNormal];
    _login.backgroundColor = [UIColor colorWithRed:111/255.0 green:172/255.0 blue:226/255.0 alpha:1];
    _login.layer.cornerRadius=3.0f;
    [_login addTarget:self action:@selector(login:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:imageBtn];
    [self.view addSubview:_loginImage];
    [self.view addSubview:_account];
    [self.view addSubview:_passWord];
    [self.view addSubview:_remember];
    [self.view addSubview:label];
    [self.view addSubview:_login];
}

- (void)login:(UIButton *)btn
{
    NSString *account = _account.text;
    NSString *pwd = _passWord.text;
    if ([account isEqualToString:@"123"] && [pwd isEqualToString:@"123"]) {
        TabBarViewController *tabBarVC = [[TabBarViewController alloc]init];
        [self presentViewController:tabBarVC animated:YES completion:^{
            
        }];
    }else{
        NSLog(@"登录失败了吧");
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
