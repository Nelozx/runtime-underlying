//
//  UIViewController+Hook.m
//  ViewControllerHook
//
//  Created by DMR on 2021/10/29.
//

#import "UIViewController+Hook.h"
#import <objc/message.h>

@implementation UIViewController (Hook)

+ (void)load {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        Method m1 = class_getInstanceMethod(self, @selector(viewWillAppear:));
        Method m2 = class_getInstanceMethod(self, @selector(no_viewWillAppear:));
        method_exchangeImplementations(m1, m2);
    });
}


- (void)no_viewWillAppear:(BOOL)animated {
    
}

- (void)viewWillAppear:(BOOL)animated {
    
}

@end
