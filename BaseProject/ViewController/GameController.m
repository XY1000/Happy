//
//  GameController.m
//  逗你乐
//
//  Created by tarena on 15/11/11.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "GameController.h"
#import "AppDelegate+Category.h"
#import "LeftViewController.h"
#import "TuWanViewController.h"
#import "Factory.h"

@interface GameController ()

@end

@implementation GameController

- (void)viewDidLoad {
    [super viewDidLoad];
	
	[self addChildViewController:self.sideMenu];
	[self.view addSubview:self.sideMenu.view];

	self.tabBarItem.selectedImage = [[UIImage imageNamed:@"Found_press"] imageWithRenderingMode:(UIImageRenderingModeAlwaysOriginal)];
}
- (RESideMenu *)sideMenu{
	if (!_sideMenu) {
		LeftViewController *left = [LeftViewController new];
		
		_sideMenu=[[RESideMenu alloc]initWithContentViewController:[TuWanViewController standardTuWanNavi] leftMenuViewController:left rightMenuViewController:nil];
		//为sideMenu设置背景图,图片插件KSImageName，到Github下载
		_sideMenu.backgroundImage =[UIImage imageNamed:@"air"];
		//可以让出现菜单时不显示状态栏
		_sideMenu.menuPrefersStatusBarHidden = YES;
		//不允许菜单栏到了边缘还可以继续缩小
		_sideMenu.bouncesHorizontally = NO;
		
	}
	return _sideMenu;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
