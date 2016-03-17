//
//  VideoDetailModel.h
//  逗你乐
//
//  Created by tarena on 15/11/10.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "BaseModel.h"

@class VideoDataModel,VideoDataRecent_CommentsModel;
@interface VideoDetailModel : BaseModel

@property (nonatomic, assign) BOOL has_more;

@property (nonatomic, copy) NSString *message;

@property (nonatomic, assign) long long group_id;

@property (nonatomic, strong) VideoDataModel *data;

@property (nonatomic, assign) BOOL new_comment;

@property (nonatomic, assign) NSInteger total_number;

@end
@interface VideoDataModel : NSObject

@property (nonatomic, strong) NSArray *top_comments;

@property (nonatomic, strong) NSArray<VideoDataRecent_CommentsModel *> *recent_comments;

@end

@interface VideoDataRecent_CommentsModel : NSObject

@property (nonatomic, copy) NSString *user_name;

@property (nonatomic, copy) NSString *user_profile_url;

@property (nonatomic, assign) NSInteger status;

@property (nonatomic, assign) NSInteger is_digg;

@property (nonatomic, assign) long long group_id;

@property (nonatomic, assign) NSInteger user_bury;

@property (nonatomic, assign) long long user_id;

@property (nonatomic, assign) NSInteger create_time;

@property (nonatomic, assign) NSInteger digg_count;

@property (nonatomic, assign) BOOL user_verified;

@property (nonatomic, assign) NSInteger bury_count;

@property (nonatomic, copy) NSString *avatar_url;

@property (nonatomic, copy) NSString *platform_id;

@property (nonatomic, assign) long long id1;

@property (nonatomic, assign) long long comment_id;

@property (nonatomic, copy) NSString *platform;

@property (nonatomic, assign) NSInteger user_digg;

@property (nonatomic, copy) NSString *user_profile_image_url;

@property (nonatomic, copy) NSString *text;

@property (nonatomic, copy) NSString *desc;

@end

