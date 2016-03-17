//
//  VideoDetailCell.h
//  逗你乐
//
//  Created by tarena on 15/11/10.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "VideoCell.h"
@interface VideoDetailCell : UITableViewCell

/** 头像*/
@property (nonatomic,strong)UIImageView *iconIV;
/** 名字*/
@property (nonatomic,strong)UILabel *nameLb;
/** 内容*/
@property (nonatomic,strong)UILabel *textLb;
/** 赞*/
@property (nonatomic,strong)UILabel *favourLb;



@end
