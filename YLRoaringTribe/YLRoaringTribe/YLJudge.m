//
//  YLJudge.m
//  YLRoaringTribe
//
//  Created by 千锋 on 16/2/26.
//  Copyright © 2016年 mobiletrain. All rights reserved.
//

#import "YLJudge.h"

@implementation YLJudge
/**
 *  判断是否符合电话号码的标准
 */
+(BOOL)judgeIfAPhoneNumber:(NSString *)string{
    
    //NSString *regex1=@"1[345678][0-9]{9}";
    //大写的\D表示非数字 ,[^345678]表示不能是346578
   NSString *regex1=@"1[345678]\\d{9}";
    NSPredicate *predicate=[NSPredicate predicateWithFormat:@"SELF MATCHES %@",regex1];
    
    return [predicate evaluateWithObject:string];
}
/**
 *  判断登陆是什么错误
 */
+(NSString *)judgeLoginError:(NSInteger)code{
    NSString *errorString=[NSString string];
    switch (code) {
        case 200:
            errorString=@"用户名不能为空";
            break;
        case 201:
            errorString=@"密码不能为空";
            break;
        case 202:
            errorString=@"用户名已被使用";
            break;
        case 203:
            errorString=@"邮箱已被注册";
            break;
        case 204:
            errorString=@"为了您的账户安全，请输入邮箱，以便您修改信息";
            break;
        case 210:
            errorString=@"用户名和密码不匹配";
            break;
        case 211:
            errorString=@"找不到用户，请检查您的网络或者确认该账号已存在";
            break;
        case 212:
            errorString=@"您还没有提供手机号码";
            break;
        case 213:
            errorString=@"该手机号码对应的用户不存在";
            break;
        case 214:
            errorString=@"该手机号码已被注册";
            break;
        case 215:
            errorString=@"该手机号码未验证";
            break;
        case 216:
            errorString=@"该邮箱未验证";
            break;
        case 217:
            errorString=@"您输入的用户名无效";
            break;
        case 218:
            errorString=@"您输入的密码是无效密码";
            break;
        default:
            errorString=@"未知错误";
            break;
    }
    return errorString;
}
@end
