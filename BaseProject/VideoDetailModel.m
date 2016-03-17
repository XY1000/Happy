//
//  VideoDetailModel.m
//  逗你乐
//
//  Created by tarena on 15/11/10.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "VideoDetailModel.h"

@implementation VideoDetailModel

@end
@implementation VideoDataModel

+ (NSDictionary *)objectClassInArray{
    return @{@"recent_comments" : [VideoDataRecent_CommentsModel class]};
}

@end


@implementation VideoDataRecent_CommentsModel
+(NSDictionary *)replacedKeyFromPropertyName
{
	return @{
			 @"id1":@"id",@"desc":@"description"
			 };
}
@end


