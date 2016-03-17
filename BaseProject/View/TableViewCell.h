//
//  TableViewCell.h
//  逗你乐
//
//  Created by tarena on 15/11/11.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TableViewCell : UITableViewCell
/** 用户头像*/
@property (nonatomic,strong)UIImageView *userIcoIV;
/** 用户名*/
@property (nonatomic,strong)UILabel *userNameLb;
/** 标题*/
@property (nonatomic,strong)UILabel *titleLb;
/** 赞*/
@property (nonatomic,strong)UILabel *likeLb;
/** 不喜欢*/
@property (nonatomic,strong)UILabel *dislikeLb;
/** 评论*/
@property (nonatomic,strong)UILabel *commentLb;
/** 转发*/
@property (nonatomic,strong)UILabel *shareLb;
/** 是不是热点*/
@property (nonatomic,assign)BOOL hotTopic;
@end
