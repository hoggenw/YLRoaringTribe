//
//  YLJudge.h
//  YLRoaringTribe
//
//  Created by 千锋 on 16/2/26.
//  Copyright © 2016年 mobiletrain. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface YLJudge : NSObject
/**
 *  判断是否符合电话号码的标准
 */
+(BOOL)judgeIfAPhoneNumber:(NSString *)string;
/**
 *  判断登陆是什么错误
 */
+(NSString *)judgeLoginError:(NSInteger)code;
@end
