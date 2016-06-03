//
//  SeniorSearchViewController.m
//  EstateSales
//
//  Created by Jose Zhu on 16/6/2.
//  Copyright © 2016年 Jose Zhu. All rights reserved.
//

#import "SeniorSearchViewController.h"
#import "UIView+TYAlertView.h"
#import "STPickerDate.h"
#import "STPickerView.h"

@interface SeniorSearchViewController ()<UIActionSheetDelegate,STPickerDateDelegate>
@property (nonatomic, strong) UIButton *createTimeStartBtn;
@property (nonatomic, strong) UIButton *createTimeEndBtn;

@property (nonatomic, strong) UIButton *contactTimeStartBtn;
@property (nonatomic, strong) UIButton *contactTimeEndBtn;

@property (nonatomic, strong) UIButton *appointmentTimeStartBtn;
@property (nonatomic, strong) UIButton *appointmentTimeEndBtn;

@property (nonatomic, strong) UIButton *resultBtn;
@property (nonatomic, strong) UIButton *salesStatusBtn;
@property (nonatomic, strong) UIButton *intentionProductBtn;


@property (nonatomic, strong) UILabel *createTimeStartLabel;
@property (nonatomic, strong) UILabel *contactTimeStartLabel;
@property (nonatomic, strong) UILabel *appointmentTimeStarLabel;
@property (nonatomic, strong) UILabel *resultLabel;
@property (nonatomic, strong) UILabel *salesStatusLabel;
@property (nonatomic, strong) UILabel *intentionProductLabel;

@property (nonatomic, strong) UIButton *searchBtn;

@end

@implementation SeniorSearchViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"高级搜索";
    [self createUI];
}

- (void)createUI
{
    //first
    _createTimeStartBtn = [[UIButton alloc]initWithFrame:CGRectMake(10, 64, (self.view.bounds.size.width-25)*0.5, 50)];
    _createTimeStartBtn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    _createTimeStartBtn.titleLabel.font = [UIFont systemFontOfSize: 13.0];
    [_createTimeStartBtn setTitle:@"创建时间" forState:UIControlStateNormal];
    [_createTimeStartBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    _createTimeStartBtn.tag = 1;
    [_createTimeStartBtn addTarget:self action:@selector(showDataTime:) forControlEvents:UIControlEventTouchUpInside];
    
    _createTimeStartLabel = [[UILabel alloc]initWithFrame:CGRectMake((self.view.bounds.size.width-25)*0.5 - 100, 64, 100, 50)];
    _createTimeStartLabel.textAlignment = NSTextAlignmentRight;
    _createTimeStartLabel.font = [UIFont systemFontOfSize:13.0];
    
    UILabel *firstLabel = [[UILabel alloc]initWithFrame:CGRectMake(10+(self.view.bounds.size.width-25)*0.5, 64, 15, 50)];
    firstLabel.text = @"至";
    firstLabel.font = [UIFont systemFontOfSize:13.0];
    
    _createTimeEndBtn = [[UIButton alloc]initWithFrame:CGRectMake(15+(self.view.bounds.size.width-25)*0.5, 64, (self.view.bounds.size.width-25)*0.5, 50)];
    _createTimeEndBtn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentRight;
    _createTimeEndBtn.titleLabel.font = [UIFont systemFontOfSize: 13.0];
    [_createTimeEndBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    _createTimeEndBtn.tag = 2;
    [_createTimeEndBtn addTarget:self action:@selector(showDataTime:) forControlEvents:UIControlEventTouchUpInside];
    
    UIView *firstLineView = [[UIView alloc]initWithFrame:CGRectMake(0, 64+50+1, self.view.bounds.size.width, 1)];
    firstLineView.backgroundColor = [UIColor grayColor];
    
    //second
    _contactTimeStartBtn = [[UIButton alloc]initWithFrame:CGRectMake(10, 64+50+1+1, (self.view.bounds.size.width-25)*0.5, 50)];
    _contactTimeStartBtn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    _contactTimeStartBtn.titleLabel.font = [UIFont systemFontOfSize: 13.0];
    [_contactTimeStartBtn setTitle:@"联络时间" forState:UIControlStateNormal];
    [_contactTimeStartBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    _contactTimeStartBtn.tag = 3;
    [_contactTimeStartBtn addTarget:self action:@selector(showDataTime:) forControlEvents:UIControlEventTouchUpInside];
    
    _contactTimeStartLabel = [[UILabel alloc]initWithFrame:CGRectMake((self.view.bounds.size.width-25)*0.5 - 100, 64+50+1+1, 100, 50)];
    _contactTimeStartLabel.textAlignment = NSTextAlignmentRight;
    _contactTimeStartLabel.font = [UIFont systemFontOfSize:13.0];
    
    UILabel *secondLabel = [[UILabel alloc]initWithFrame:CGRectMake(10+(self.view.bounds.size.width-25)*0.5, 64+50+1+1, 15, 50)];
    secondLabel.text = @"至";
    secondLabel.font = [UIFont systemFontOfSize:13.0];
    
    _contactTimeEndBtn = [[UIButton alloc]initWithFrame:CGRectMake(15+(self.view.bounds.size.width-25)*0.5, 64+50+1+1, (self.view.bounds.size.width-25)*0.5, 50)];
    _contactTimeEndBtn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentRight;
    _contactTimeEndBtn.titleLabel.font = [UIFont systemFontOfSize: 13.0];
    [_contactTimeEndBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    _contactTimeEndBtn.tag = 4;
    [_contactTimeEndBtn addTarget:self action:@selector(showDataTime:) forControlEvents:UIControlEventTouchUpInside];
    
    UIView *secondLineView = [[UIView alloc]initWithFrame:CGRectMake(0, 64+50+50+1+1, self.view.bounds.size.width, 1)];
    secondLineView.backgroundColor = [UIColor grayColor];
    
    //third
    _appointmentTimeStartBtn = [[UIButton alloc]initWithFrame:CGRectMake(10, 64+50+50+1+1+1, (self.view.bounds.size.width-25)*0.5, 50)];
    _appointmentTimeStartBtn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    _appointmentTimeStartBtn.titleLabel.font = [UIFont systemFontOfSize: 13.0];
    [_appointmentTimeStartBtn setTitle:@"预约时间" forState:UIControlStateNormal];
    [_appointmentTimeStartBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    _appointmentTimeStartBtn.tag = 5;
    [_appointmentTimeStartBtn addTarget:self action:@selector(showDataTime:) forControlEvents:UIControlEventTouchUpInside];
    
    _appointmentTimeStarLabel = [[UILabel alloc]initWithFrame:CGRectMake((self.view.bounds.size.width-25)*0.5 - 100, 64+50+50+1+1+1, 100, 50)];
    _appointmentTimeStarLabel.textAlignment = NSTextAlignmentRight;
    _appointmentTimeStarLabel.font = [UIFont systemFontOfSize:13.0];
    
    UILabel *thirdLabel = [[UILabel alloc]initWithFrame:CGRectMake(10+(self.view.bounds.size.width-25)*0.5, 64+50+50+1+1+1, 15, 50)];
    thirdLabel.text = @"至";
    thirdLabel.font = [UIFont systemFontOfSize:13.0];
    
    _appointmentTimeEndBtn = [[UIButton alloc]initWithFrame:CGRectMake(15+(self.view.bounds.size.width-25)*0.5, 64+50+50+1+1+1, (self.view.bounds.size.width-25)*0.5, 50)];
    _appointmentTimeEndBtn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentRight;
    _appointmentTimeEndBtn.titleLabel.font = [UIFont systemFontOfSize: 13.0];
    [_appointmentTimeEndBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    _appointmentTimeEndBtn.tag = 6;
    [_appointmentTimeEndBtn addTarget:self action:@selector(showDataTime:) forControlEvents:UIControlEventTouchUpInside];
    
    UIView *thirdLineView = [[UIView alloc]initWithFrame:CGRectMake(0, 64+50+50+50+1+1, self.view.bounds.size.width, 1)];
    thirdLineView.backgroundColor = [UIColor grayColor];
    
    //fourth
    _resultBtn = [[UIButton alloc]initWithFrame:CGRectMake(10, 64+50+50+50+1+1+1, self.view.bounds.size.width, 50)];
    _resultBtn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    _resultBtn.titleLabel.font = [UIFont systemFontOfSize: 13.0];
    [_resultBtn setTitle:@"通话结果" forState:UIControlStateNormal];
    [_resultBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [_resultBtn addTarget:self action:@selector(talkReslut:) forControlEvents:UIControlEventTouchUpInside];
    
    _resultLabel = [[UILabel alloc]initWithFrame:CGRectMake(self.view.bounds.size.width - 100, 64+50+50+50+1+1+1, 60, 50)];
    _resultLabel.textAlignment = NSTextAlignmentRight;
    _resultLabel.font = [UIFont systemFontOfSize:13];
    
    
    UIView *fourthLineView = [[UIView alloc]initWithFrame:CGRectMake(0, 64+50+50+50+50+1+1+1, self.view.bounds.size.width, 1)];
    fourthLineView.backgroundColor = [UIColor grayColor];

    //fifth
    _salesStatusBtn = [[UIButton alloc]initWithFrame:CGRectMake(10, 64+50+50+50+50+1+1+1+1, self.view.bounds.size.width, 50)];
    _salesStatusBtn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    _salesStatusBtn.titleLabel.font = [UIFont systemFontOfSize: 13.0];
    [_salesStatusBtn setTitle:@"销售状态" forState:UIControlStateNormal];
    [_salesStatusBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [_salesStatusBtn addTarget:self action:@selector(salesStatus:) forControlEvents:UIControlEventTouchUpInside];
    
    _salesStatusLabel = [[UILabel alloc]initWithFrame:CGRectMake(self.view.bounds.size.width - 100, 64+50+50+50+50+1+1+1+1, 60, 50)];
    _salesStatusLabel.textAlignment = NSTextAlignmentRight;
    _salesStatusLabel.font = [UIFont systemFontOfSize:13];
    
    UIView *fifthLineView = [[UIView alloc]initWithFrame:CGRectMake(0, 64+50+50+50+50+50+1+1+1+1, self.view.bounds.size.width, 1)];
    fifthLineView.backgroundColor = [UIColor grayColor];
    
    //sixth
    _intentionProductBtn = [[UIButton alloc]initWithFrame:CGRectMake(10, 64+50+50+50+50+50+1+1+1+1+1, self.view.bounds.size.width, 50)];
    _intentionProductBtn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    _intentionProductBtn.titleLabel.font = [UIFont systemFontOfSize: 13.0];
    [_intentionProductBtn setTitle:@"意向产品" forState:UIControlStateNormal];
    [_intentionProductBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [_intentionProductBtn addTarget:self action:@selector(intentionProduct:) forControlEvents:UIControlEventTouchUpInside];
    
    _intentionProductLabel = [[UILabel alloc]initWithFrame:CGRectMake(self.view.bounds.size.width - 100, 64+50+50+50+50+50+1+1+1+1+1, 60, 50)];
    _intentionProductLabel.textAlignment = NSTextAlignmentRight;
    _intentionProductLabel.font = [UIFont systemFontOfSize:13];
    
    UIView *sixthLineView = [[UIView alloc]initWithFrame:CGRectMake(0, 64+50+50+50+50+50+50+1+1+1+1, self.view.bounds.size.width, 1)];
    sixthLineView.backgroundColor = [UIColor grayColor];
    
    _searchBtn = [[UIButton alloc]initWithFrame:CGRectMake(20, 64+50+50+50+50+50+50+1+1+1+1+20, self.view.bounds.size.width-40, heightBtn)];
    [_searchBtn setTitle:@"查询" forState:UIControlStateNormal];
    _searchBtn.backgroundColor = [UIColor colorWithRed:88/255.0 green:159/255.0 blue:223/255.0 alpha:1];
    _searchBtn.layer.cornerRadius=3.0f;
    [_searchBtn addTarget:self action:@selector(search) forControlEvents:UIControlEventTouchUpInside];

    [self.view addSubview:_createTimeStartBtn];
    [self.view addSubview:_createTimeStartLabel];
    [self.view addSubview:firstLabel];
    [self.view addSubview:_createTimeEndBtn];
    [self.view addSubview:firstLineView];
    
    [self.view addSubview:_contactTimeStartBtn];
    [self.view addSubview:_contactTimeStartLabel];
    [self.view addSubview:secondLabel];
    [self.view addSubview:_contactTimeEndBtn];
    [self.view addSubview:secondLineView];
    
    [self.view addSubview:_appointmentTimeStartBtn];
    [self.view addSubview:_appointmentTimeStarLabel];
    [self.view addSubview:_createTimeStartLabel];
    [self.view addSubview:thirdLabel];
    [self.view addSubview:_appointmentTimeEndBtn];
    [self.view addSubview:thirdLineView];
    
    [self.view addSubview:_resultBtn];
    [self.view addSubview:_resultLabel];
    [self.view addSubview:fourthLineView];
    
    
    [self.view addSubview:_salesStatusBtn];
    [self.view addSubview:_salesStatusLabel];
    [self.view addSubview:fifthLineView];
    
    [self.view addSubview:_intentionProductBtn];
    [self.view addSubview:_intentionProductLabel];
    [self.view addSubview:sixthLineView];
    
    [self.view addSubview:_searchBtn];
}
- (void)talkReslut:(UIButton *)btn
{
    TYAlertView *alertView = [TYAlertView alertViewWithTitle:@"通话结果" message:@""];
    
    [alertView addAction:[TYAlertAction actionWithTitle:@"号码错" style:TYAlertActionStyleDefault handler:^(TYAlertAction *action) {
        _resultLabel.text = @"号码错";
    }]];
    
    [alertView addAction:[TYAlertAction actionWithTitle:@"未接通" style:TYAlertActionStyleDefault handler:^(TYAlertAction *action) {
        _resultLabel.text = @"未接通";
    }]];
    
    [alertView addAction:[TYAlertAction actionWithTitle:@"考虑" style:TYAlertActionStyleDefault handler:^(TYAlertAction *action) {
        _resultLabel.text = @"考虑";
    }]];
    
    [alertView addAction:[TYAlertAction actionWithTitle:@"放弃" style:TYAlertActionStyleDefault handler:^(TYAlertAction *action) {
        _resultLabel.text = @"放弃";
    }]];
    
    [alertView addAction:[TYAlertAction actionWithTitle:@"取消" style:TYAlertActionStyleCancle handler:^(TYAlertAction *action) {
        NSLog(@"取消");
    }]];
    
    TYAlertController *alertController = [TYAlertController alertControllerWithAlertView:alertView preferredStyle:TYAlertControllerStyleActionSheet];
    [self presentViewController:alertController animated:YES completion:nil];

}

- (void)salesStatus:(UIButton *)btn
{
    TYAlertView *alertView = [TYAlertView alertViewWithTitle:@"销售状态" message:@""];
    
    [alertView addAction:[TYAlertAction actionWithTitle:@"全部" style:TYAlertActionStyleDefault handler:^(TYAlertAction *action) {
        _salesStatusLabel.text = @"全部";
    }]];
    
    [alertView addAction:[TYAlertAction actionWithTitle:@"未到访" style:TYAlertActionStyleDefault handler:^(TYAlertAction *action) {
        _salesStatusLabel.text = @"未到访";
    }]];
    
    [alertView addAction:[TYAlertAction actionWithTitle:@"已到访" style:TYAlertActionStyleDefault handler:^(TYAlertAction *action) {
        _salesStatusLabel.text = @"已到访";
    }]];
    
    [alertView addAction:[TYAlertAction actionWithTitle:@"已成交" style:TYAlertActionStyleDefault handler:^(TYAlertAction *action) {
        _salesStatusLabel.text = @"已成交";
    }]];
    
    [alertView addAction:[TYAlertAction actionWithTitle:@"取消" style:TYAlertActionStyleCancle handler:^(TYAlertAction *action) {
        NSLog(@"取消");
    }]];
    
    TYAlertController *alertController = [TYAlertController alertControllerWithAlertView:alertView preferredStyle:TYAlertControllerStyleActionSheet];
    [self presentViewController:alertController animated:YES completion:nil];

}

- (void)intentionProduct:(UIButton *)btn
{
    TYAlertView *alertView = [TYAlertView alertViewWithTitle:@"意向产品" message:@""];
    
    [alertView addAction:[TYAlertAction actionWithTitle:@"小高层" style:TYAlertActionStyleDefault handler:^(TYAlertAction *action) {
        _intentionProductLabel.text = @"小高层";
    }]];
    
    [alertView addAction:[TYAlertAction actionWithTitle:@"高层" style:TYAlertActionStyleDefault handler:^(TYAlertAction *action) {
        _intentionProductLabel.text = @"高层";
    }]];
    
    [alertView addAction:[TYAlertAction actionWithTitle:@"别墅" style:TYAlertActionStyleDefault handler:^(TYAlertAction *action) {
        _intentionProductLabel.text = @"别墅";
    }]];
    
    [alertView addAction:[TYAlertAction actionWithTitle:@"公寓" style:TYAlertActionStyleDefault handler:^(TYAlertAction *action) {
        _intentionProductLabel.text = @"公寓";
    }]];
    [alertView addAction:[TYAlertAction actionWithTitle:@"商铺" style:TYAlertActionStyleDefault handler:^(TYAlertAction *action) {
        _intentionProductLabel.text = @"铺";
    }]];
    [alertView addAction:[TYAlertAction actionWithTitle:@"写字楼" style:TYAlertActionStyleDefault handler:^(TYAlertAction *action) {
        _intentionProductLabel.text = @"写字楼";
    }]];
    [alertView addAction:[TYAlertAction actionWithTitle:@"车位" style:TYAlertActionStyleDefault handler:^(TYAlertAction *action) {
        _intentionProductLabel.text = @"车位";
    }]];
    [alertView addAction:[TYAlertAction actionWithTitle:@"洋房" style:TYAlertActionStyleDefault handler:^(TYAlertAction *action) {
        _intentionProductLabel.text = @"洋房";
    }]];
    [alertView addAction:[TYAlertAction actionWithTitle:@"叠墅" style:TYAlertActionStyleDefault handler:^(TYAlertAction *action) {
        _intentionProductLabel.text = @"叠墅";
    }]];
    
    [alertView addAction:[TYAlertAction actionWithTitle:@"取消" style:TYAlertActionStyleCancle handler:^(TYAlertAction *action) {
        NSLog(@"取消");
    }]];
    
    TYAlertController *alertController = [TYAlertController alertControllerWithAlertView:alertView preferredStyle:TYAlertControllerStyleActionSheet];
    [self presentViewController:alertController animated:YES completion:nil];
}

- (void)showDataTime:(UIButton *)btn
{
    STPickerDate *pickerDate = [[STPickerDate alloc]init];
    [pickerDate setDelegate:self];
    pickerDate.tagNumber = btn.tag;
    [pickerDate show];
}

- (void)search
{
    NSLog(@"search");
}

#pragma mark -delegate
- (void)pickerDate:(STPickerDate *)pickerDate year:(NSInteger)year month:(NSInteger)month day:(NSInteger)day tagInt:(NSInteger)tag
{
    NSString *text = [NSString stringWithFormat:@"%ld-%ld-%ld", (long)year, (long)month, (long)day];
    if (tag == 1) {
        _createTimeStartLabel.text = text;
    }else if (tag == 2){
        [_createTimeEndBtn setTitle:text forState:UIControlStateNormal];
    }else if (tag == 3){
        _contactTimeStartLabel.text = text;
    }else if (tag == 4){
        [_contactTimeEndBtn setTitle:text forState:UIControlStateNormal];
    }else if (tag == 5){
       _appointmentTimeStarLabel.text = text;
    }else if (tag == 6){
        [_appointmentTimeEndBtn setTitle:text forState:UIControlStateNormal];
    }
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
