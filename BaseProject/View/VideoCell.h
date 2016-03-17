//
//  VideoCell.h
//  逗你乐
//
//  Created by tarena on 15/11/9.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVKit/AVKit.h>
#import <AVFoundation/AVFoundation.h>
#import "TableViewCell.h"
@interface VideoCell :TableViewCell
/** 播放按钮*/
@property (nonatomic,strong)UIButton *playBtn;
/** 视频*/
@property (nonatomic,strong)UIImageView *videoIV;
/** 播放次数*/
@property (nonatomic,strong)UILabel *playCountLb;
/** 时长*/
@property (nonatomic,strong)UILabel *durationLb;
/** 显示时长和播放次数*/
@property (nonatomic,strong)UIView *playView;

/** 播放地址*/
@property (nonatomic,strong)NSURL *playSource;



@end
