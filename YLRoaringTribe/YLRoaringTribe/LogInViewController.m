//
//  ViewController.m
//  YLRoaringTribe
//
//  Created by 千锋 on 16/2/25.
//  Copyright © 2016年 mobiletrain. All rights reserved.
//

#import "LogInViewController.h"
#import "RegisterViewController.h"
@interface ViewController ()<UITextFieldDelegate>
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
            [self AnimationDown];
            break;
        }
    }
    
}
//点击键盘完成回调方法
- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    if ([textField isFirstResponder]) {
    [textField resignFirstResponder];  // 取消第一响应者
        [self AnimationDown];
      }
    return YES;
}
//当文本框变为第一响应者时候使用
- (void)textFieldDidBeginEditing:(UITextField *)textField{
    if ([textField isFirstResponder]) {
        [self AnimationUp];
    }
    
}
//动画上移封装接口wlg
-(void)AnimationUp{
    //设置动画的名字
    [UIView beginAnimations:@"Animation" context:nil];
    //设置动画的间隔时间
    [UIView setAnimationDuration:1.20];
    //使用当前正在运行的状态开始下一段动画
    [UIView setAnimationBeginsFromCurrentState: YES];
    for (UIView *temp in self.view.subviews) {
        temp.frame=CGRectMake(temp.frame.origin.x, temp.frame.origin.y - 100, temp.frame.size.width, temp.frame.size.height);
    }
    //设置动画结束
    [UIView commitAnimations];
}
//动画下移封装接口
-(void)AnimationDown{
    //设置动画的名字
    [UIView beginAnimations:@"Animation" context:nil];
    //设置动画的间隔时间
    [UIView setAnimationDuration:0.20];
    //使用当前正在运行的状态开始下一段动画
    [UIView setAnimationBeginsFromCurrentState: YES];
    for (UIView *temp in self.view.subviews) {
       temp.frame=CGRectMake(temp.frame.origin.x, temp.frame.origin.y +100, temp.frame.size.width, temp.frame.size.height);
    }
    //设置动画结束
    [UIView commitAnimations];
}

@end
