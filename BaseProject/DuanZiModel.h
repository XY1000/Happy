//
//  DuanZiModel.h
//  逗你乐
//
//  Created by tarena on 15/11/9.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "BaseModel.h"

@class DataModel,DataDataModel,Data2GroupModel,Data2GroupLarge_CoverModel,Data2GroupLarge_coverUrl_ListModel,Data2Group480P_VideoModel,Data2Group480Url_ListModel,Data2GroupOrigin_VideoModel,Data2GroupOrign_videoUrl_ListModel,Data2GroupNeihan_Hot_LinkModel,Data2GroupActivityModel,Data2Group720P_VideoModel,Data2Group720Url_ListModel,Data2Group360P_VideoModel,Data2Group360Url_ListModel,Data2GroupMedium_CoverModel,Data2GroupMediumUrl_ListModel,Data2GroupUserModel,Data2GroupDislike_ReasonModel,Data2CommentsModel;
@interface DuanZiModel : BaseModel

@property (nonatomic, copy) NSString *message;

@property (nonatomic, strong) DataModel *data;

@end
@interface DataModel : NSObject

@property (nonatomic, assign) BOOL has_more;

@property (nonatomic, assign) NSInteger min_time;

@property (nonatomic, strong) NSArray<DataDataModel *> *data;

@property (nonatomic, assign) CGFloat max_time;

@property (nonatomic, copy) NSString *tip;

@end

@interface DataDataModel : NSObject

@property (nonatomic, strong) Data2GroupModel *group;

@property (nonatomic, assign) NSInteger online_time;

@property (nonatomic, assign) NSInteger type;

@property (nonatomic, strong) NSArray<Data2CommentsModel *> *comments;

@property (nonatomic, assign) NSInteger display_time;

@end

@interface Data2GroupModel : NSObject

@property (nonatomic, assign) NSInteger user_favorite;

@property (nonatomic, strong) Data2GroupUserModel *user;

@property (nonatomic, copy) NSString *publish_time;

@property (nonatomic, copy) NSString *uri;

@property (nonatomic, assign) long long id1;

@property (nonatomic, strong) Data2GroupOrigin_VideoModel *origin_video;

@property (nonatomic, assign) NSInteger play_count;

@property (nonatomic, assign) long long group_id;

@property (nonatomic, assign) BOOL category_visible;

@property (nonatomic, copy) NSString *title;

@property (nonatomic, copy) NSString *flash_url;

@property (nonatomic, strong) Data2GroupNeihan_Hot_LinkModel *neihan_hot_link;

@property (nonatomic, assign) NSInteger user_repin;

@property (nonatomic, copy) NSString *cover_image_uri;

@property (nonatomic, copy) NSString *status_desc;

@property (nonatomic, assign) NSInteger status;

@property (nonatomic, strong) NSArray<Data2GroupDislike_ReasonModel *> *dislike_reason;

@property (nonatomic, assign) NSInteger repin_count;

@property (nonatomic, copy) NSString *cover_image_url;

@property (nonatomic, assign) NSInteger digg_count;

@property (nonatomic, assign) NSInteger share_count;

@property (nonatomic, assign) NSInteger type;

@property (nonatomic, assign) NSInteger video_width;

@property (nonatomic, copy) NSString *neihan_hot_start_time;

@property (nonatomic, assign) NSInteger is_video;

@property (nonatomic, assign) NSInteger has_hot_comments;

@property (nonatomic, assign) NSInteger comment_count;

@property (nonatomic, assign) NSInteger go_detail_count;

@property (nonatomic, assign) NSInteger favorite_count;

@property (nonatomic, strong) Data2GroupLarge_CoverModel *large_cover;

@property (nonatomic, copy) NSString *text;

@property (nonatomic, copy) NSString *category_name;

@property (nonatomic, assign) NSInteger create_time;

@property (nonatomic, assign) NSInteger user_digg;

@property (nonatomic, assign) NSInteger category_id;

@property (nonatomic, assign) NSInteger category_type;

@property (nonatomic, copy) NSString *share_url;

@property (nonatomic, assign) BOOL is_anonymous;

@property (nonatomic, assign) BOOL quick_comment;

@property (nonatomic, assign) NSInteger bury_count;

@property (nonatomic, assign) NSInteger media_type;

@property (nonatomic, assign) NSInteger user_bury;

@property (nonatomic, strong) Data2GroupMedium_CoverModel *medium_cover;

@property (nonatomic, assign) NSInteger share_type;

@property (nonatomic, assign) CGFloat duration;

@property (nonatomic, strong) Data2Group480P_VideoModel *a480p_video;

@property (nonatomic, assign) NSInteger video_height;

@property (nonatomic, assign) NSInteger is_public_url;

@property (nonatomic, copy) NSString *content;

@property (nonatomic, copy) NSString *neihan_hot_end_time;

@property (nonatomic, assign) NSInteger is_can_share;

@property (nonatomic, assign) BOOL is_neihan_hot;

@property (nonatomic, copy) NSString *mp4_url;

@property (nonatomic, assign) NSInteger has_comments;

@property (nonatomic, copy) NSString *keywords;

@property (nonatomic, strong) Data2Group360P_VideoModel *a360p_video;

@property (nonatomic, strong) Data2Group720P_VideoModel *a720p_video;

@property (nonatomic, copy) NSString *m3u8_url;

@property (nonatomic, assign) NSInteger label;

@property (nonatomic, assign) BOOL allow_dislike;

@property (nonatomic, strong) Data2GroupActivityModel *activity;

@end

@interface Data2GroupLarge_CoverModel : NSObject

@property (nonatomic, strong) NSArray<Data2GroupLarge_coverUrl_ListModel *> *url_list;

@property (nonatomic, copy) NSString *uri;

@end

@interface Data2GroupLarge_coverUrl_ListModel : NSObject

@property (nonatomic, copy) NSString *url;

@end

@interface Data2Group480P_VideoModel : NSObject

@property (nonatomic, strong) NSArray<Data2Group480Url_ListModel *> *url_list;

@property (nonatomic, assign) NSInteger width;

@property (nonatomic, copy) NSString *uri;

@property (nonatomic, assign) NSInteger height;

@end

@interface Data2Group480Url_ListModel : NSObject

@property (nonatomic, copy) NSString *url;

@end

@interface Data2GroupOrigin_VideoModel : NSObject

@property (nonatomic, strong) NSArray<Data2GroupOrign_videoUrl_ListModel *> *url_list;

@property (nonatomic, assign) NSInteger width;

@property (nonatomic, copy) NSString *uri;

@property (nonatomic, assign) NSInteger height;

@end

@interface Data2GroupOrign_videoUrl_ListModel : NSObject

@property (nonatomic, copy) NSString *url;

@end

@interface Data2GroupNeihan_Hot_LinkModel : NSObject

@end

@interface Data2GroupActivityModel : NSObject

@end

@interface Data2Group720P_VideoModel : NSObject

@property (nonatomic, strong) NSArray<Data2Group720Url_ListModel *> *url_list;

@property (nonatomic, assign) NSInteger width;

@property (nonatomic, copy) NSString *uri;

@property (nonatomic, assign) NSInteger height;

@end

@interface Data2Group720Url_ListModel : NSObject

@property (nonatomic, copy) NSString *url;

@end

@interface Data2Group360P_VideoModel : NSObject

@property (nonatomic, strong) NSArray<Data2Group360Url_ListModel *> *url_list;

@property (nonatomic, assign) NSInteger width;

@property (nonatomic, copy) NSString *uri;

@property (nonatomic, assign) NSInteger height;

@end

@interface Data2Group360Url_ListModel : NSObject

@property (nonatomic, copy) NSString *url;

@end

@interface Data2GroupMedium_CoverModel : NSObject

@property (nonatomic, strong) NSArray<Data2GroupMediumUrl_ListModel *> *url_list;

@property (nonatomic, copy) NSString *uri;

@end

@interface Data2GroupMediumUrl_ListModel : NSObject

@property (nonatomic, copy) NSString *url;

@end

@interface Data2GroupUserModel : NSObject

@property (nonatomic, assign) BOOL user_verified;

@property (nonatomic, copy) NSString *avatar_url;

@property (nonatomic, assign) long long user_id;

@property (nonatomic, assign) BOOL is_following;

@property (nonatomic, copy) NSString *name;

@end

@interface Data2GroupDislike_ReasonModel : NSObject

@property (nonatomic, assign) NSInteger type;

@property (nonatomic, assign) NSInteger id1;

@property (nonatomic, copy) NSString *title;

@end

@interface Data2CommentsModel : NSObject

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

