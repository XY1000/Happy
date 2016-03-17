//
//  VideoDetailCell.m
//  逗你乐
//
//  Created by tarena on 15/11/10.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "VideoDetailCell.h"

@implementation VideoDetailCell
/** 头像*/
- (UIImageView *)iconIV {
	if(_iconIV == nil) {
		_iconIV = [[UIImageView alloc] init];
		_iconIV.layer.cornerRadius = _iconIV.bounds.size.width / 2.0;
		_iconIV.layer.masksToBounds = YES;
		[self.contentView.layer addSublayer:_iconIV.layer];
		[self.contentView addSubview:_iconIV];
		[_iconIV mas_makeConstraints:^(MASConstraintMaker *make) {
			
			make.size.mas_equalTo(CGSizeMake(30, 30));
			make.top.left.mas_equalTo(5);
		}];
		
		
	}
	return _iconIV;
}
/** 名字*/
- (UILabel *)nameLb {
	if(_nameLb == nil) {
		_nameLb = [[UILabel alloc] init];
		
		[self.contentView addSubview:_nameLb];
		_nameLb.font = [UIFont systemFontOfSize:12];
		_nameLb.textColor = [UIColor lightGrayColor];
		[_nameLb mas_makeConstraints:^(MASConstraintMaker *make) {
			
			make.centerY.mas_equalTo(self.iconIV.mas_centerY);
			make.left.mas_equalTo(_iconIV.mas_right).mas_equalTo(5);
			make.right.mas_equalTo(5);
			
		}];
	}
	return _nameLb;
}
/** 内容*/
- (UILabel *)textLb {
	if(_textLb == nil) {
		_textLb = [[UILabel alloc] init];
		_textLb.numberOfLines = 0;
		_textLb.font = [UIFont systemFontOfSize:15];
		[self.contentView addSubview:_textLb];
		
		[_textLb mas_makeConstraints:^(MASConstraintMaker *make) {
			
			make.leftMargin.mas_equalTo(self.nameLb.mas_leftMargin);
			make.right.mas_equalTo(-5);
			make.top.mas_equalTo(self.nameLb.mas_bottom).mas_equalTo(5);
			make.bottom.mas_equalTo(5);
		}];
	}
	return _textLb;
}
/** 赞*/
- (UILabel *)favourLb {
	if(_favourLb == nil) {
		_favourLb = [[UILabel alloc] init];
		_favourLb.font = [UIFont systemFontOfSize:12];
		_favourLb.textColor = [UIColor lightGrayColor];
		_favourLb.textAlignment = NSTextAlignmentCenter;
		[self.contentView addSubview:_favourLb];
		[_favourLb mas_makeConstraints:^(MASConstraintMaker *make) {
			
			make.right.mas_equalTo(-5);
			make.centerY.mas_equalTo(self.iconIV.mas_centerY);
			make.width.mas_lessThanOrEqualTo(30);
			make.width.mas_greaterThanOrEqualTo(10);
		}];
		UIImageView *like = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"digupicon_comment"]];
		
		[self.contentView addSubview:like];
	
		[like mas_makeConstraints:^(MASConstraintMaker *make) {
		
			make.centerY.mas_equalTo(_favourLb.mas_centerY);
			make.right.mas_equalTo(_favourLb.mas_left).mas_equalTo(-5);
			make.size.mas_equalTo(CGSizeMake(20, 20));
			
		}];
		
		
		
	}
	return _favourLb;
}


- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
