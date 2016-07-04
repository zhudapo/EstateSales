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

@property (nonatomic, strong) UIButton *businessLoanBtn;
@property (nonatomic, strong) UIButton *providentFundLoanBtn;
@property (nonatomic, strong) UIButton *combinationLoanBtn;

@property (nonatomic, strong) UITextField *houseSizeText;
@property (nonatomic, strong) UITextField *priceText;

@property (nonatomic, strong) UIButton *calculateBtn;
@property (nonatomic, strong) UIButton *resetBtn;

@property (nonatomic, strong) UIView *businessLoanContentsView;
@property (nonatomic, strong) UIView *providentFundLoanContentsView;
@property (nonatomic, strong) UIScrollView *combinationLoanContentsView;

@property (nonatomic, strong) UITextField *houseNumber;
@property (nonatomic, strong) UITextField *houseSize;
@property (nonatomic, strong) UITextField *houseSumPirce;
@property (nonatomic, strong) UITextField *houseLoanPrice;
@property (nonatomic, strong) UITextField *businessLoan;
@property (nonatomic, strong) UIButton *loanYear;
@property (nonatomic, strong) UIButton *interestRate;
@property (nonatomic, strong) UIButton *businessInterestRate;
@property (nonatomic, strong) UITextField *discount;
@property (nonatomic, strong) UITextField *resultDiscount;
@property (nonatomic, strong) UITextField *businessResultDiscount;

@property (nonatomic, strong) UIButton *firstRepaymentWay;
@property (nonatomic, strong) UIButton *secondRepaymentWay;



@end

@implementation CalculatorViewController




- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"房贷计算器";
    [self setupLoanView];
    [self setupDutyView];
    [self createUI];
    
}

- (void)createUI
{
    NSArray *segmentedData = [[NSArray alloc]initWithObjects:@"贷款计算器",@"税费计算器",nil];
    UISegmentedControl *segmentedControl = [[UISegmentedControl alloc]initWithItems:segmentedData];
    segmentedControl.frame = CGRectMake(0, 64+10, self.view.bounds.size.width, 30);
    segmentedControl.selectedSegmentIndex = 0;
    [self.view addSubview:_loanView];
    [segmentedControl addTarget:self action:@selector(doSomethingInSegment:)forControlEvents:UIControlEventValueChanged];
    [self.view addSubview:segmentedControl];
    [self setupBusinessLoanContentsView];
    [self setupProvidentFundLoanContentsView];
    [self setupCombinationLoanContentsView];
}

//贷款计算器
- (void)setupLoanView
{
    _loanView = [[UIView alloc]initWithFrame:CGRectMake(0, 64+10+30, self.view.bounds.size.width, self.view.bounds.size.height-104)];
    
    
    _businessLoanBtn = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width *1/3, 50)];
    [_businessLoanBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [_businessLoanBtn setTitle:@"商业贷款" forState:UIControlStateNormal];
    _businessLoanBtn.titleLabel.font = [UIFont systemFontOfSize:15];
    //_businessLoanBtn.backgroundColor = [UIColor orangeColor];
    [_businessLoanBtn addTarget:self action:@selector(businessLoanSelected) forControlEvents:UIControlEventTouchUpInside];
    
    _providentFundLoanBtn = [[UIButton alloc]initWithFrame:CGRectMake(self.view.bounds.size.width *1/3, 0, self.view.bounds.size.width *1/3, 50)];
    [_providentFundLoanBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [_providentFundLoanBtn setTitle:@"公积金贷" forState:UIControlStateNormal];
    _providentFundLoanBtn.titleLabel.font = [UIFont systemFontOfSize:15];
    //_providentFundLoanBtn.backgroundColor = [UIColor grayColor];
    [_providentFundLoanBtn addTarget:self action:@selector(providentFundLoanSelected) forControlEvents:UIControlEventTouchUpInside];
    
    _combinationLoanBtn = [[UIButton alloc]initWithFrame:CGRectMake(self.view.bounds.size.width *2/3, 0, self.view.bounds.size.width *1/3, 50)];
    [_combinationLoanBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [_combinationLoanBtn setTitle:@"混合贷款" forState:UIControlStateNormal];
    _combinationLoanBtn.titleLabel.font = [UIFont systemFontOfSize:15];
    //_combinationLoanBtn.backgroundColor = [UIColor cyanColor];
    [_combinationLoanBtn addTarget:self action:@selector(combinationLoanSelected) forControlEvents:UIControlEventTouchUpInside];
    
    _businessLoanContentsView = [[UIView alloc]initWithFrame:CGRectMake(0, 50, self.view.bounds.size.width, self.view.bounds.size.height-154)];
    _providentFundLoanContentsView = [[UIView alloc]initWithFrame:CGRectMake(0, 50, self.view.bounds.size.width, self.view.bounds.size.height-154)];
    _combinationLoanContentsView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 50, self.view.bounds.size.width, self.view.bounds.size.height-154)];
    _combinationLoanContentsView.contentSize = CGSizeMake(self.view.bounds.size.width, 550);
    _combinationLoanContentsView.showsVerticalScrollIndicator = FALSE;
    
    [_loanView addSubview:_businessLoanBtn];
    [_loanView addSubview:_providentFundLoanBtn];
    [_loanView addSubview:_combinationLoanBtn];
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

//businessLoan,//商业贷款
//providentFundLoan,//公积金贷
//combinationLoan,//组合贷款

//商业贷款
- (void)businessLoanSelected
{
    [_loanView addSubview:_businessLoanContentsView];
    [_combinationLoanContentsView removeFromSuperview];
    [_providentFundLoanContentsView removeFromSuperview];
}

- (void)setupBusinessLoanContentsView
{
    UILabel *houseNumber = [[UILabel alloc]initWithFrame:CGRectMake(20, 0, 70, 30)];
    houseNumber.text = @"房号";
    houseNumber.font = [UIFont systemFontOfSize:14];
    _houseNumber = [[UITextField alloc]initWithFrame:CGRectMake(100, 0, self.view.bounds.size.width - 110 - 50, 30)];
    _houseNumber.layer.borderColor=[[UIColor grayColor]CGColor];
    _houseNumber.layer.borderWidth= 1.0f;
    
    UILabel *houseSize = [[UILabel alloc]initWithFrame:CGRectMake(20, 50, 70, 30)];
    houseSize.text = @"房屋面积";
    houseSize.font = [UIFont systemFontOfSize:14];
    _houseSize = [[UITextField alloc]initWithFrame:CGRectMake(100, 50, self.view.bounds.size.width - 110 - 50, 30)];
    _houseSize.layer.borderColor=[[UIColor grayColor]CGColor];
    _houseSize .layer.borderWidth= 1.0f;
    UILabel *sizeUnit = [[UILabel alloc]initWithFrame:CGRectMake(self.view.bounds.size.width - 50, 50, 50, 30)];
    sizeUnit.text = @"平米";
    sizeUnit.font = [UIFont systemFontOfSize:14];
    
    UILabel *houseSumPirce = [[UILabel alloc]initWithFrame:CGRectMake(20, 100, 70, 30)];
    houseSumPirce.text = @"房款总额";
    houseSumPirce.font = [UIFont systemFontOfSize:14];
    _houseSumPirce = [[UITextField alloc]initWithFrame:CGRectMake(100, 100, self.view.bounds.size.width - 110 - 50, 30)];
    _houseSumPirce.layer.borderColor=[[UIColor grayColor]CGColor];
    _houseSumPirce .layer.borderWidth= 1.0f;
    UILabel *_houseSumPirceUnit = [[UILabel alloc]initWithFrame:CGRectMake(self.view.bounds.size.width - 50, 100, 50, 30)];
    _houseSumPirceUnit.text = @"万元";
    _houseSumPirceUnit.font = [UIFont systemFontOfSize:14];
    
    UILabel *houseLoanPrice = [[UILabel alloc]initWithFrame:CGRectMake(20, 150, 70, 30)];
    houseLoanPrice.text = @"贷款总额";
    houseLoanPrice.font = [UIFont systemFontOfSize:14];
    _houseLoanPrice = [[UITextField alloc]initWithFrame:CGRectMake(100, 150, self.view.bounds.size.width - 110 - 50, 30)];
    _houseLoanPrice.layer.borderColor=[[UIColor grayColor]CGColor];
    _houseLoanPrice .layer.borderWidth= 1.0f;
    UILabel *houseLoanPriceUnit = [[UILabel alloc]initWithFrame:CGRectMake(self.view.bounds.size.width - 50, 150, 50, 30)];
    houseLoanPriceUnit.text = @"万元";
    houseLoanPriceUnit.font = [UIFont systemFontOfSize:14];
    
    UILabel *houseLoanYear = [[UILabel alloc]initWithFrame:CGRectMake(20, 190, 70, 30)];
    houseLoanYear.text = @"按揭年限";
    houseLoanYear.font = [UIFont systemFontOfSize:14];
    _loanYear = [[UIButton alloc]initWithFrame:CGRectMake(100, 190, self.view.bounds.size.width - 110 - 50, 30)];
    _loanYear.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    [_loanYear setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [_loanYear setTitle:@"20年(240)期" forState:UIControlStateNormal];
    _loanYear.titleLabel.font = [UIFont systemFontOfSize:14];
    
    UILabel *interestRate = [[UILabel alloc]initWithFrame:CGRectMake(20, 240, 70, 30)];
    interestRate.text = @"贷款利率";
    interestRate.font = [UIFont systemFontOfSize:14];
    _interestRate = [[UIButton alloc]initWithFrame:CGRectMake(100, 240, self.view.bounds.size.width*0.45 , 30)];
    _interestRate.layer.borderColor=[[UIColor grayColor]CGColor];
    _interestRate.layer.borderWidth= 1.0f;
    [_interestRate setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [_interestRate setTitle:@"2016年最新基本利率(4.90)" forState:UIControlStateNormal];
    
    _interestRate.titleLabel.font = [UIFont systemFontOfSize:13];
    UILabel *multiply = [[UILabel alloc]initWithFrame:CGRectMake(self.view.bounds.size.width*0.45 + 105, 240, 10, 30)];
    multiply.text = @"*";
    multiply.font = [UIFont systemFontOfSize:14];
    _discount = [[UITextField alloc]initWithFrame:CGRectMake(self.view.bounds.size.width*0.45 + 105 + 10, 240, self.view.bounds.size.width*1/9, 30)];
    _discount.layer.borderColor=[[UIColor grayColor]CGColor];
    _discount .layer.borderWidth= 1.0f;
    UILabel *discount = [[UILabel alloc]initWithFrame:CGRectMake(self.view.bounds.size.width*0.45 + 105 + 10 +self.view.bounds.size.width*1/9+5, 240, 50, 30)];
    discount.text = @"折";
    discount.font = [UIFont systemFontOfSize:14];
    [_businessLoanContentsView addSubview:discount];
    
    _resultDiscount = [[UITextField alloc]initWithFrame:CGRectMake(100, 290, self.view.bounds.size.width*0.2 , 30)];
    _resultDiscount.layer.borderColor=[[UIColor grayColor]CGColor];
    _resultDiscount .layer.borderWidth= 1.0f;
    UILabel *percent = [[UILabel alloc]initWithFrame:CGRectMake(100+self.view.bounds.size.width*0.2+ 10, 290, 20, 30)];
    percent.text = @"%";
    
    UILabel *repaymentWay = [[UILabel alloc]initWithFrame:CGRectMake(20, 320, 70, 30)];
    repaymentWay.text = @"还款方式";
    repaymentWay.font = [UIFont systemFontOfSize:14];
    _firstRepaymentWay = [[UIButton alloc]initWithFrame:CGRectMake(100, 320, self.view.bounds.size.width *1/4, 30)];
    [_firstRepaymentWay setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [_firstRepaymentWay setTitle:@"等额本息" forState:UIControlStateNormal];
    _firstRepaymentWay.titleLabel.font = [UIFont systemFontOfSize:14];
    
    _secondRepaymentWay = [[UIButton alloc]initWithFrame:CGRectMake(100+self.view.bounds.size.width *1/3, 320, self.view.bounds.size.width *1/4, 30)];
    [_secondRepaymentWay setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [_secondRepaymentWay setTitle:@"等额本金" forState:UIControlStateNormal];
    _secondRepaymentWay.titleLabel.font = [UIFont systemFontOfSize:14];
    
    _calculateBtn = [[UIButton alloc]initWithFrame:CGRectMake(20, 360, (self.view.bounds.size.width - 60)*0.5, 40)];
    [_calculateBtn setTitle:@"计算" forState:UIControlStateNormal];
    _calculateBtn.backgroundColor = [UIColor colorWithRed:111/255.0 green:172/255.0 blue:226/255.0 alpha:1];
    _calculateBtn.layer.cornerRadius=3.0f;
    
    _resetBtn = [[UIButton alloc]initWithFrame:CGRectMake(40 + (self.view.bounds.size.width - 60)*0.5, 360, (self.view.bounds.size.width - 60)*0.5, 40)];
    [_resetBtn setTitle:@"重置" forState:UIControlStateNormal];
    _resetBtn.backgroundColor = [UIColor colorWithRed:111/255.0 green:172/255.0 blue:226/255.0 alpha:1];
    _resetBtn.layer.cornerRadius=3.0f;
    
    [_businessLoanContentsView addSubview:houseNumber];
    [_businessLoanContentsView addSubview:_houseNumber];
    [_businessLoanContentsView addSubview:houseSize];
    [_businessLoanContentsView addSubview:_houseSize];
    [_businessLoanContentsView addSubview:sizeUnit];
    [_businessLoanContentsView addSubview:houseSumPirce];
    [_businessLoanContentsView addSubview:_houseSumPirce];
    [_businessLoanContentsView addSubview:_houseSumPirceUnit];
    [_businessLoanContentsView addSubview:houseLoanPrice];
    [_businessLoanContentsView addSubview:_houseLoanPrice];
    [_businessLoanContentsView addSubview:houseLoanPriceUnit];
    [_businessLoanContentsView addSubview:houseLoanYear];
    [_businessLoanContentsView addSubview:_loanYear];
    [_businessLoanContentsView addSubview:interestRate];
    [_businessLoanContentsView addSubview:_interestRate];
    [_businessLoanContentsView addSubview:multiply];
    [_businessLoanContentsView addSubview:_discount];
    [_businessLoanContentsView addSubview:discount];
    [_businessLoanContentsView addSubview:_resultDiscount];
    [_businessLoanContentsView addSubview:percent];
    [_businessLoanContentsView addSubview:repaymentWay];
    [_businessLoanContentsView addSubview:_firstRepaymentWay];
    [_businessLoanContentsView addSubview:_secondRepaymentWay];
    [_businessLoanContentsView addSubview:_calculateBtn];
    [_businessLoanContentsView addSubview:_resetBtn];

}

//公积金贷款
- (void)providentFundLoanSelected
{
    [_loanView addSubview:_providentFundLoanContentsView];
    [_businessLoanContentsView removeFromSuperview];
    [_combinationLoanContentsView removeFromSuperview];
}

- (void)setupProvidentFundLoanContentsView
{
    UILabel *houseNumber = [[UILabel alloc]initWithFrame:CGRectMake(20, 0, 70, 30)];
    houseNumber.text = @"房号";
    houseNumber.font = [UIFont systemFontOfSize:14];
    _houseNumber = [[UITextField alloc]initWithFrame:CGRectMake(100, 0, self.view.bounds.size.width - 110 - 50, 30)];
    _houseNumber.layer.borderColor=[[UIColor grayColor]CGColor];
    _houseNumber.layer.borderWidth= 1.0f;
    
    UILabel *houseSize = [[UILabel alloc]initWithFrame:CGRectMake(20, 50, 70, 30)];
    houseSize.text = @"房屋面积";
    houseSize.font = [UIFont systemFontOfSize:14];
    _houseSize = [[UITextField alloc]initWithFrame:CGRectMake(100, 50, self.view.bounds.size.width - 110 - 50, 30)];
    _houseSize.layer.borderColor=[[UIColor grayColor]CGColor];
    _houseSize .layer.borderWidth= 1.0f;
    UILabel *sizeUnit = [[UILabel alloc]initWithFrame:CGRectMake(self.view.bounds.size.width - 50, 50, 50, 30)];
    sizeUnit.text = @"平米";
    sizeUnit.font = [UIFont systemFontOfSize:14];
    
    UILabel *houseSumPirce = [[UILabel alloc]initWithFrame:CGRectMake(20, 100, 70, 30)];
    houseSumPirce.text = @"房款总额";
    houseSumPirce.font = [UIFont systemFontOfSize:14];
    _houseSumPirce = [[UITextField alloc]initWithFrame:CGRectMake(100, 100, self.view.bounds.size.width - 110 - 50, 30)];
    _houseSumPirce.layer.borderColor=[[UIColor grayColor]CGColor];
    _houseSumPirce .layer.borderWidth= 1.0f;
    UILabel *_houseSumPirceUnit = [[UILabel alloc]initWithFrame:CGRectMake(self.view.bounds.size.width - 50, 100, 50, 30)];
    _houseSumPirceUnit.text = @"万元";
    _houseSumPirceUnit.font = [UIFont systemFontOfSize:14];
    
    UILabel *houseLoanPrice = [[UILabel alloc]initWithFrame:CGRectMake(20, 150, 70, 30)];
    houseLoanPrice.text = @"贷款总额";
    houseLoanPrice.font = [UIFont systemFontOfSize:14];
    _houseLoanPrice = [[UITextField alloc]initWithFrame:CGRectMake(100, 150, self.view.bounds.size.width - 110 - 50, 30)];
    _houseLoanPrice.layer.borderColor=[[UIColor grayColor]CGColor];
    _houseLoanPrice .layer.borderWidth= 1.0f;
    UILabel *houseLoanPriceUnit = [[UILabel alloc]initWithFrame:CGRectMake(self.view.bounds.size.width - 50, 150, 50, 30)];
    houseLoanPriceUnit.text = @"万元";
    houseLoanPriceUnit.font = [UIFont systemFontOfSize:14];
    
    UILabel *houseLoanYear = [[UILabel alloc]initWithFrame:CGRectMake(20, 190, 70, 30)];
    houseLoanYear.text = @"按揭年限";
    houseLoanYear.font = [UIFont systemFontOfSize:14];
    _loanYear = [[UIButton alloc]initWithFrame:CGRectMake(100, 190, self.view.bounds.size.width - 110 - 50, 30)];
    _loanYear.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    [_loanYear setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [_loanYear setTitle:@"20年(240)期" forState:UIControlStateNormal];
    _loanYear.titleLabel.font = [UIFont systemFontOfSize:14];
    
    UILabel *interestRate = [[UILabel alloc]initWithFrame:CGRectMake(20, 240, 70, 30)];
    interestRate.text = @"贷款利率";
    interestRate.font = [UIFont systemFontOfSize:14];
    _interestRate = [[UIButton alloc]initWithFrame:CGRectMake(100, 240, self.view.bounds.size.width*0.45 , 30)];
    _interestRate.layer.borderColor=[[UIColor grayColor]CGColor];
    _interestRate.layer.borderWidth= 1.0f;
    [_interestRate setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [_interestRate setTitle:@"2016年最新基本利率(3.25)" forState:UIControlStateNormal];
    
    _interestRate.titleLabel.font = [UIFont systemFontOfSize:13];
    _resultDiscount = [[UITextField alloc]initWithFrame:CGRectMake(100, 290, self.view.bounds.size.width*0.2 , 30)];
    _resultDiscount.layer.borderColor=[[UIColor grayColor]CGColor];
    _resultDiscount .layer.borderWidth= 1.0f;
    UILabel *percent = [[UILabel alloc]initWithFrame:CGRectMake(100+self.view.bounds.size.width*0.2+ 10, 290, 20, 30)];
    percent.text = @"%";
    
    UILabel *repaymentWay = [[UILabel alloc]initWithFrame:CGRectMake(20, 320, 70, 30)];
    repaymentWay.text = @"还款方式";
    repaymentWay.font = [UIFont systemFontOfSize:14];
    _firstRepaymentWay = [[UIButton alloc]initWithFrame:CGRectMake(100, 320, self.view.bounds.size.width *1/4, 30)];
    [_firstRepaymentWay setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [_firstRepaymentWay setTitle:@"等额本息" forState:UIControlStateNormal];
    _firstRepaymentWay.titleLabel.font = [UIFont systemFontOfSize:14];
    
    _secondRepaymentWay = [[UIButton alloc]initWithFrame:CGRectMake(100+self.view.bounds.size.width *1/3, 320, self.view.bounds.size.width *1/4, 30)];
    [_secondRepaymentWay setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [_secondRepaymentWay setTitle:@"等额本金" forState:UIControlStateNormal];
    _secondRepaymentWay.titleLabel.font = [UIFont systemFontOfSize:14];
    
    _calculateBtn = [[UIButton alloc]initWithFrame:CGRectMake(20, 360, (self.view.bounds.size.width - 60)*0.5, 40)];
    [_calculateBtn setTitle:@"计算" forState:UIControlStateNormal];
    _calculateBtn.backgroundColor = [UIColor colorWithRed:111/255.0 green:172/255.0 blue:226/255.0 alpha:1];
    _calculateBtn.layer.cornerRadius=3.0f;
    
    _resetBtn = [[UIButton alloc]initWithFrame:CGRectMake(40 + (self.view.bounds.size.width - 60)*0.5, 360, (self.view.bounds.size.width - 60)*0.5, 40)];
    [_resetBtn setTitle:@"重置" forState:UIControlStateNormal];
    _resetBtn.backgroundColor = [UIColor colorWithRed:111/255.0 green:172/255.0 blue:226/255.0 alpha:1];
    _resetBtn.layer.cornerRadius=3.0f;
    
    [_providentFundLoanContentsView addSubview:houseNumber];
    [_providentFundLoanContentsView addSubview:_houseNumber];
    [_providentFundLoanContentsView addSubview:houseSize];
    [_providentFundLoanContentsView addSubview:_houseSize];
    [_providentFundLoanContentsView addSubview:sizeUnit];
    [_providentFundLoanContentsView addSubview:houseSumPirce];
    [_providentFundLoanContentsView addSubview:_houseSumPirce];
    [_providentFundLoanContentsView addSubview:_houseSumPirceUnit];
    [_providentFundLoanContentsView addSubview:houseLoanPrice];
    [_providentFundLoanContentsView addSubview:_houseLoanPrice];
    [_providentFundLoanContentsView addSubview:houseLoanPriceUnit];
    [_providentFundLoanContentsView addSubview:houseLoanYear];
    [_providentFundLoanContentsView addSubview:_loanYear];
    [_providentFundLoanContentsView addSubview:interestRate];
    [_providentFundLoanContentsView addSubview:_interestRate];
    [_providentFundLoanContentsView addSubview:_resultDiscount];
    [_providentFundLoanContentsView addSubview:percent];
    [_providentFundLoanContentsView addSubview:repaymentWay];
    [_providentFundLoanContentsView addSubview:_firstRepaymentWay];
    [_providentFundLoanContentsView addSubview:_secondRepaymentWay];
    [_providentFundLoanContentsView addSubview:_calculateBtn];
    [_providentFundLoanContentsView addSubview:_resetBtn];
}
//混合贷款
- (void)combinationLoanSelected
{
    [_loanView addSubview:_combinationLoanContentsView];
    [_businessLoanContentsView removeFromSuperview];
    [_providentFundLoanContentsView removeFromSuperview];
}

- (void)setupCombinationLoanContentsView
{
    UILabel *houseNumber = [[UILabel alloc]initWithFrame:CGRectMake(20, 0, 70, 30)];
    houseNumber.text = @"房号";
    houseNumber.font = [UIFont systemFontOfSize:14];
    _houseNumber = [[UITextField alloc]initWithFrame:CGRectMake(100, 0, self.view.bounds.size.width - 110 - 50, 30)];
    _houseNumber.layer.borderColor=[[UIColor grayColor]CGColor];
    _houseNumber.layer.borderWidth= 1.0f;
    
    UILabel *houseSize = [[UILabel alloc]initWithFrame:CGRectMake(20, 50, 70, 30)];
    houseSize.text = @"房屋面积";
    houseSize.font = [UIFont systemFontOfSize:14];
    _houseSize = [[UITextField alloc]initWithFrame:CGRectMake(100, 50, self.view.bounds.size.width - 110 - 50, 30)];
    _houseSize.layer.borderColor=[[UIColor grayColor]CGColor];
    _houseSize .layer.borderWidth= 1.0f;
    UILabel *sizeUnit = [[UILabel alloc]initWithFrame:CGRectMake(self.view.bounds.size.width - 50, 50, 50, 30)];
    sizeUnit.text = @"平米";
    sizeUnit.font = [UIFont systemFontOfSize:14];
    
    UILabel *houseSumPirce = [[UILabel alloc]initWithFrame:CGRectMake(20, 100, 70, 30)];
    houseSumPirce.text = @"房款总额";
    houseSumPirce.font = [UIFont systemFontOfSize:14];
    _houseSumPirce = [[UITextField alloc]initWithFrame:CGRectMake(100, 100, self.view.bounds.size.width - 110 - 50, 30)];
    _houseSumPirce.layer.borderColor=[[UIColor grayColor]CGColor];
    _houseSumPirce .layer.borderWidth= 1.0f;
    UILabel *_houseSumPirceUnit = [[UILabel alloc]initWithFrame:CGRectMake(self.view.bounds.size.width - 50, 100, 50, 30)];
    _houseSumPirceUnit.text = @"万元";
    _houseSumPirceUnit.font = [UIFont systemFontOfSize:14];
    
    UILabel *houseLoanPrice = [[UILabel alloc]initWithFrame:CGRectMake(20, 150, 70, 30)];
    houseLoanPrice.text = @"商业贷款";
    houseLoanPrice.font = [UIFont systemFontOfSize:14];
    _houseLoanPrice = [[UITextField alloc]initWithFrame:CGRectMake(100, 150, self.view.bounds.size.width - 110 - 50, 30)];
    _houseLoanPrice.layer.borderColor=[[UIColor grayColor]CGColor];
    _houseLoanPrice .layer.borderWidth= 1.0f;
    UILabel *houseLoanPriceUnit = [[UILabel alloc]initWithFrame:CGRectMake(self.view.bounds.size.width - 50, 150, 50, 30)];
    houseLoanPriceUnit.text = @"万元";
    houseLoanPriceUnit.font = [UIFont systemFontOfSize:14];
    
    UILabel *businessLoan = [[UILabel alloc]initWithFrame:CGRectMake(20, 190, 70, 30)];
    businessLoan.text = @"公积金贷";
    businessLoan.font = [UIFont systemFontOfSize:14];
    _businessLoan = [[UITextField alloc]initWithFrame:CGRectMake(100, 190, self.view.bounds.size.width - 110 - 50, 30)];
    _businessLoan.layer.borderColor=[[UIColor grayColor]CGColor];
    _businessLoan .layer.borderWidth= 1.0f;
    UILabel *businessLoanUnit = [[UILabel alloc]initWithFrame:CGRectMake(self.view.bounds.size.width - 50, 190, 50, 30)];
    businessLoanUnit.text = @"万元";
    businessLoanUnit.font = [UIFont systemFontOfSize:14];
    
    UILabel *houseLoanYear = [[UILabel alloc]initWithFrame:CGRectMake(20, 230, 70, 30)];
    houseLoanYear.text = @"按揭年限";
    houseLoanYear.font = [UIFont systemFontOfSize:14];
    _loanYear = [[UIButton alloc]initWithFrame:CGRectMake(100, 230, self.view.bounds.size.width - 110 - 50, 30)];
    _loanYear.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    [_loanYear setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [_loanYear setTitle:@"20年(240)期" forState:UIControlStateNormal];
    _loanYear.titleLabel.font = [UIFont systemFontOfSize:14];
    
    UILabel *interestRate = [[UILabel alloc]initWithFrame:CGRectMake(20, 280, 90, 30)];
    interestRate.text = @"公积金贷利率";
    interestRate.font = [UIFont systemFontOfSize:14];
    interestRate.backgroundColor = [UIColor redColor];
    _interestRate = [[UIButton alloc]initWithFrame:CGRectMake(120, 280, self.view.bounds.size.width*0.45 , 30)];
    _interestRate.layer.borderColor=[[UIColor grayColor]CGColor];
    _interestRate.layer.borderWidth= 1.0f;
    [_interestRate setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [_interestRate setTitle:@"2016年最新基本利率(3.25)" forState:UIControlStateNormal];
    _interestRate.titleLabel.font = [UIFont systemFontOfSize:13];
    _resultDiscount = [[UITextField alloc]initWithFrame:CGRectMake(120, 320, self.view.bounds.size.width*0.2 , 30)];
    _resultDiscount.layer.borderColor=[[UIColor grayColor]CGColor];
    _resultDiscount .layer.borderWidth= 1.0f;
    UILabel *percent = [[UILabel alloc]initWithFrame:CGRectMake(120+self.view.bounds.size.width*0.2+ 10, 320, 20, 30)];
    percent.text = @"%";

    UILabel *businessInterestRate = [[UILabel alloc]initWithFrame:CGRectMake(20, 370, 90, 30)];
    businessInterestRate.text = @"商业贷款利率";
    businessInterestRate.font = [UIFont systemFontOfSize:14];
    _businessInterestRate = [[UIButton alloc]initWithFrame:CGRectMake(120, 370, self.view.bounds.size.width*0.45 , 30)];
    _businessInterestRate.layer.borderColor=[[UIColor grayColor]CGColor];
    _businessInterestRate.layer.borderWidth= 1.0f;
    [_businessInterestRate setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [_businessInterestRate setTitle:@"2016年最新基本利率(4.9)" forState:UIControlStateNormal];
    _businessInterestRate.titleLabel.font = [UIFont systemFontOfSize:13];
    UILabel *multiply = [[UILabel alloc]initWithFrame:CGRectMake(self.view.bounds.size.width*0.45 + 125, 370, 10, 30)];
    multiply.text = @"*";
    multiply.font = [UIFont systemFontOfSize:14];
    
    _discount = [[UITextField alloc]initWithFrame:CGRectMake(self.view.bounds.size.width*0.45 + 105 + 30, 370, self.view.bounds.size.width*1/9, 30)];
    _discount.layer.borderColor=[[UIColor grayColor]CGColor];
    _discount .layer.borderWidth= 1.0f;
    
    _businessResultDiscount = [[UITextField alloc]initWithFrame:CGRectMake(120, 420, self.view.bounds.size.width*0.2 , 30)];
    _businessResultDiscount.layer.borderColor=[[UIColor grayColor]CGColor];
    _businessResultDiscount .layer.borderWidth= 1.0f;
    UILabel *businessPercent = [[UILabel alloc]initWithFrame:CGRectMake(120+self.view.bounds.size.width*0.2+ 10, 420, 20, 30)];
    businessPercent.text = @"%";
    
    UILabel *repaymentWay = [[UILabel alloc]initWithFrame:CGRectMake(20, 450, 70, 30)];
    repaymentWay.text = @"还款方式";
    repaymentWay.font = [UIFont systemFontOfSize:14];
    _firstRepaymentWay = [[UIButton alloc]initWithFrame:CGRectMake(100, 450, self.view.bounds.size.width *1/4, 30)];
    [_firstRepaymentWay setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [_firstRepaymentWay setTitle:@"等额本息" forState:UIControlStateNormal];
    _firstRepaymentWay.titleLabel.font = [UIFont systemFontOfSize:14];
    
    _secondRepaymentWay = [[UIButton alloc]initWithFrame:CGRectMake(100+self.view.bounds.size.width *1/3, 450, self.view.bounds.size.width *1/4, 30)];
    [_secondRepaymentWay setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [_secondRepaymentWay setTitle:@"等额本金" forState:UIControlStateNormal];
    _secondRepaymentWay.titleLabel.font = [UIFont systemFontOfSize:14];
    
    _calculateBtn = [[UIButton alloc]initWithFrame:CGRectMake(20, 490, (self.view.bounds.size.width - 60)*0.5, 40)];
    [_calculateBtn setTitle:@"计算" forState:UIControlStateNormal];
    _calculateBtn.backgroundColor = [UIColor colorWithRed:111/255.0 green:172/255.0 blue:226/255.0 alpha:1];
    _calculateBtn.layer.cornerRadius=3.0f;
    
    _resetBtn = [[UIButton alloc]initWithFrame:CGRectMake(40 + (self.view.bounds.size.width - 60)*0.5, 490, (self.view.bounds.size.width - 60)*0.5, 40)];
    [_resetBtn setTitle:@"重置" forState:UIControlStateNormal];
    _resetBtn.backgroundColor = [UIColor colorWithRed:111/255.0 green:172/255.0 blue:226/255.0 alpha:1];
    _resetBtn.layer.cornerRadius=3.0f;
    
    [_combinationLoanContentsView addSubview:houseNumber];
    [_combinationLoanContentsView addSubview:_houseNumber];
    [_combinationLoanContentsView addSubview:houseSize];
    [_combinationLoanContentsView addSubview:_houseSize];
    [_combinationLoanContentsView addSubview:sizeUnit];
    [_combinationLoanContentsView addSubview:houseSumPirce];
    [_combinationLoanContentsView addSubview:_houseSumPirce];
    [_combinationLoanContentsView addSubview:_houseSumPirceUnit];
    [_combinationLoanContentsView addSubview:houseLoanPrice];
    [_combinationLoanContentsView addSubview:_houseLoanPrice];
    [_combinationLoanContentsView addSubview:houseLoanPriceUnit];
    [_combinationLoanContentsView addSubview:businessLoan];
    [_combinationLoanContentsView addSubview:_businessLoan];
    [_combinationLoanContentsView addSubview:businessLoanUnit];
    [_combinationLoanContentsView addSubview:houseLoanYear];
    
    [_combinationLoanContentsView addSubview:_loanYear];
    [_combinationLoanContentsView addSubview:interestRate];
    [_combinationLoanContentsView addSubview:_interestRate];
    [_combinationLoanContentsView addSubview:_resultDiscount];
    [_combinationLoanContentsView addSubview:percent];
    [_combinationLoanContentsView addSubview:businessInterestRate];
    [_combinationLoanContentsView addSubview:_businessInterestRate];
    [_combinationLoanContentsView addSubview:multiply];
    [_combinationLoanContentsView addSubview:_discount];
    [_combinationLoanContentsView addSubview:_businessResultDiscount];
    [_combinationLoanContentsView addSubview:businessPercent];
    
    [_combinationLoanContentsView addSubview:repaymentWay];
    [_combinationLoanContentsView addSubview:_firstRepaymentWay];
    [_combinationLoanContentsView addSubview:_secondRepaymentWay];
    [_combinationLoanContentsView addSubview:_calculateBtn];
    [_combinationLoanContentsView addSubview:_resetBtn];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
