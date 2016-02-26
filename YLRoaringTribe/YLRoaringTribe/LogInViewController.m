//
//  ViewController.m
//  YLRoaringTribe
//
//  Created by 千锋 on 16/2/25.
//  Copyright © 2016年 mobiletrain. All rights reserved.
//

#import "LogInViewController.h"
#import "RegisterViewController.h"

#import "MajorViewController.h"
@interface ViewController ()<UITextFieldDelegate>{
    BOOL ifLogin;
}
@property (weak, nonatomic) IBOutlet UIImageView *heardImageView;
@property (weak, nonatomic) IBOutlet UITextField *accountField;
@property (weak, nonatomic) IBOutlet UITextField *codeField;



@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationController.navigationBarHidden=YES;
    self.heardImageView.image=[UIImage imageNamed:@"头像.jpg"];
    self.accountField.placeholder=@"请输入用户名/手机号";
    self.accountField.borderStyle=UITextBorderStyleRoundedRect;
    self.accountField.clearButtonMode=UITextFieldViewModeAlways;
    self.codeField.placeholder=@"请输入密码";
    self.codeField.secureTextEntry=YES;
    self.codeField.borderStyle=UITextBorderStyleRoundedRect;
    self.codeField.clearButtonMode=UITextFieldViewModeAlways;
    self.accountField.keyboardType=UIKeyboardTypeDefault;
    self.codeField.keyboardType=UIKeyboardTypeDefault;
    self.accountField.returnKeyType=UIReturnKeyDone;
    self.codeField.returnKeyType=UIReturnKeyDone;
    self.accountField.tag=200;
    self.accountField.delegate=self;
    self.codeField.tag=201;
    self.codeField.delegate=self;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)logInButton:(UIButton *)sender {
    
    MajorViewController *mv=[[MajorViewController alloc]init];
    [self.navigationController pushViewController:mv animated:YES];
    
       //登陆成功
    if ([self userlongin]) {
       
    }else{//失败
        
    }
    

    
}
- (IBAction)registerButton:(UIButton *)sender {
    RegisterViewController *rvc=[[RegisterViewController alloc]init];
    [self.navigationController pushViewController:rvc animated:YES];
    
}

//使文本框失去第一响应者
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    for (int i=200; i<202; i++) {
    UITextField *text=(id)[self.view viewWithTag:i];
        if ([text isFirstResponder]) {
            [text resignFirstResponder];
            
            break;
        }
    }
    
}
//点击键盘完成回调方法
- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    if ([textField isFirstResponder]) {
    [textField resignFirstResponder];  // 取消第一响应者
      
      }
    
    return YES;
}


//登陆测试接口
-(BOOL)userlongin{
    NSString *name=_accountField.text;
    NSString *passWord=_codeField.text;
    //判读是否是电话号码登陆
  if (name.length==11&&[YLJudge judgeIfAPhoneNumber:name]) {
      [AVUser logInWithMobilePhoneNumberInBackground:name password:passWord block:^(AVUser *user, NSError *error) {
         //  NSLog(@"phoneuser=%@,phoneerror=%@",user,error);
          if (user != nil) {
              ifLogin=YES;
          } else {
              ifLogin=NO;
          }
      }];
      if (ifLogin) {
          
      }else{
         [self userNameLoginname:name passWord:passWord];
      }
      
  }else{
      //cleanCloud用户登陆验证
      [self userNameLoginname:name passWord:passWord];
  }
    return ifLogin;
}
-(void)userNameLoginname:(NSString *)name passWord:(NSString *)passWord{
    [AVUser logInWithUsernameInBackground:name password:passWord block:^(AVUser *user, NSError *error) {
       NSLog(@"user=%@,errorcode=%ld",user,error.code);
        if (user != nil) {
            ifLogin=YES;
        } else {
            ifLogin=NO;
            [self hintMessage:[YLJudge judgeLoginError:error.code]];
        }
    }];
    
}
//提示信息接口
-(void)hintMessage:(NSString *)message{
    YLHintView *hint=[[YLHintView alloc]initWithFrame:CGRectMake(0, 0, 200, 200)];
    hint.center=self.view.center;
    hint.message=message;
    [hint showOnView:self.view ForTimeInterval:1.5];
    
}


@end
