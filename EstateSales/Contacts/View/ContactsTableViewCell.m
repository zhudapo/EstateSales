//
//  ContactsTableViewCell.m
//  EstateSales
//
//  Created by Jose Zhu on 16/6/3.
//  Copyright © 2016年 Jose Zhu. All rights reserved.
//

#import "ContactsTableViewCell.h"

@interface ContactsTableViewCell()

@property (nonatomic , strong) UILabel *firstName;
@property (nonatomic , strong) UILabel *secondName;
@property (nonatomic , strong) UILabel *phoneNumber;
@property (nonatomic , strong) UILabel *callTime;
@property (nonatomic , strong) UILabel *remark;
@property (nonatomic , strong) UILabel *remarkDetail;
@property (nonatomic , strong) UIButton *visitStatus;
@property (nonatomic , strong) UIButton *callSatuts;
@property (nonatomic , strong) UIButton *callImage;

@end

@implementation ContactsTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        _firstName = [[UILabel alloc] init];
        _firstName.font = [UIFont systemFontOfSize:13];
        [self.contentView addSubview:_firstName];
        
        _secondName = [[UILabel alloc] init];
        _secondName.font = [UIFont systemFontOfSize:13];
        _secondName.textColor = [UIColor grayColor];
        //_secondName.backgroundColor = [UIColor greenColor];
        [self.contentView addSubview:_secondName];
        
        _phoneNumber = [[UILabel alloc]init];
        _phoneNumber.font = [UIFont systemFontOfSize:13];
        _phoneNumber.textColor = [UIColor grayColor];
        //_phoneNumber.backgroundColor = [UIColor orangeColor];
        [self.contentView addSubview:_phoneNumber];
        
        _callTime = [[UILabel alloc]init];
        _callTime.font = [UIFont systemFontOfSize:13];
        _callTime.textColor = [UIColor grayColor];
        //_callTime.backgroundColor = [UIColor brownColor];
        [self.contentView addSubview:_callTime];
        
        _remark = [[UILabel alloc]init];
        _remark.font = [UIFont systemFontOfSize:13];
        _remark.textColor = [UIColor grayColor];
        //_remark.backgroundColor = [UIColor lightGrayColor];
        [self.contentView addSubview:_remark];
        
        _remarkDetail = [[UILabel alloc]init];
        _remarkDetail.font = [UIFont systemFontOfSize:13];
        _remarkDetail.textColor = [UIColor grayColor];
        //_remarkDetail.backgroundColor = [UIColor cyanColor];
        [self.contentView addSubview:_remarkDetail];
        
        _visitStatus = [[UIButton alloc]init];
        _visitStatus.titleLabel.font = [UIFont systemFontOfSize:13];
        _visitStatus.backgroundColor = [UIColor colorWithRed:111/255.0 green:172/255.0 blue:226/255.0 alpha:1];
        _visitStatus.layer.cornerRadius=8.0f;
        [self.contentView addSubview:_visitStatus];
        
        _callSatuts = [[UIButton alloc]init];
        _callSatuts.titleLabel.font = [UIFont systemFontOfSize:13];
        _callSatuts.backgroundColor = [UIColor colorWithRed:111/255.0 green:172/255.0 blue:226/255.0 alpha:1];
        _callSatuts.layer.cornerRadius=8.0f;
        [self.contentView addSubview:_callSatuts];
        
        _callImage = [[UIButton alloc]init];
        [_callImage addTarget:self action:@selector(callSomeOne) forControlEvents:UIControlEventTouchUpInside];
        //_callImage.backgroundColor = [UIColor grayColor];
        [self.contentView addSubview:_callImage];
    }
    return self;
}


- (void)layoutSubviews
{
    [super layoutSubviews];
    _firstName.frame = CGRectMake(15, 5, 50, 20);
    _secondName.frame = CGRectMake(130, 5, 30, 20);
    _visitStatus.frame = CGRectMake(self.bounds.size.width - 140, 5, 50, 20);
    _callSatuts.frame = CGRectMake(self.bounds.size.width - 70, 5, 50, 20);
    
    _phoneNumber.frame = CGRectMake(15, 35, 90, 10);
    _callTime.frame = CGRectMake(130, 35, 80, 10);
    
    _remark.frame = CGRectMake(15, 55, 30, 20);
    _remarkDetail.frame = CGRectMake(47, 55, self.bounds.size.width - 90, 20);
    
    _callImage.frame = CGRectMake(self.bounds.size.width -60, 30, 30, 30);
}

- (void)setContents
{
    _firstName.text = @"朱";
    _secondName.text = @"先生";
    [_visitStatus setTitle:@"未到访" forState:UIControlStateNormal];
    [_callSatuts setTitle:@"号码错" forState:UIControlStateNormal];
    _phoneNumber.text = @"18506922901";
    _callTime.text = @"2016-06-03";
    _remark.text = @"备注:";
    _remarkDetail.text = @"暂时写死吧，到时候我换掉。";
    [_callImage setImage:[UIImage imageNamed:@"add_friend_icon_contacts"] forState:UIControlStateNormal];
}

- (void)setContents:(NSArray *)array
{
    _firstName.text = array[0];
    _secondName.text = array[1];
    [_visitStatus setTitle:array[2] forState:UIControlStateNormal];
    [_callSatuts setTitle:array[3] forState:UIControlStateNormal];
    _phoneNumber.text = array[4];
    _callTime.text = array[5];
    _remark.text = array[6];
    _remarkDetail.text = array[7];
    [_callImage setImage:[UIImage imageNamed:array[8]] forState:UIControlStateNormal];
}

- (void)callSomeOne
{
    NSLog(@"我在呼叫了");
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}

@end
