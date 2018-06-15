# VertificationCodeInput

多输入框短信验证码, 添加了错误动画

## gif


 <img src="http://static.zybuluo.com/Rookie/njx7svbv6hfurvj8xeq0sdu0/aaa.gif"/>

## 使用

```
vertificationCodeInputView = [[VertificationCodeInputView alloc]initWithFrame:CGRectMake(50,200,self.view.frame.size.width - 100,55)];
    vertificationCodeInputView.delegate = self;
    /****** 设置验证码/密码的位数默认为四位 ******/ 
    vertificationCodeInputView.numberOfVertificationCode = 6;
    /*********验证码（显示数字）YES,隐藏形势 NO，数字形式**********/ 
    vertificationCodeInputView.secureTextEntry =NO;
    [self.view addSubview:vertificationCodeInputView];
    [vertificationCodeInputView becomeFirstResponder];
```

## 代理
```

#pragma mark --------- 获取验证码
-(void)returnTextFieldContent:(NSString *)content{
    NSLog(@"%@================验证码",content);
    [vertificationCodeInputView errorSMSAnim];
}

```
