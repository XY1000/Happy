//
//  menuViewController.m
//  画板
//
//  Created by tmp on 16/2/4.
//  Copyright © 2016年 tmp. All rights reserved.
//

#import "menuViewController.h"
#import "menuCell.h"
#import <UMSocial.h>



@interface menuViewController ()<RESideMenuDelegate,UITableViewDelegate,UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet UIImageView *icon;
@property (weak, nonatomic) IBOutlet UILabel *nickName;
@property (weak, nonatomic) IBOutlet UILabel *decription;

@property (weak, nonatomic) IBOutlet UIView *nologinView;
@property (weak, nonatomic) IBOutlet UIView *loginView;

//tableView中使用的数据

@property(nonatomic,strong)NSMutableArray *allData;

@end

@implementation menuViewController

- (void)viewDidLoad{
    [super viewDidLoad];
    
    self.sideMenuViewController.delegate = self;
    
   
    
     //[[NSUserDefaults standardUserDefaults] setBool:NO forKey:@"isLogin"];
    
    [self textData];
   [HXYTool userNotLogin:self notlogin:^{
       
       self.loginView.hidden = YES;
       self.nologinView.hidden = NO;
       
       
   } login:^{
       
       NSDictionary *dic = [[NSUserDefaults standardUserDefaults] objectForKey:@"userInfo"];
       
       self.nickName.text = dic[@"screen_name"];
       [self.icon sd_setImageWithURL:dic[@"profile_image_url"]];
       self.nologinView.hidden = YES;
       self.loginView.hidden = NO;
   }];
    
}

#pragma mark - 未登录时的点击事件

//QQ
- (IBAction)theadClick:(UIButton *)sender {
    
    UMSocialSnsPlatform *snsPlatform = [UMSocialSnsPlatformManager getSocialPlatformWithName:UMShareToQQ];
    
    snsPlatform.loginClickHandler(self,[UMSocialControllerService defaultControllerService],YES,^(UMSocialResponseEntity *response){
        
        //          获取微博用户名、uid、token等
        
        if (response.responseCode == UMSResponseCodeSuccess) {
            
            UMSocialAccountEntity *snsAccount = [[UMSocialAccountManager socialAccountDictionary] valueForKey:UMShareToQQ];
            
            NSLog(@"username is %@, uid is %@, token is %@ url is %@",snsAccount.userName,snsAccount.usid,snsAccount.accessToken,snsAccount.iconURL);
            
        }});
    //获取accestoken以及QQ用户信息，得到的数据在回调Block对象形参respone的data属性
    [[UMSocialDataService defaultDataService] requestSnsInformation:UMShareToQQ  completion:^(UMSocialResponseEntity *response){
        NSLog(@"SnsInformation is %@",response.data);
        
        [[NSUserDefaults standardUserDefaults] setBool:YES forKey:@"isLogin"];
        
        [self.icon sd_setImageWithURL:response.data[@"profile_image_url"] completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
           
            self.nickName.text = response.data[@"screen_name"];
            
            [[NSUserDefaults standardUserDefaults] setObject:response.data forKey:@"userInfo"];
            
            self.nologinView.hidden = YES;
            self.loginView.hidden = NO;
        }];
        
     
        
        
        
        
    }];
    
    
  
    
    
    
    
}

//测试
- (void)textData{
    
    MenuModel *m1 = [MenuModel new];
    m1.imageName = @"MoreExpressionShops";
    m1.title = @"开通会员";
 
    MenuModel *m2 = [MenuModel new];
    m2.imageName = @"MoreMyAlbum";
    m2.title = @"我的收藏";
    
    MenuModel *m3 = [MenuModel new];
    m3.imageName = @"MoreMyFavorites";
    m3.title = @"我的相册";
    
    MenuModel *m4 = [MenuModel new];
    m4.imageName = @"MoreMyBankCard";
    m4.title = @"我的文件";
    
    MenuModel *m5 = [MenuModel new];
    m5.imageName = @"MyCardPackageIcon";
    m5.title = @"后续扩展";
    
    [self.allData addObjectsFromArray:@[m1,m2,m3,m4,m5]];
    
}



#pragma mark - RESideMenuDelegate

- (void)sideMenu:(RESideMenu *)sideMenu willShowMenuViewController:(UIViewController *)menuViewController{
    
    self.navigationController.navigationBar.hidden = YES;
    self.navigationController.toolbarHidden = YES;
    
}

- (void)sideMenu:(RESideMenu *)sideMenu willHideMenuViewController:(UIViewController *)menuViewController{
    
    self.navigationController.navigationBar.hidden = NO;
    self.navigationController.toolbarHidden = NO;
    

    
}

#pragma mark - tableViewDelegate

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return self.allData.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    menuCell *cell = [tableView dequeueReusableCellWithIdentifier:cell_menuCell forIndexPath:indexPath];
    
    MenuModel *model = self.allData[indexPath.row];
    
    cell.model = model;
    
    return cell;
}






- (NSMutableArray *)allData {
	if(_allData == nil) {
		_allData = [[NSMutableArray alloc] init];
	}
	return _allData;
}

@end
