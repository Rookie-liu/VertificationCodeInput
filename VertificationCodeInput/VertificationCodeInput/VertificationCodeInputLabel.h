//
//  VertificationCodeInputLabel.h
//  VertificationCodeInput
//
//  Created by wql on 2018/1/26.
//  Copyright © 2018年 wql. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface VertificationCodeInputLabel : UILabel
/**验证码/密码的位数*/
@property (nonatomic,assign)NSInteger numberOfVertificationCode;
/**控制验证码/密码是否密文显示*/
@property (nonatomic,assign)bool secureTextEntry;

@property (nonatomic, assign) CGFloat width ;
@end
