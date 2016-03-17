//
//  DingYueModel.h
//  逗你乐
//
//  Created by tarena on 15/11/9.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "BaseModel.h"

@class DYDataModel,DYDataGod_CommentModel,DJDataRotate_BannerModel,DYDRotate_bannerBannersModel,DYDRotateBannerBanner_UrlModel,DYDRoBBannerUrl_ListModel,DYDataCategoriesModel,DYDCateCategory_ListModel,DYDataMy_Category_ListModel;
@interface DingYueModel : BaseModel

@property (nonatomic, copy) NSString *message;

@property (nonatomic, strong) DYDataModel *data;

@end
@interface DYDataModel : NSObject

@property (nonatomic, strong) NSArray *my_top_category_list;

@property (nonatomic, strong) DJDataRotate_BannerModel *rotate_banner;

@property (nonatomic, strong) DYDataCategoriesModel *categories;

@property (nonatomic, strong) DYDataGod_CommentModel *god_comment;

@property (nonatomic, strong) NSArray<DYDataMy_Category_ListModel *> *my_category_list;

@end

@interface DYDataGod_CommentModel : NSObject

@property (nonatomic, copy) NSString *icon;

@property (nonatomic, assign) NSInteger count;

@property (nonatomic, copy) NSString *intro;

@property (nonatomic, copy) NSString *name;

@end

@interface DJDataRotate_BannerModel : NSObject

@property (nonatomic, assign) NSInteger count;

@property (nonatomic, strong) NSArray<DYDRotate_bannerBannersModel *> *banners;

@end

@interface DYDRotate_bannerBannersModel : NSObject

@property (nonatomic, copy) NSString *schema_url;

@property (nonatomic, strong) DYDRotateBannerBanner_UrlModel *banner_url;

@end

@interface DYDRotateBannerBanner_UrlModel : NSObject

@property (nonatomic, assign) NSInteger id1;

@property (nonatomic, copy) NSString *title;

@property (nonatomic, strong) NSArray<DYDRoBBannerUrl_ListModel *> *url_list;

@property (nonatomic, assign) NSInteger height;

@property (nonatomic, copy) NSString *uri;

@property (nonatomic, assign) NSInteger width;

@end

@interface DYDRoBBannerUrl_ListModel : NSObject

@property (nonatomic, copy) NSString *url;

@end

@interface DYDataCategoriesModel : NSObject

@property (nonatomic, copy) NSString *icon;

@property (nonatomic, assign) NSInteger category_count;

@property (nonatomic, assign) NSInteger id1;

@property (nonatomic, copy) NSString *intro;

@property (nonatomic, strong) NSArray<DYDCateCategory_ListModel *> *category_list;

@property (nonatomic, copy) NSString *name;

@property (nonatomic, assign) NSInteger priority;

@end

@interface DYDCateCategory_ListModel : NSObject

@property (nonatomic, assign) BOOL is_recommend;

@property (nonatomic, copy) NSString *icon;

@property (nonatomic, assign) NSInteger share_type;

@property (nonatomic, copy) NSString *mix_weight;

@property (nonatomic, assign) NSInteger id1;

@property (nonatomic, assign) BOOL is_top;

@property (nonatomic, copy) NSString *icon_url;

@property (nonatomic, assign) NSInteger total_updates;

@property (nonatomic, copy) NSString *small_icon_url;

@property (nonatomic, assign) BOOL is_risk;

@property (nonatomic, assign) NSInteger big_category_id;

@property (nonatomic, copy) NSString *top_start_time;

@property (nonatomic, assign) NSInteger type;

@property (nonatomic, copy) NSString *buttons;

@property (nonatomic, assign) NSInteger allow_text;

@property (nonatomic, copy) NSString *extra;

@property (nonatomic, copy) NSString *tag;

@property (nonatomic, copy) NSString *intro;

@property (nonatomic, assign) NSInteger post_rule_id;

@property (nonatomic, assign) NSInteger priority;

@property (nonatomic, assign) NSInteger subscribe_count;

@property (nonatomic, assign) NSInteger allow_multi_image;

@property (nonatomic, copy) NSString *name;

@property (nonatomic, assign) NSInteger today_updates;

@property (nonatomic, assign) NSInteger status;

@property (nonatomic, copy) NSString *small_icon;

@property (nonatomic, copy) NSString *top_end_time;

@property (nonatomic, assign) BOOL visible;

@property (nonatomic, strong) NSArray *material_bar;

@property (nonatomic, assign) NSInteger allow_gif;

@property (nonatomic, assign) NSInteger allow_text_and_pic;

@property (nonatomic, assign) NSInteger allow_video;

@property (nonatomic, copy) NSString *channels;

@property (nonatomic, assign) NSInteger dedup;

@property (nonatomic, copy) NSString *share_url;

@property (nonatomic, copy) NSString *placeholder;

@property (nonatomic, assign) BOOL has_timeliness;

@end

@interface DYDataMy_Category_ListModel : NSObject

@property (nonatomic, assign) BOOL is_recommend;

@property (nonatomic, copy) NSString *icon;

@property (nonatomic, assign) NSInteger share_type;

@property (nonatomic, copy) NSString *mix_weight;

@property (nonatomic, assign) NSInteger id1;

@property (nonatomic, assign) BOOL is_top;

@property (nonatomic, copy) NSString *icon_url;

@property (nonatomic, assign) NSInteger total_updates;

@property (nonatomic, copy) NSString *small_icon_url;

@property (nonatomic, assign) BOOL is_risk;

@property (nonatomic, assign) NSInteger big_category_id;

@property (nonatomic, copy) NSString *top_start_time;

@property (nonatomic, assign) NSInteger type;

@property (nonatomic, copy) NSString *buttons;

@property (nonatomic, assign) NSInteger allow_text;

@property (nonatomic, copy) NSString *extra;

@property (nonatomic, copy) NSString *tag;

@property (nonatomic, copy) NSString *intro;

@property (nonatomic, assign) NSInteger post_rule_id;

@property (nonatomic, assign) NSInteger priority;

@property (nonatomic, assign) NSInteger subscribe_count;

@property (nonatomic, assign) NSInteger allow_multi_image;

@property (nonatomic, copy) NSString *name;

@property (nonatomic, assign) NSInteger today_updates;

@property (nonatomic, assign) NSInteger status;

@property (nonatomic, copy) NSString *small_icon;

@property (nonatomic, copy) NSString *top_end_time;

@property (nonatomic, assign) BOOL visible;

@property (nonatomic, strong) NSArray *material_bar;

@property (nonatomic, assign) NSInteger allow_gif;

@property (nonatomic, assign) NSInteger allow_text_and_pic;

@property (nonatomic, assign) NSInteger allow_video;

@property (nonatomic, copy) NSString *channels;

@property (nonatomic, assign) NSInteger dedup;

@property (nonatomic, copy) NSString *share_url;

@property (nonatomic, copy) NSString *placeholder;

@property (nonatomic, assign) BOOL has_timeliness;

@end

