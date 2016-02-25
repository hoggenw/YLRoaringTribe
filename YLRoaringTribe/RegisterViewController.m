//
//  RegisterViewController.m
//  YLRoaringTribe
//
//  Created by 云彦民 on 16/2/25.
//  Copyright © 2016年 mobiletrain. All rights reserved.
//

#import "RegisterViewController.h"

@interface RegisterViewController ()
@property (weak, nonatomic) IBOutlet UITextField *uerNameField;
@property (weak, nonatomic) IBOutlet UITextField *phoneField;
@property (weak, nonatomic) IBOutlet UITextField *codeField;

@end

@implementation RegisterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   // self.navigationController.navigationBarHidden=NO;
    self.uerNameField.placeholder=@"请输入用户名";
    self.uerNameField.borderStyle=UITextBorderStyleRoundedRect;
    self.uerNameField.clearButtonMode=UITextFieldViewModeAlways;
    self.phoneField.placeholder=@"请输入11位电话号码";
    self.phoneField.borderStyle=UITextBorderStyleRoundedRect;
    self.phoneField.clearButtonMode=UITextFieldViewModeAlways;
    self.codeField.placeholder=@"请输入验证码";
    self.codeField.borderStyle=UITextBorderStyleRoundedRect;
    self.codeField.clearButtonMode=UITextFieldViewModeAlways;
    self.uerNameField.tag=200;
    self.phoneField.tag=201;
    self.codeField.tag=202;
    
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)certainButton:(UIButton *)sender {
    [self.navigationController popViewControllerAnimated:YES];
}
- (IBAction)replaceButton:(UIButton *)sender {
}
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    for (int i=200; i<203; i++) {
        UITextField *text=(id)[self.view viewWithTag:i];
        if ([text isFirstResponder]) {
            [text resignFirstResponder];
            break;
        }
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
