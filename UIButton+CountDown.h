//
//  UIButton+CountDown.h
//  asdadasd
//
//  Created by ZhangJC on 16/6/20.
//  Copyright © 2016年 Brightease. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIButton (CountDown)
- (void)startWithTime:(NSInteger)timeLine title:(NSString *)title countDownTitle:(NSString *)subTitle mainColor:(UIColor *)mColor countColor:(UIColor *)color;
@end
