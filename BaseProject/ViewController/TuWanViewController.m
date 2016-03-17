//
//  TuWanViewController.m
//  BaseProject
//
//  Created by jiyingxin on 15/11/5.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "TuWanViewController.h"
#import "TuWanViewModel.h"
#import "TuWanListViewController.h"
#import "Factory.h"
#import "LeftViewController.h"
#import "NavigationController.h"
@interface TuWanViewController ()<LeftViewControllDelegate>
@end
@implementation TuWanViewController

+ (UINavigationController *)standardTuWanNavi{
    static NavigationController *navi = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
		
        TuWanViewController *vc = [[TuWanViewController alloc] initWithViewControllerClasses:[self viewControllerClasses] andTheirTitles:[self itemNames]];
        vc.keys = [self vcKeys];
		vc.values = [self vcValues];
	
//配置导航栏
		navi = [[NavigationController alloc]initWithRootViewController:vc];
	
		
		navi.navigationBar.translucent = NO;
		
    });
    return navi;
}
/** 提供每个VC对应的values值数组 */
+ (NSArray *)vcValues{
    NSMutableArray *arr = [NSMutableArray new];
    for (int i = 0; i <[self itemNames].count; i++) {
//数值上，vc的infoType的枚举值 恰好和i值相同
        [arr addObject:@(i)];
    }
    return arr;
}
/** 提供每个VC对应的key值数组 */
+ (NSArray *)vcKeys{
    NSMutableArray *arr = [NSMutableArray new];
    for (id obj in [self itemNames]) {
        [arr addObject:@"infoType"];
    }
    return [arr copy];
}

/** 提供题目数组 */
+ (NSArray *)itemNames{
    return @[@"头条",@"独家",@"暗黑3",@"魔兽",@"风暴",@"炉石",@"星际2",@"守望",@"图片",@"攻略",@"幻化",@"趣闻",@"COS",@"美女"];
}
/** 提供每个题目对应的控制器的类型。题目和类型数量必须一致 */
+ (NSArray *)viewControllerClasses{
    NSMutableArray *arr = [NSMutableArray new];
    for (id obj in [self itemNames]) {
        [arr addObject:[TuWanListViewController class]];
    }
    return [arr copy];
}
#pragma mark ----LeftDelegate----
-(void)showControllWithRow:(int)row
{
	[self setSelectIndex:row];
	self.navigationItem.title = self.titles[row];
}



- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor greenSeaColor];
    self.title = @"百科";
    [Factory addMenuItemToVC:self];
	LeftViewController *left =	(LeftViewController*)self.sideMenuViewController.leftMenuViewController;
	left.delegate = self;
	self.menuHeight = 0;
	
	
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
