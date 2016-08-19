//
//  UIButton+ForbidDoubleTap.m
//  asdadasd
//
//  Created by ZhangJC on 16/6/20.
//  Copyright © 2016年 Brightease. All rights reserved.
//

#import "UIButton+ForbidDoubleTap.h"

//实现方法

@implementation UIButton (ForbidDoubleTap)
static const char *UIControl_acceptEventInterval = "UIControl_acceptEventInterval";
static const char *UIControl_ignoreEvent = "UIControl_ignoreEvent";

- (NSTimeInterval)MB_acceptEventInterval{
    return [objc_getAssociatedObject(self, UIControl_acceptEventInterval) doubleValue];
}
- (void)setMB_acceptEventInterval:(NSTimeInterval)MB_acceptEventInterval{
    objc_setAssociatedObject(self, UIControl_acceptEventInterval, @(MB_acceptEventInterval), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}
- (BOOL)MB_ignoreEvent{
    return [objc_getAssociatedObject(self, UIControl_ignoreEvent) boolValue];
}
- (void)setMB_ignoreEvent:(BOOL)MB_ignoreEvent{
    objc_setAssociatedObject(self, UIControl_ignoreEvent, @(MB_ignoreEvent), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

+ (void)load{
    Method a = class_getInstanceMethod(self, @selector(sendAction:to:forEvent:));
    Method b = class_getInstanceMethod(self, @selector(_MB_sendAction:to:forEvent:));
    method_exchangeImplementations(a, b);
}
-(void)changeIgnoreEvent{
    self.MB_ignoreEvent = NO;
}
- (void)_MB_sendAction:(SEL)selector to:(id)target forEvent:(UIEvent*)event{
    if (self.MB_ignoreEvent) return;
    if (self.MB_acceptEventInterval > 0) {
        self.MB_ignoreEvent = YES;
//        [self performSelector:@selector(setMB_ignoreEvent:) withObject:@(NO) afterDelay:self.MB_acceptEventInterval];
        [self performSelector:@selector(changeIgnoreEvent) withObject:nil afterDelay:self.MB_acceptEventInterval];
        
//        self.userInteractionEnabled = NO;
//        [self performSelector:@selector(setUserInteractionEnabled:) withObject:@(YES) afterDelay:self.MB_acceptEventInterval];
    }
    [self _MB_sendAction:selector to:target forEvent:event];
}
@end