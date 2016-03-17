//
//  menuCell.m
//  画板
//
//  Created by tmp on 16/2/4.
//  Copyright © 2016年 tmp. All rights reserved.
//

#import "menuCell.h"

@interface menuCell ()
@property (weak, nonatomic) IBOutlet UIImageView *image;

@property (weak, nonatomic) IBOutlet UILabel *title;
@end

@implementation menuCell

- (void)setModel:(MenuModel *)model{
    _model = model;
    
    UIImage *im = [UIImage imageNamed:model.imageName];
    _image.image = im;
    
    _title.text = model.title;
    
}

@end
