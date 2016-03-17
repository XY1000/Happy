//
//  DuanZiModel.m
//  逗你乐
//
//  Created by tarena on 15/11/9.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "DuanZiModel.h"

@implementation DuanZiModel


@end
@implementation DataModel

+ (NSDictionary *)objectClassInArray{
    return @{@"data" : [DataDataModel class]};
}

@end


@implementation DataDataModel

+ (NSDictionary *)objectClassInArray{
    return @{@"comments" : [Data2CommentsModel class]};
}

@end


@implementation Data2GroupModel

+ (NSDictionary *)objectClassInArray{
    return @{@"dislike_reason" : [Data2GroupDislike_ReasonModel class]};
}

+ (NSDictionary *)replacedKeyFromPropertyName
{
	return @{
			 @"id1":@"id",@"a480p_video":@"480p_video",@"a720p_video":@"720p_video",@"a360p_video":@"360p_video"
			 };
}
@end


@implementation Data2GroupLarge_CoverModel

+ (NSDictionary *)objectClassInArray{
    return @{@"url_list" : [Data2GroupLarge_coverUrl_ListModel class]};
}

@end


@implementation Data2GroupLarge_coverUrl_ListModel

@end


@implementation Data2Group480P_VideoModel

+ (NSDictionary *)objectClassInArray{
    return @{@"url_list" : [Data2Group480Url_ListModel class]};
}

@end


@implementation Data2Group480Url_ListModel

@end


@implementation Data2GroupOrigin_VideoModel

+ (NSDictionary *)objectClassInArray{
    return @{@"url_list" : [Data2GroupOrign_videoUrl_ListModel class]};
}

@end


@implementation Data2GroupOrign_videoUrl_ListModel

@end


@implementation Data2GroupNeihan_Hot_LinkModel

@end


@implementation Data2GroupActivityModel

@end


@implementation Data2Group720P_VideoModel

+ (NSDictionary *)objectClassInArray{
    return @{@"url_list" : [Data2Group720Url_ListModel class]};
}

@end


@implementation Data2Group720Url_ListModel

@end


@implementation Data2Group360P_VideoModel

+ (NSDictionary *)objectClassInArray{
    return @{@"url_list" : [Data2Group360Url_ListModel class]};
}

@end


@implementation Data2Group360Url_ListModel

@end


@implementation Data2GroupMedium_CoverModel

+ (NSDictionary *)objectClassInArray{
    return @{@"url_list" : [Data2GroupMediumUrl_ListModel class]};
}

@end


@implementation Data2GroupMediumUrl_ListModel

@end


@implementation Data2GroupUserModel

@end


@implementation Data2GroupDislike_ReasonModel
+(NSDictionary *)replacedKeyFromPropertyName
{
	return @{
			 @"id1":@"id"
			 };
}
@end


@implementation Data2CommentsModel
+(NSDictionary *)replacedKeyFromPropertyName
{
	return @{
			 @"id1":@"id",@"desc":@"description"
			 };
}
@end


