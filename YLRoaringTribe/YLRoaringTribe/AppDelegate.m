//
//  AppDelegate.m
//  YLRoaringTribe
//
//  Created by 千锋 on 16/2/25.
//  Copyright © 2016年 mobiletrain. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
  
    //如果使用美国站点，请加上这行代码 [AVOSCloud useAVCloudUS];
    [AVOSCloud setApplicationId:@"nvm32rNAPgzqv9R7dIU2wlBl-gzGzoHsz"
                     clientKey:@"tVCxiqiTerWchslI0P0WbEqN"];
    //如果想跟踪统计应用的打开情况，后面还可以添加下列代码：
    [AVAnalytics trackAppOpenedWithLaunchOptions:launchOptions];
     
     

//     [AVUser signUpOrLoginWithMobilePhoneNumberInBackground:@"18682565339" smsCode:@"092487" block:^(AVUser *user, NSError *error) {
//          // 如果 error 为空就可以表示登录成功了，并且 user 是一个全新的用户
//          NSLog(@"%@",user);
//          NSLog(@"%@",error);
//          if (error==NULL) {
//               NSLog(@"成功");
//                    }
//          else{
//             NSLog(@"失败");
//          }
//     }];
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
