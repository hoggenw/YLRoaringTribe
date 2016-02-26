//
//  ChatViewController.m
//  YLRoaringTribe
//
//  Created by 云彦民 on 16/2/26.
//  Copyright © 2016年 mobiletrain. All rights reserved.
//

#import "MajorViewController.h"

@interface MajorViewController ()

@end

@implementation MajorViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor=[UIColor whiteColor];
    [self builderFenLan];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
//创建tabBar
-(void)builderFenLan{
    NSArray *VcArray=@[@"ChatViewController",@"AddressViewController",@"MeViewController"];
    NSArray *imageArray=@[@"iconfont-liaotian-2",@"iconfont-tongxunlu-2",@"iconfont-ren"];
    NSArray *nameArray=@[@"首页",@"通讯录",@"我"];
    for(int i=0;i<nameArray.count;i++){
        Class class=NSClassFromString(VcArray[i]);
        UIViewController *tepVC=[[class alloc]init];
        
        tepVC.title=nameArray[i];
        UINavigationController *nvc=[[UINavigationController alloc]initWithRootViewController:tepVC];
        nvc.tabBarItem=[[UITabBarItem alloc]initWithTitle:nameArray[i] image:[UIImage imageNamed:imageArray[i]] tag:200+i];
        [self addChildViewController:nvc];
    }
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
