//
//  RegisterViewController.m
//  YLRoaringTribe
//
//  Created by 云彦民 on 16/2/25.
//  Copyright © 2016年 mobiletrain. All rights reserved.
//

#import "RegisterViewController.h"
#import "MajorViewController.h"
@interface RegisterViewController ()<UITextFieldDelegate>{
    NSTimer *timer;
}
@property (nonatomic,copy)NSString *codePhone;
@property (weak, nonatomic) IBOutlet UITextField *uerNameField;
@property (weak, nonatomic) IBOutlet UITextField *phoneField;
@property (weak, nonatomic) IBOutlet UITextField *codeField;
@property (weak, nonatomic) IBOutlet UITextField *passWord;
@property (weak, nonatomic) IBOutlet UIButton *sureButton;
@property (weak, nonatomic) IBOutlet UIButton *getCode;

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
    self.passWord.placeholder=@"请输入密码";
    self.uerNameField.tag=200;
    self.phoneField.tag=201;
    self.codeField.tag=202;
    self.passWord.tag=203;
    timer=[NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(judgeIfRegisterRight) userInfo:nil repeats:YES];
    timer.fireDate=[NSDate distantPast];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
/**注册输入判定*/
-(void)judgeIfRegisterRight{
    if (_phoneField.text.length==0||_uerNameField.text.length==0||_passWord.text.length==0) {
        _sureButton.enabled=NO;
    }else{
        _sureButton.enabled=YES;
    }
    if (_phoneField.text.length==11&&[YLJudge judgeIfAPhoneNumber:_phoneField.text]) {
        _getCode.enabled=YES;
    }else{
        _getCode.enabled=NO;
    }
}
/**获取验证码点击*/
- (IBAction)getCodeAction:(UIButton *)sender {
         [AVOSCloud requestSmsCodeWithPhoneNumber:@"18682565339" callback:^(BOOL succeeded, NSError *error) {
              // 发送失败可以查看 error 里面提供的信息
              if (succeeded) {
                   NSLog(@"成功");
              }else{
                   NSLog(@"%@",error);
              }
         }];
    
}
/**确认注册点击*/
- (IBAction)sureRegister:(UIButton *)sender {
    AVUser *user = [AVUser user];// 新建 AVUser 对象实例
    user.username = _uerNameField.text;// 设置用户名
    user.password =  _passWord.text;// 设置密码
    user.email =@"wlg@126.com" ;//设置邮箱
    
    [user signUpInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
        if (succeeded) {
            // 注册成功
            MajorViewController *mv=[[MajorViewController alloc]init];
            [self.navigationController pushViewController:mv animated:YES];
        } else {
            // 失败的原因可能有多种，常见的是用户名已经存在。
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


//- (IBAction)certainButton:(UIButton *)sender {
//    [self.navigationController popViewControllerAnimated:YES];
//}18200537581
- (IBAction)back:(UIButton *)sender {
    [self.navigationController popViewControllerAnimated:YES];
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    for (int i=200; i<204; i++) {
        UITextField *text=(id)[self.view viewWithTag:i];
        if ([text isFirstResponder]) {
            [text resignFirstResponder];
            break;
        }
    }
}

-(void)dealloc{
    if (timer) {
        [timer invalidate];
        timer=nil;
    }
}

@end
