//
//  DingYueModel.m
//  逗你乐
//
//  Created by tarena on 15/11/9.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "DingYueModel.h"

@implementation DingYueModel

@end
@implementation DYDataModel

+ (NSDictionary *)objectClassInArray{
    return @{@"my_category_list" : [DYDataMy_Category_ListModel class]};
}

@end


@implementation DYDataGod_CommentModel

@end


@implementation DJDataRotate_BannerModel

+ (NSDictionary *)objectClassInArray{
    return @{@"banners" : [DYDRotate_bannerBannersModel class]};
}

@end


@implementation DYDRotate_bannerBannersModel

@end


@implementation DYDRotateBannerBanner_UrlModel

+ (NSDictionary *)objectClassInArray{
    return @{@"url_list" : [DYDRoBBannerUrl_ListModel class]};
}

+ (NSDictionary *)replacedKeyFromPropertyName
{
	return @{
			 @"id1":@"id"
			 };
}
@end


@implementation DYDRoBBannerUrl_ListModel

@end


@implementation DYDataCategoriesModel

+ (NSDictionary *)objectClassInArray{
    return @{@"category_list" : [DYDCateCategory_ListModel class]};
}
+ (NSDictionary *)replacedKeyFromPropertyName
{
	return @{
			 @"id1":@"id"
			 };
}
@end


@implementation DYDCateCategory_ListModel
+ (NSDictionary *)replacedKeyFromPropertyName
{
	return @{
			 @"id1":@"id"
			 };
}
@end


@implementation DYDataMy_Category_ListModel
+ (NSDictionary *)replacedKeyFromPropertyName
{
	return @{
			 @"id1":@"id"
			 };
}
@end


