//
//  main.m
//  DynamicCreation
//
//  Created by DMR on 2021/10/29.
//

#import <Foundation/Foundation.h>
#import <objc/message.h>

void run(id self, SEL _cmd) {
    NSLog(@"%s", __func__);
}


int main(int argc, const char * argv[]) {
    @autoreleasepool {
        Class NOPerson = objc_allocateClassPair([NSObject class], "NOPerson", 0);
        
        // 添加实例变量
        NSString *name = @"name";
        class_addIvar(NOPerson, name.UTF8String, sizeof(id), log2(sizeof(id)), @encode(id));
        // 添加方法
        class_addMethod(NOPerson, @selector(run), (IMP)run, "v@:");
        // 注册类
        objc_registerClassPair(NOPerson);
        
        // 创建实例对象
        id person = [[NOPerson alloc] init];
        [person setValue:@"张三" forKey:name];
        NSLog(@"%@", [person valueForKey:name]);
        
        [person performSelector:@selector(run)];
    }
    return 0;
}

