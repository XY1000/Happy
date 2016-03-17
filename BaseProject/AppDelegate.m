//
//  AppDelegate.m
//  BaseProject
//
//  Created by jiyingxin on 15/10/21.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "AppDelegate.h"
#import "AppDelegate+Category.h"
#import "TuWanViewController.h"
#import "WelcomController.h"
@interface AppDelegate ()

@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    [self initializeWithApplication:application];
	self.window = [[UIWindow alloc]initWithFrame:[[UIScreen mainScreen]bounds]];
	

	
	NSDictionary *dic = [[NSBundle mainBundle] infoDictionary];
	NSString *key = @"CFBundleShortVersionString";
	NSString *currentV = dic[key];
	
	NSString *runV = [[NSUserDefaults standardUserDefaults] stringForKey:key];
	
	if (![currentV isEqualToString:runV] || runV == nil) {
		
		[[NSUserDefaults standardUserDefaults] setValue:currentV forKey:key];
		
		WelcomController *vc = [WelcomController new];
		
		
		self.window.rootViewController = vc;
		
	}else
	{
		
		
		UIStoryboard *story = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
	
		self.window.rootViewController = story.instantiateInitialViewController;
	}
	
	[self.window makeKeyAndVisible];
    return YES;
}

@end
