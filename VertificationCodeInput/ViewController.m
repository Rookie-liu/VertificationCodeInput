//
//  ViewController.m
//  VertificationCodeInput
//
//  Created by wql on 2018/1/26.
//  Copyright © 2018年 wql. All rights reserved.
//

#import "ViewController.h"
#import "VertificationCodeInputView.h"
@interface ViewController ()<getTextFieldContentDelegate>{
    VertificationCodeInputView *vertificationCodeInputView;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    vertificationCodeInputView = [[VertificationCodeInputView alloc]initWithFrame:CGRectMake(50,200,self.view.frame.size.width - 100,55)];
    vertificationCodeInputView.delegate = self;
    /****** 设置验证码/密码的位数默认为四位 ******/ 
    vertificationCodeInputView.numberOfVertificationCode = 6;
    /*********验证码（显示数字）YES,隐藏形势 NO，数字形式**********/ 
    vertificationCodeInputView.secureTextEntry =NO;
    [self.view addSubview:vertificationCodeInputView];
    [vertificationCodeInputView becomeFirstResponder];
}


#pragma mark --------- 获取验证码
-(void)returnTextFieldContent:(NSString *)content{
    NSLog(@"%@================验证码",content);
    [vertificationCodeInputView errorSMSAnim];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
