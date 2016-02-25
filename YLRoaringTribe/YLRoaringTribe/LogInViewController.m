//
//  ViewController.m
//  YLRoaringTribe
//
//  Created by 千锋 on 16/2/25.
//  Copyright © 2016年 mobiletrain. All rights reserved.
//

#import "LogInViewController.h"
#import "RegisterViewController.h"
@interface ViewController ()
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
    self.accountField.tag=200;
    self.codeField.tag=201;
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


@end
