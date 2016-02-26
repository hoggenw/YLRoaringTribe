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
//当文本框变为第一响应者时候使用
- (void)textFieldDidBeginEditing:(UITextField *)textField{
    if ([textField isFirstResponder]) {
        for (UIView *temp in self.view.subviews) {
        temp.frame=CGRectMake(self.view.frame.origin.x, self.view.frame.origin.y - 100, self.view.frame.size.width, self.view.frame.size.height);
        }
    }
    
}
@end
