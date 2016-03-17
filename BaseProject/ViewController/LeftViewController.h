//
//  LeftViewController.h
//  逗你乐
//
//  Created by tarena on 15/11/11.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "ViewController.h"

@class LeftViewController;
@protocol LeftViewControllDelegate <NSObject>

- (void)showControllWithRow:(int)row;

@end

@interface LeftViewController : ViewController

@property (nonatomic,weak)id<LeftViewControllDelegate>delegate;


@end
