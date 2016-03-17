//
//  TableViewCell.m
//  逗你乐
//
//  Created by tarena on 15/11/11.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "TableViewCell.h"

@implementation TableViewCell
//用户头像
- (UIImageView *)userIcoIV {
	if(_userIcoIV == nil) {
		_userIcoIV = [[UIImageView alloc] init];
		
		_userIcoIV.layer.bounds = CGRectMake(0, 0, 30, 30);
		_userIcoIV.layer.position = CGPointMake(5, 5);
		_userIcoIV.layer.anchorPoint = CGPointMake(0, 0);
		_userIcoIV.layer.cornerRadius = _userIcoIV.bounds.size.width / 2.0;
		_userIcoIV.layer.masksToBounds = YES;
		
		[self.contentView.layer addSublayer:_userIcoIV.layer];
		
		[self.contentView addSubview:_userIcoIV];
		
	}
	return _userIcoIV;
}
//用户名
- (UILabel *)userNameLb {
	if(_userNameLb == nil) {
		_userNameLb = [[UILabel alloc] init];
		_userNameLb.lineBreakMode = NSLineBreakByTruncatingMiddle;
		[self.contentView addSubview:_userNameLb];
		_userNameLb.font = [UIFont systemFontOfSize:12];
		_userNameLb.textColor = [UIColor lightGrayColor];
		[_userNameLb mas_makeConstraints:^(MASConstraintMaker *make) {
			
			make.centerY.mas_equalTo(self.userIcoIV.mas_centerY);
			make.left.mas_equalTo(_userIcoIV.mas_right).mas_equalTo(5);
			make.right.mas_equalTo(5);
			
		}];
		
	}
	return _userNameLb;
}
//标题
- (UILabel *)titleLb {
	if(_titleLb == nil) {
		_titleLb = [[UILabel alloc] init];
		
		_titleLb.numberOfLines = 2;
		_titleLb.lineBreakMode = NSLineBreakByTruncatingMiddle;
		_titleLb.font = [UIFont systemFontOfSize:15];
		[self.contentView addSubview:_titleLb];
		[_titleLb mas_makeConstraints:^(MASConstraintMaker *make) {
			
			make.top.left.mas_equalTo(self.userIcoIV.mas_bottom).mas_equalTo(5);
			make.right.mas_equalTo(-5);
		}];
		
	}
	return _titleLb;
}
//点赞
- (UILabel *)likeLb {
	if(_likeLb == nil) {
		_likeLb = [[UILabel alloc] init];
		
		UIImageView *like = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"digupicon_comment"]];
		
		[self.contentView addSubview:like];
		_likeLb.font = [UIFont systemFontOfSize:12];
		_likeLb.textColor = [UIColor lightGrayColor];
		[self.contentView addSubview:_likeLb];
		
		[like mas_makeConstraints:^(MASConstraintMaker *make) {
			
			make.left.mas_equalTo(20);
			make.centerY.mas_equalTo(_likeLb);
			make.size.mas_equalTo(CGSizeMake(20, 20));
		}];
		
		
		[_likeLb mas_makeConstraints:^(MASConstraintMaker *make) {
			
			make.left.mas_equalTo(like.mas_right).mas_equalTo(5);
			make.centerY.mas_equalTo(self.dislikeLb);
			make.width.mas_lessThanOrEqualTo(50);
			make.width.mas_greaterThanOrEqualTo(10);
			
		}];
		
	}
	return _likeLb;
}
//不喜欢
- (UILabel *)dislikeLb {
	if(_dislikeLb == nil) {
		_dislikeLb = [[UILabel alloc] init];
		
		UIImageView *dis = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"digdownicon_textpage"]];
		[self.contentView addSubview:dis];
		_dislikeLb.font = [UIFont systemFontOfSize:12];
		_dislikeLb.textColor = [UIColor lightGrayColor];
		[self.contentView addSubview:_dislikeLb];
		
		[dis mas_makeConstraints:^(MASConstraintMaker *make) {
			
			make.size.mas_equalTo(CGSizeMake(30, 30));
			make.right.mas_equalTo(_dislikeLb.mas_left).mas_equalTo(-5);
			make.bottom.mas_equalTo(-2);
		}];
		
		
		[_dislikeLb mas_makeConstraints:^(MASConstraintMaker *make) {
			
			make.right.mas_equalTo(self.mas_centerX).mas_equalTo(-10);
			make.centerY.mas_equalTo(dis);
			make.width.mas_lessThanOrEqualTo(50);
			make.width.mas_greaterThanOrEqualTo(10);
		}];
		
		
		
	}
	return _dislikeLb;
}
//评论
- (UILabel *)commentLb {
	if(_commentLb == nil) {
		_commentLb = [[UILabel alloc] init];
		
		UIImageView *com = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"commenticon_textpage"]];
		[self.contentView addSubview:com];
		[com mas_makeConstraints:^(MASConstraintMaker *make) {
			
			make.bottom.mas_equalTo(-2);
			make.left.mas_equalTo(self.mas_centerX).mas_equalTo(10);
			make.size.mas_equalTo(CGSizeMake(30, 30));
		}];
		
		_commentLb.font = [UIFont systemFontOfSize:12];
		_commentLb.textColor = [UIColor lightGrayColor];
		[self.contentView addSubview:_commentLb];
		[_commentLb mas_makeConstraints:^(MASConstraintMaker *make) {
			
			make.centerY.mas_equalTo(com.mas_centerY);
			make.left.mas_equalTo(com.mas_right).mas_equalTo(5);
			make.width.mas_lessThanOrEqualTo(30);
			make.width.mas_greaterThanOrEqualTo(10);
		}];
		
		
	}
	return _commentLb;
}
//转发
- (UILabel *)shareLb {
	if(_shareLb == nil) {
		_shareLb = [[UILabel alloc] init];
	}
	
	UIImageView *sh = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"moreicon_textpage"]];
	[self.contentView addSubview:sh];
	_shareLb.font = [UIFont systemFontOfSize:12];
	_shareLb.textColor = [UIColor lightGrayColor];
	[self.contentView addSubview:_shareLb];
	[sh mas_makeConstraints:^(MASConstraintMaker *make) {
		
		make.size.mas_equalTo(CGSizeMake(30,30));
		make.bottom.mas_equalTo(-2);
		make.right.mas_equalTo(_shareLb.mas_left).mas_equalTo(5);
	}];
	
	
	[_shareLb mas_makeConstraints:^(MASConstraintMaker *make) {
		
		make.centerY.mas_equalTo(sh.mas_centerY);
		make.right.mas_equalTo(-25);
		make.width.mas_lessThanOrEqualTo(50);
		make.width.mas_greaterThanOrEqualTo(10);
		
		
	}];
	
	
	return _shareLb;
}
/** 是不是热点*/
- (void)setHotTopic:(BOOL)hotTopic{
	
	_hotTopic = hotTopic;
	if (hotTopic) {
		UIImageView *imgV = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"hoticon_textpage"]];
		[self.contentView addSubview:imgV];
		[imgV mas_makeConstraints:^(MASConstraintMaker *make) {
			make.right.top.mas_equalTo(0);
		}];
	}
	
}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
