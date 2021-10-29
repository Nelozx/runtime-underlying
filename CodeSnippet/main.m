//
//  main.m
//  CodeSnippet
//
//  Created by DMR on 2021/10/29.
//  交换实现 & 交换对象

#import <Foundation/Foundation.h>
#import <objc/runtime.h>
#import "NOPerson.h"
#import "NOMan.h"


void run(void) {
    NSLog(@"\n%s", __func__);
}


void set_class_for_objcet(void) {
    NOPerson *person = [NOPerson new];
    NOMan *man = [[NOMan alloc] init];
    
    // 改变了被调用的对象
    object_setClass(person, [man class]);
    [person run];
}

void m2_to_run(void) {
    NOPerson *person = [NOPerson new];
    
    Method m2 = class_getInstanceMethod([person class], @selector(sleep));
    // m2 -> 函数run
    method_setImplementation(m2, (IMP)run);
    // 调用sleep方法 实际走的是run函数
    [person sleep];
}


void m1_to_imp2(void) {
    NOPerson *person = [NOPerson new];
    
    Method m1 = class_getInstanceMethod([person class] , @selector(run));
    Method m2 = class_getInstanceMethod([person class], @selector(sleep));
    // m2的实现
    IMP imp2 = method_getImplementation(m2);
    // M1 -> imp2 更改了方法的实现
    method_setImplementation(m1, imp2);
    // 我调用的是run方法，实际调用的是sleep方法
    [person run];
}


int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        // M1 -> imp2 更改了方法的实现
        m1_to_imp2();
        // m2 -> 函数run
        m2_to_run();
        // 改变了被调用的对象
        set_class_for_objcet();
        
    }
    return 0;
}




