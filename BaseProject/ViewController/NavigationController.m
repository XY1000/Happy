//
//  NavigationController.m
//  HXY1000
//
//  Created by tarena on 15/11/11.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "NavigationController.h"

@interface NavigationController ()

@end

@implementation NavigationController

+ (void)initialize
{
	if (self == [NavigationController class]) {
		
		UINavigationBar *bar = [UINavigationBar appearance];
		[bar setBackgroundImage:[UIImage imageNamed:@"NAV_back"] forBarMetrics:(UIBarMetricsDefault)];
		
	}
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
	UIImage *selectedImage = [self.tabBarItem.selectedImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
	self.tabBarItem.selectedImage = selectedImage;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
