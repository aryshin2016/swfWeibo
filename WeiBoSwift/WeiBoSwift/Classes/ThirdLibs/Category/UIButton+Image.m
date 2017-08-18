//
//  UIButton+Image.m
//  WeiBoSwift
//
//  Created by itogame on 2017/8/16.
//  Copyright © 2017年 itogame. All rights reserved.
//

#import "UIButton+Image.h"

@implementation UIButton (Image)

+(instancetype)buttonWithText:(NSString *)text {
    UIButton *textBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    textBtn.titleLabel.font = [UIFont systemFontOfSize:16];
    [textBtn setTitle:text forState:UIControlStateNormal];
    [textBtn setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    [textBtn setTitleColor:[UIColor blackColor] forState:UIControlStateHighlighted];
    [textBtn setTitleColor:[UIColor blackColor] forState:UIControlStateSelected];
    [textBtn sizeToFit];
    return textBtn;
}

@end
