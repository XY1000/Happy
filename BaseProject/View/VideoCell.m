//
//  VideoCell.m
//  逗你乐
//
//  Created by tarena on 15/11/9.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "VideoCell.h"
#import "VideoViewModel.h"


@interface VideoCell ()<AVPlayerViewControllerDelegate>
@property (nonatomic,strong)AVPlayerViewController *vc;
@end


@implementation VideoCell


//播放源
- (NSURL *)playSource {
	if(_playSource == nil) {
		_playSource = [[NSURL alloc] init];
	}
	return _playSource;
}
//播放按钮
- (UIButton *)playBtn {
	if(_playBtn == nil) {
		_playBtn = [[UIButton alloc] init];
		[_playBtn setImage:[UIImage imageNamed:@"play"] forState:(UIControlStateNormal)];
		_playBtn.alpha = 0.7;
		[self.videoIV addSubview:_playBtn];
		[_playBtn mas_makeConstraints:^(MASConstraintMaker *make) {
			
			make.size.mas_equalTo(CGSizeMake(50,50));
			make.center.mas_equalTo(0);
			
		}];
	
		//按钮点击事件
		[_playBtn bk_addEventHandler:^(id sender) {
			_playBtn.selected = !_playBtn.selected;
			
			AVPlayer *player = [AVPlayer playerWithURL:self.playSource];
			_vc = [ VideoCell standAVC];
			_vc.player = player;
			if ( _playBtn.selected) {
				
					[_vc.player play];
			}else{
				[_vc.player pause];
				
			}
			
			[self.videoIV addSubview:_vc.view];
		
			[_vc.view mas_makeConstraints:^(MASConstraintMaker *make) {
				
				make.edges.mas_equalTo(0);
				
				
			}];
		
			_vc.delegate = self;
			
		} forControlEvents:(UIControlEventTouchUpInside)];
		
	}
	return _playBtn;
}
- (void)prepareForReuse{
	[super prepareForReuse];
	//判断当前cell是否有播放，如果有则删除
	if ([VideoCell standAVC].view.superview == self.videoIV) {
		[[VideoCell standAVC].view removeFromSuperview];
		[VideoCell standAVC].player = nil;
	}
	
}
//视频
- (UIImageView *)videoIV {
	if(_videoIV == nil) {
		_videoIV = [[UIImageView alloc] init];
		[self.contentView addSubview:_videoIV];
		[_videoIV mas_makeConstraints:^(MASConstraintMaker *make) {
			
			make.width.mas_equalTo(kWindowW*0.9);
			make.top.mas_equalTo(self.titleLb.mas_bottom).mas_equalTo(5);
			make.bottom.mas_equalTo(self.commentLb.mas_top).mas_equalTo(5);
			make.centerX.mas_equalTo(0);
			make.centerY.mas_equalTo(self.mas_centerY).mas_equalTo(10);
			make.height.mas_equalTo(150);
		}];
	
		self.playBtn.hidden = NO;
		_videoIV.userInteractionEnabled = YES;
	}
	return _videoIV;
}
//播放次数
- (UILabel *)playCountLb {
	if(_playCountLb == nil) {
		_playCountLb = [[UILabel alloc] init];
		
		[self.playView addSubview:_playCountLb];
		_playCountLb.font = [UIFont systemFontOfSize:12];
		_playCountLb.textColor = [UIColor orangeColor];
		_playCountLb.textAlignment = NSTextAlignmentRight;
		[_playCountLb mas_makeConstraints:^(MASConstraintMaker *make) {
			
			make.left.mas_equalTo(5);
			make.centerY.mas_equalTo(0);
			make.width.mas_lessThanOrEqualTo(100);
			make.width.mas_greaterThanOrEqualTo(10);
			
		}];
		
		UILabel *lb = [[UILabel alloc]init];
		lb.text = @"次播放";
		lb.font = [UIFont systemFontOfSize:12];
		lb.textColor = [UIColor whiteColor];
		[self.playView addSubview:lb];
		[lb mas_makeConstraints:^(MASConstraintMaker *make) {
			
			make.centerY.mas_equalTo(0);
			make.left.mas_equalTo(_playCountLb.mas_right).mas_equalTo(0);
			make.width.mas_equalTo(50);
		}];
		
		
		
	}
	return _playCountLb;
}
//时长
- (UILabel *)durationLb {
	if(_durationLb == nil) {
		_durationLb = [[UILabel alloc] init];
		[self.playView addSubview:_durationLb];
		_durationLb.font=[UIFont systemFontOfSize:12];
		_durationLb.textColor = [UIColor whiteColor];
		_durationLb.textAlignment = NSTextAlignmentRight;
		[_durationLb mas_makeConstraints:^(MASConstraintMaker *make) {
			make.centerY.mas_equalTo(0);
			make.width.mas_equalTo(50);
			make.right.mas_equalTo(-5);
		}];
	}
	return _durationLb;
}
//显示时长和播放次数
- (UIView *)playView {
	if(_playView == nil) {
		_playView = [[UIView alloc] init];
		[self.videoIV addSubview:_playView];
		_playView.alpha = 0.5;
		_playView.backgroundColor = [UIColor blackColor];
		[_playView mas_makeConstraints:^(MASConstraintMaker *make) {
			
			make.left.bottom.right.mas_equalTo(0);
			make.height.mas_equalTo(30);
		}];
	}
	return _playView;
}


- (void)awakeFromNib {
    // Initialization code
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}


//单例创建
+ (AVPlayerViewController *)standAVC {
	static AVPlayerViewController *avc = nil;
	static dispatch_once_t onceToken;
	dispatch_once(&onceToken, ^{
		avc = [AVPlayerViewController new];
	});
	return avc;
}





@end
