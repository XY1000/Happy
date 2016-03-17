//
//  WelcomController.m
//  逗你乐
//
//  Created by tarena on 15/11/9.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "WelcomController.h"
#import "welcomModel.h"
@interface WelcomController ()
//接收图片
@property (nonatomic,strong)NSArray *allImg;


@end

@implementation WelcomController

- (void)viewDidLoad {
    [super viewDidLoad];
	
	self.allImg = [welcomModel dataDemo];
	[self configureScroll];
	
}
/**
 *  配置滚动视图
 */
- (void)configureScroll{
	
	UIScrollView *scroll = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, kWindowW, kWindowH)];
	scroll.pagingEnabled = YES;
	scroll.contentSize = CGSizeMake(self.allImg.count*kWindowW, 0);
	scroll.showsHorizontalScrollIndicator = NO;
	
	for (int i =0; i < self.allImg.count; i++) {
		
		UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake(i*kWindowW, 0, kWindowW, kWindowH)];
		imageView.image = [UIImage imageNamed:self.allImg[i]];
		imageView.userInteractionEnabled = YES;
		if (i == self.allImg.count - 1) {
			
			UIButton *btn = [UIButton buttonWithType:(UIButtonTypeCustom)];
			
			[imageView addSubview:btn];
			btn.backgroundColor = [UIColor clearColor];
			[btn mas_makeConstraints:^(MASConstraintMaker *make) {
				make.centerX.mas_equalTo(0);
				make.bottom.mas_equalTo(-15);
				make.width.mas_equalTo(200);
				make.height.mas_equalTo(50);
			}];
			[btn bk_addEventHandler:^(id sender) {
				UIStoryboard *storyBoard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
				UIWindow *window = [UIApplication sharedApplication].keyWindow;
				window.rootViewController =storyBoard.instantiateInitialViewController;
			} forControlEvents:(UIControlEventTouchUpInside)];
		}
		[scroll addSubview:imageView];
	}
	[self.view addSubview:scroll];
}




@end
