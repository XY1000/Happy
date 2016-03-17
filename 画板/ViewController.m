//
//  ViewController.m
//  画板
//
//  Created by tmp on 16/2/4.
//  Copyright © 2016年 tmp. All rights reserved.
//

#import "ViewController.h"
#import "DTKDropdownMenuView.h"
#import "customView.h"
#import "contentViewController.h"
#import "colorModel.h"
#import "ColorCollectView.h"
#import "ShareManager+shareType.h"
//每部分item（对于颜色的处理）(改动时需要写成float类型)
#define SectionNum   1.0


@interface ViewController ()<UICollectionViewDelegate,UICollectionViewDataSource>

@property(nonatomic,strong)colorModel * colormodel;

@property(nonatomic,strong)NSArray * allColors;


@property (strong, nonatomic) IBOutlet ColorCollectView *colorView;


@end

@implementation ViewController
{
    
   
    __weak IBOutlet UIBarButtonItem *btnItem;
    
    __weak IBOutlet UIButton *colorBtn;
    
    customView *_cusView;
    DTKDropdownMenuView *_menuView;
    
    //用来记录颜色按钮是否是多次点击
    NSInteger _tmpNum;
    
}
- (void)awakeFromNib{
    [super awakeFromNib];
    
    //配置侧面菜单栏
    self.contentViewController = [self.storyboard instantiateViewControllerWithIdentifier:StoryID_contentViewController];
    self.leftMenuViewController = [self.storyboard instantiateViewControllerWithIdentifier:StoryID_menuViewController];
    self.scaleContentView = NO;
    self.backgroundImage = [UIImage imageNamed:@"menu"];
    self.contentViewInPortraitOffsetCenterX = 100;
    self.panGestureEnabled = YES;
   
    //配置导航栏
    [self configBarItem];
    [self addTitleMenu];
    
    //获取颜色
    self.allColors = [self.colormodel getAllColors];
    
}


#pragma mark - 配置导航栏标题下拉栏
- (void)addTitleMenu
{
    _cusView = (customView *)self.contentViewController.view;
    
    contentViewController *con = (contentViewController *)self.contentViewController;
    
    UISlider *slider = con.slider;
    
    [slider addTarget:self action:@selector(sliderChange:) forControlEvents:(UIControlEventValueChanged)];
    _cusView.lineWidth = slider.value;
   
    
    
    
    DTKDropdownItem *item0 = [DTKDropdownItem itemWithTitle:@"主视图" callBack:^(NSUInteger index, id info) {
        
        
        _cusView.stype = DrawStypeNull;
        
        
    }];
    DTKDropdownItem *item1 = [DTKDropdownItem itemWithTitle:@"矩形" callBack:^(NSUInteger index, id info) {
       
        
        _cusView.stype = DrawStypeRect;
    }];
    DTKDropdownItem *item2 = [DTKDropdownItem itemWithTitle:@"圆形" callBack:^(NSUInteger index, id info) {
      
        _cusView.stype = DrawStypeCircle;
    }];
    DTKDropdownItem *item3 = [DTKDropdownItem itemWithTitle:@"虚线" callBack:^(NSUInteger index, id info) {
       
        _cusView.stype = DrawStypeStraight;
    }];
    
    DTKDropdownItem *item4 = [DTKDropdownItem itemWithTitle:@"橡皮" callBack:^(NSUInteger index, id info) {
       
        
        _cusView.stype = DrawStypeEraser;
        
        
        
    }];
    
    DTKDropdownItem *item5 = [DTKDropdownItem itemWithTitle:@"线条" callBack:^(NSUInteger index, id info) {
        
        _cusView.stype = DrawStypeLine;
        
    }];
    
    DTKDropdownItem *item6 = [DTKDropdownItem itemWithTitle:@"椭圆" callBack:^(NSUInteger index, id info) {
        
        _cusView.stype = DrawStypeOval;
        
    }];
    
    
    _menuView = [DTKDropdownMenuView dropdownMenuViewForNavbarTitleViewWithFrame:CGRectMake(0, 0, 200.f, 44.f) dropdownItems:@[item0,item5,item3,item2,item1,item6,item4]];
    _menuView.currentNav = self.navigationController;
    _menuView.dropWidth = 150.f;
    _menuView.titleFont = [UIFont systemFontOfSize:18.f];
    _menuView.textColor = [UIColor flatBlackColor];
    _menuView.textFont = [UIFont systemFontOfSize:13.f];
    _menuView.cellSeparatorColor = [UIColor flatBlackColor];
    _menuView.textFont = [UIFont systemFontOfSize:14.f];
    _menuView.animationDuration = 0.2f;
    _menuView.selectedIndex = 0;
    self.navigationItem.titleView = _menuView;
    
    self.colorView.frame = CGRectMake(10, 0, 0, self.navigationItem.titleView.bounds.size.height);
    self.colorView.backgroundColor = self.navigationController.navigationBar.barTintColor;
    [self.navigationItem.titleView addSubview:self.colorView];
    
}

//线条滑动（sliderChange）

- (void)sliderChange:(UISlider *)senger{
    
    _cusView.lineWidth = senger.value;
    
}


#pragma mark - 配置barbtnItem
- (void)configBarItem{
    
    [HXYTool userNotLogin:self notlogin:^{
        
        btnItem.target = self;
        btnItem.action = @selector(btnClick);
        
        
    } login:^{
        
       
        UIImageView *imageView  = [[UIImageView alloc]init];
         NSDictionary *dic = [[NSUserDefaults standardUserDefaults] objectForKey:@"userInfo"];
        
        [imageView sd_setImageWithURL:dic[@"profile_image_url"]];
        
        imageView.layer.masksToBounds = YES;
        imageView.layer.bounds = CGRectMake(0, 0, self.navigationController.navigationBar.bounds.size.height,self.navigationController.navigationBar.bounds.size.height );
        imageView.layer.cornerRadius = self.navigationController.navigationBar.bounds.size.height/ 2.0;
        btnItem.customView = imageView;
        UIButton *btn = [UIButton buttonWithType:(UIButtonTypeCustom)];
        btn.frame = imageView.frame;
        [btn addTarget:self action:@selector(btnClick) forControlEvents:(UIControlEventTouchUpInside)];
        
        [imageView addSubview:btn];
    }];
    
    
    
}


//登录时的跳转
- (void)btnClick{
    
    [self presentLeftMenuViewController];
    
}
//撤销
- (IBAction)replyClick:(UIBarButtonItem *)sender {
    
    _cusView.stype = DrawStypeRepeal;
    
}


#pragma mark - 底部barItem的点击事件
//分享
- (IBAction)shareClick:(UIBarButtonItem *)sender {
    
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"分享" message:nil preferredStyle:(UIAlertControllerStyleActionSheet)];
    UIAlertAction *action1 = [UIAlertAction actionWithTitle:@"QQ" style:(UIAlertActionStyleDefault) handler:^(UIAlertAction * _Nonnull action) {
        
        
        [ShareManager ShareByQQ:self content:@"QQ"];
        
        
    }];
//    UIAlertAction *action2 = [UIAlertAction actionWithTitle:@"微信" style:(UIAlertActionStyleDefault) handler:^(UIAlertAction * _Nonnull action) {
//       
//      
//        
//    }];
    
    UIAlertAction *action3 = [UIAlertAction actionWithTitle:@"取消" style:(UIAlertActionStyleCancel) handler:^(UIAlertAction * _Nonnull action) {
        
    }];
    
   
    [alert addAction:action1];
    [alert addAction:action3];
    
    [self presentViewController:alert animated:YES completion:nil];
    
}
//相机
- (IBAction)camerClick:(id)sender {
     UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"提示" message:nil preferredStyle:(UIAlertControllerStyleActionSheet)];
    
    UIAlertAction *action1 = [UIAlertAction actionWithTitle:@"相册" style:(UIAlertActionStyleDefault) handler:^(UIAlertAction * _Nonnull action) {
       
        NSLog(@"相册");
    }];
    
    UIAlertAction *action2 = [UIAlertAction actionWithTitle:@"相机" style:(UIAlertActionStyleDefault) handler:^(UIAlertAction * _Nonnull action) {
       
        NSLog(@"相机");
        
    }];
    UIAlertAction *action3 = [UIAlertAction actionWithTitle:@"取消" style:(UIAlertActionStyleCancel) handler:^(UIAlertAction * _Nonnull action) {
        
    }];
    
    [alert addAction:action1];
    [alert addAction:action2];
    [alert addAction:action3];
    
    
    [self presentViewController:alert animated:YES completion:nil];
}
//删除全部
- (IBAction)deletAllClick:(UIBarButtonItem *)sender {
    
    UIAlertController * alert = [UIAlertController alertControllerWithTitle:@"提示" message:@"是否清空全屏" preferredStyle:(UIAlertControllerStyleAlert)];
    
    UIAlertAction *action1 = [UIAlertAction actionWithTitle:@"确定" style:(UIAlertActionStyleDefault) handler:^(UIAlertAction * _Nonnull action) {
       
        _cusView.stype = DrawStypeRemoveAll;
        
    }];
    
    UIAlertAction *action2 = [UIAlertAction actionWithTitle:@"取消" style:(UIAlertActionStyleCancel) handler:nil];
    
    [alert addAction:action1];
    [alert addAction:action2];
    
    
    [self presentViewController:alert animated:YES completion:nil];
    
}
#pragma mark - 颜色按钮被点击
- (IBAction)colorBtnClick:(UIButton *)sender {
    
    if (_tmpNum == 1) {
        
        [UIView animateWithDuration:0.3 animations:^{
            
            self.colorView.frame = CGRectMake(10, 0, 0,self.colorView.bounds.size.height);
            _menuView.titleFont = [UIFont systemFontOfSize:18.f];
            
        } completion:^(BOOL finished) {
            
            _tmpNum = 0;
        }];
        
       
        
        return;
    }
    
    
    [UIView animateWithDuration:0.3 animations:^{
        
        self.colorView.frame = CGRectMake(10, 0, 170, self.navigationItem.titleView.bounds.size.height);
        _menuView.titleFont = [UIFont systemFontOfSize:0];
        
//        [_menuView setValue:[UIView new] forKey:@"arrowImageView"];
        
        
    } completion:^(BOOL finished) {
       
        _tmpNum = 1;
    }];
    
}

#pragma mark - UICollectionDelegate

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    
    return SectionNum;
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    
    return self.allColors.count / SectionNum + 0.5;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:item_colorItem forIndexPath:indexPath];
    
    cell.backgroundColor = self.allColors[indexPath.item + (int)(indexPath.section * SectionNum)];
    
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    
    
    UICollectionViewCell *cell = [collectionView cellForItemAtIndexPath:indexPath];
    
    _cusView.lineColor = cell.backgroundColor;

    colorBtn.backgroundColor = cell.backgroundColor;
    
    [UIView animateWithDuration:0.3 animations:^{
        
        self.colorView.frame = CGRectMake(10, 0, 0,self.colorView.bounds.size.height);
        _menuView.titleFont = [UIFont systemFontOfSize:18.f];
        
    } completion:^(BOOL finished) {
        
        _tmpNum = 0;
    }];
    
    
}





- (colorModel *) colormodel {
	if(_colormodel == nil) {
		_colormodel = [[colorModel alloc] init];
        
	}
	return _colormodel;
}

@end
