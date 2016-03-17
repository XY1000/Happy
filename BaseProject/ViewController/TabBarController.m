//
//  TabBarController.m
//  HXY1000
//
//  Created by tarena on 15/11/12.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "TabBarController.h"

@interface TabBarController ()

@end

@implementation TabBarController

+ (void)initialize
{
	if (self == [TabBarController class]) {
	
		
		// 获取UITabBarItem的风格
		UITabBarItem *barItem = [UITabBarItem appearance];
		// 1.设置item中文字的位置
		[barItem setTitlePositionAdjustment:UIOffsetMake(0, -1)];
		
		// 2.设置item中文字的普通样式
		NSMutableDictionary *normalAttrbiutes = [NSMutableDictionary dictionary];
		normalAttrbiutes[NSForegroundColorAttributeName] = kRGBColor(135,135,135);
		
		[barItem setTitleTextAttributes:normalAttrbiutes forState:UIControlStateNormal];
		
		// 3.设置item中文字被选中时的样式
		NSMutableDictionary *selectedAttrbiutes = [NSMutableDictionary dictionary];
		selectedAttrbiutes[NSForegroundColorAttributeName] =  kRGBColor(95, 68, 54 );
		
		[barItem setTitleTextAttributes:selectedAttrbiutes forState:UIControlStateSelected];
			
		
	}
}





- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
