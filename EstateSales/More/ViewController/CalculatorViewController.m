//
//  CalculatorViewController.m
//  EstateSales
//
//  Created by Jose Zhu on 16/6/1.
//  Copyright © 2016年 Jose Zhu. All rights reserved.
//

#import "CalculatorViewController.h"

@interface CalculatorViewController ()
@property (nonatomic, strong) UIView *loanView;
@property (nonatomic, strong) UIView *dutyView;

@property (nonatomic, strong) UITextField *houseSizeText;
@property (nonatomic, strong) UITextField *priceText;

@property (nonatomic, strong) UIButton *calculateBtn;
@property (nonatomic, strong) UIButton *resetBtn;
@end

@implementation CalculatorViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"房贷计算器";
    [self createUI];
    [self setupLoanView];
    [self setupDutyView];
}

- (void)createUI
{
    NSArray *segmentedData = [[NSArray alloc]initWithObjects:@"贷款计算器",@"税费计算器",nil];
    UISegmentedControl *segmentedControl = [[UISegmentedControl alloc]initWithItems:segmentedData];
    segmentedControl.frame = CGRectMake(0, 64+10, self.view.bounds.size.width, 30);
    [segmentedControl addTarget:self action:@selector(doSomethingInSegment:)forControlEvents:UIControlEventValueChanged];
    [self.view addSubview:segmentedControl];
    
}

//贷款计算器
- (void)setupLoanView
{
    
}
//税费计算器
- (void)setupDutyView
{
    _dutyView = [[UIView alloc]initWithFrame:CGRectMake(0, 64+10+30, self.view.bounds.size.width, self.view.bounds.size.height-104)];
    UILabel *houseSizeLabel = [[UILabel alloc]initWithFrame:CGRectMake(20, 20, 80, 30)];
    houseSizeLabel.text = @"房屋面积";
    houseSizeLabel.font = [UIFont systemFontOfSize:13];
    _houseSizeText = [[UITextField alloc]initWithFrame:CGRectMake(90, 20, self.view.bounds.size.width-170, 30)];
    UILabel *houseSizeUnitLabel = [[UILabel alloc]initWithFrame:CGRectMake(self.view.bounds.size.width - 60, 20, 70, 30)];
    houseSizeUnitLabel.text = @"平米";
    houseSizeUnitLabel.font = [UIFont systemFontOfSize:13];
    
    
    UILabel *priceLabel = [[UILabel alloc]initWithFrame:CGRectMake(20, 70, 80, 30)];
    priceLabel.text = @"房屋单价";
    priceLabel.font = [UIFont systemFontOfSize:13];
    _priceText = [[UITextField alloc]initWithFrame:CGRectMake(90, 70, self.view.bounds.size.width-170, 30)];
    UILabel *priceUnitLabel = [[UILabel alloc]initWithFrame:CGRectMake(self.view.bounds.size.width - 60, 70, 70, 30)];
    priceUnitLabel.text = @"平米/元";
    priceUnitLabel.font = [UIFont systemFontOfSize:13];
    
    _calculateBtn = [[UIButton alloc]initWithFrame:CGRectMake(20, 120, (self.view.bounds.size.width - 60)*0.5, heightBtn)];
    [_calculateBtn setTitle:@"计算" forState:UIControlStateNormal];
    _calculateBtn.backgroundColor = [UIColor colorWithRed:88/255.0 green:159/255.0 blue:223/255.0 alpha:1];
    _calculateBtn.layer.cornerRadius=3.0f;
    
    _resetBtn = [[UIButton alloc]initWithFrame:CGRectMake((self.view.bounds.size.width - 60)*0.5+40, 120, (self.view.bounds.size.width - 60)*0.5, heightBtn)];
    [_resetBtn setTitle:@"重置" forState:UIControlStateNormal];
    _resetBtn.backgroundColor = [UIColor colorWithRed:88/255.0 green:159/255.0 blue:223/255.0 alpha:1];
    _resetBtn.layer.cornerRadius=3.0f;
    
    
    [self setTextField:_houseSizeText];
    [self setTextField:_priceText];
    
    [_dutyView addSubview:houseSizeLabel];
    [_dutyView addSubview:priceLabel];
    [_dutyView addSubview:houseSizeUnitLabel];
    [_dutyView addSubview:priceUnitLabel];
    [_dutyView addSubview:_calculateBtn];
    [_dutyView addSubview:_resetBtn];
    
    
}
//选择计算器
-(void)doSomethingInSegment:(UISegmentedControl *)Seg
{
    
    NSInteger Index = Seg.selectedSegmentIndex;
    
    switch (Index)
    {
        case 0:
            [self.view addSubview:_loanView];
            [_dutyView removeFromSuperview];
            break;
        case 1:
            [self.view addSubview:_dutyView];
            [_loanView removeFromSuperview];
            break;
        default:
            break;
    }
}


- (void)setTextField:(UITextField *)textField
{
    textField.layer.cornerRadius=3.0f;
    textField.layer.masksToBounds=YES;
    textField.layer.borderColor=[[UIColor grayColor]CGColor];
    textField.layer.borderWidth= 1.0f;
    [_dutyView addSubview:textField];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
