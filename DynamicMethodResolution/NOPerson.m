//
//  NOPerson.m
//  CodeSnippet
//
//  Created by DMR on 2021/10/29.
//

#import "NOPerson.h"
#import <objc/runtime.h>

@implementation NOPerson

void impRun() {
    NSLog(@"%s", __func__);
}

- (void)sleep {
    NSLog(@"%s", __func__);
}


+ (void)sleep {
    NSLog(@"%s", __func__);
}


+ (BOOL)resolveClassMethod:(SEL)sel {
    NSLog(@"%s", __func__);
    
    if (sel == @selector(run)) {
        Method sleepMethod = class_getClassMethod(object_getClass(self), @selector(sleep));
        IMP sleepIMP = method_getImplementation(sleepMethod);
        const char *types = method_getTypeEncoding(sleepMethod);
        NSLog(@"%s", types);
        return class_addMethod(object_getClass(self), sel, sleepIMP, types);
    }
    return [super resolveClassMethod:sel];
}

+ (BOOL)resolveInstanceMethod:(SEL)sel {
    NSLog(@"%s", __func__);
    
    if (sel == @selector(run)) {
        Method sleepMethod = class_getInstanceMethod(self, @selector(sleep));
        
        IMP sleppIMP = method_getImplementation(sleepMethod);
        
        const char *types = method_getTypeEncoding(sleepMethod);
        
        NSLog(@"%s", types);
        
        return class_addMethod(self, sel, sleppIMP, types);
    }
    return [super resolveInstanceMethod:sel];
}

@end
