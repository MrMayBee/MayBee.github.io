//
//  UIButton+ForbidDoubleTap.h
//  asdadasd
//
//  Created by ZhangJC on 16/6/20.
//  Copyright © 2016年 Brightease. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <objc/runtime.h>
@interface UIControl (ForbidDoubleTap)
@property (nonatomic, assign) NSTimeInterval MB_acceptEventInterval;
@property (nonatomic, assign) BOOL MB_ignoreEvent;
@end