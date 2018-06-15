//
//  VertificationCodeInputLabel.m
//  VertificationCodeInput
//
//  Created by wql on 2018/1/26.
//  Copyright © 2018年 wql. All rights reserved.
//

#import "VertificationCodeInputLabel.h"
//设置边框宽度，值越大，边框越粗
#define ADAPTER_RATE_WIDTH 1
//设置是否有边框，等于 1 时 是下划线  大于1 的时候随着值越大，边框越大，
#define ADAPTER_RATE_HIDTH 1
@implementation VertificationCodeInputLabel

//重写setText方法，当text改变时手动调用drawRect方法，将text的内容按指定的格式绘制到label上
- (void)setText:(NSString *)text {
    [super setText:text];
    // 手动调用drawRect方法
    [self setNeedsDisplay];
}

// 按照指定的格式绘制验证码/密码
- (void)drawRect:(CGRect)rect1 {
    //计算每位验证码/密码的所在区域的宽和高
    CGRect rect =CGRectMake(0,0,self.width,50);
    float width = rect.size.width / (float)self.numberOfVertificationCode;
    float height = rect.size.height;
    // 将每位验证码/密码绘制到指定区域
    for (int i =0; i <self.text.length; i++) {
        // 计算每位验证码/密码的绘制区域
        CGRect tempRect =CGRectMake(i * width,0, width, height);
        if (_secureTextEntry) {//密码，显示圆点
            UIImage *dotImage = [UIImage imageNamed:@"dot"];
            // 计算圆点的绘制区域
            CGPoint securityDotDrawStartPoint =CGPointMake(width * i + (width - dotImage.size.width) /2.0, (tempRect.size.height - dotImage.size.height) / 2.0);
            // 绘制圆点
            [dotImage drawAtPoint:securityDotDrawStartPoint];
        } else {//验证码，显示数字
            // 遍历验证码/密码的每个字符
            NSString *charecterString = [NSString stringWithFormat:@"%c", [self.text characterAtIndex:i]];
            // 设置验证码/密码的现实属性
            NSMutableDictionary *attributes = [[NSMutableDictionary alloc]init];
            // 设置验证码颜色
            attributes[NSForegroundColorAttributeName] =  [UIColor colorWithRed:5/255 green:124/255 blue:255/255 alpha:1];
            attributes[NSFontAttributeName] =self.font;
            // 计算每位验证码/密码的绘制起点（为了使验证码/密码位于tempRect的中部，不应该从tempRect的重点开始绘制）
            // 计算每位验证码/密码的在指定样式下的size
            CGSize characterSize = [charecterString sizeWithAttributes:attributes];
            CGPoint vertificationCodeDrawStartPoint =CGPointMake(width * i + (width - characterSize.width) /2.0, (tempRect.size.height - characterSize.height) /2.0);
            // 绘制验证码/密码
            [charecterString drawAtPoint:vertificationCodeDrawStartPoint withAttributes:attributes];
        }
    }
    //绘制底部横线
    for (int k=0; k<self.numberOfVertificationCode; k++) {
        [self drawBottomLineWithRect:rect andIndex:k];
        [self drawSenterLineWithRect:rect andIndex:k];
    }
}

//绘制底部的线条
- (void)drawBottomLineWithRect:(CGRect)rect1 andIndex:(int)k{
    CGRect rect =CGRectMake(0,0,self.width,55);
    float width = rect.size.width / (float)self.numberOfVertificationCode;
    float height = rect.size.height;
    //1.获取上下文
    CGContextRef context =UIGraphicsGetCurrentContext();
    //2.设置当前上下问路径
    CGFloat lineHidth =0.25 * ADAPTER_RATE_WIDTH;
    CGFloat strokHidth =0.5 * ADAPTER_RATE_HIDTH;
    CGContextSetLineWidth(context, lineHidth);
    
    if ( k < self.text.length ) {
        CGContextSetStrokeColorWithColor(context,[UIColor grayColor].CGColor);//底部颜色
        CGContextSetFillColorWithColor(context,[UIColor grayColor].CGColor);//内容的颜色
    }else if( k == self.text.length) {
        CGContextSetStrokeColorWithColor(context,[UIColor colorWithRed:5/255 green:124/255 blue:255/255 alpha:1].CGColor);//底部颜色
        CGContextSetFillColorWithColor(context,[UIColor colorWithRed:5/255 green:124/255 blue:255/255 alpha:1].CGColor);//内容的颜色
    }
    else{
        CGContextSetStrokeColorWithColor(context,[UIColor grayColor].CGColor);//底部颜色
        CGContextSetFillColorWithColor(context,[UIColor grayColor].CGColor);//内容的颜色
    }
    CGRect rectangle =CGRectMake(k*width+width/10,height-lineHidth-strokHidth,width-width/5,strokHidth);
    CGContextAddRect(context, rectangle);
    CGContextStrokePath(context);
    
}
//绘制中间的输入的线条
- (void)drawSenterLineWithRect:(CGRect)rect1 andIndex:(int)k{
    if ( k==self.text.length ) {
        CGRect rect =CGRectMake(0,0,self.width,50);
        float width = rect.size.width / (float)self.numberOfVertificationCode;
        float height = rect.size.height;
        //1.获取上下文
        CGContextRef context =UIGraphicsGetCurrentContext();
        CGContextSetLineWidth(context,0.5);
        /****  设置竖线的颜色 ****/
        CGContextSetStrokeColorWithColor(context,[UIColor colorWithRed:5/255 green:124/255 blue:255/255 alpha:1].CGColor);//
        CGContextSetFillColorWithColor(context,[UIColor colorWithRed:5/255 green:124/255 blue:255/255 alpha:1].CGColor);
        CGContextMoveToPoint(context, width * k + (width -1.0) /2.0, height/5);
        CGContextAddLineToPoint(context,  width * k + (width -1.0) /2.0,height-height/5);
        CGContextStrokePath(context);
    }
}

@end
