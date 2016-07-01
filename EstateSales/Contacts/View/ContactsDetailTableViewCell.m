//
//  ContactsDetailTableViewCell.m
//  EstateSales
//
//  Created by Jose Zhu on 16/6/30.
//  Copyright © 2016年 Jose Zhu. All rights reserved.
//

#import "ContactsDetailTableViewCell.h"

@interface ContactsDetailTableViewCell()

@property (nonatomic , strong) UILabel *callTime;
@property (nonatomic , strong) UILabel *talkTime;
@property (nonatomic , strong) UILabel *loginName;
@property (nonatomic , strong) UIButton *callType;
@property (nonatomic , strong) UIButton *remark;

@end


@implementation ContactsDetailTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        _callTime = [[UILabel alloc]init];
        _callTime.font = [UIFont systemFontOfSize:13];
        _callTime.textColor = [UIColor grayColor];
        [self.contentView addSubview:_callTime];
        
        _talkTime = [[UILabel alloc]init];
        _talkTime.font = [UIFont systemFontOfSize:13];
        _talkTime.textColor = [UIColor grayColor];
        [self.contentView addSubview:_talkTime];
        
        _loginName = [[UILabel alloc]init];
        _loginName.font = [UIFont systemFontOfSize:13];
        _loginName.textColor = [UIColor grayColor];
        [self.contentView addSubview:_loginName];
        
        _callType = [[UIButton alloc]init];
        _callType.titleLabel.font = [UIFont systemFontOfSize:13];
        //_callType.backgroundColor = [UIColor colorWithRed:111/255.0 green:172/255.0 blue:226/255.0 alpha:1];
        _callType.layer.cornerRadius=8.0f;
        [self.contentView addSubview:_callType];
        
        _remark = [[UIButton alloc]init];
        _remark.titleLabel.font = [UIFont systemFontOfSize:13];
        _remark.backgroundColor = [UIColor colorWithRed:111/255.0 green:172/255.0 blue:226/255.0 alpha:1];
        _remark.layer.cornerRadius=8.0f;
        [self.contentView addSubview:_remark];
    }
    return self;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    _callType.frame = CGRectMake(10, 15, 80, 50);
    _callTime.frame = CGRectMake(110, 20, 150, 10);
    _talkTime.frame = CGRectMake(110, 50, 80, 10);
    _remark.frame = CGRectMake(self.bounds.size.width - 100, 17, 50, 20);
    _loginName.frame = CGRectMake(self.bounds.size.width - 105, 47, 50, 20);
}

- (void)setContents:(NSArray *)array
{
    [_callType setImage:[UIImage imageNamed:array[4]] forState:UIControlStateNormal];
    _callTime.text = array[0];
    _talkTime.text = array[1];
    [_remark setTitle:array[2] forState:UIControlStateNormal];
    _loginName.text = array[3];
    
}



- (void)awakeFromNib {
    [super awakeFromNib];
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    
}

@end
