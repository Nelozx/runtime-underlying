//
//  NOPerson.m
//  CodeSnippet
//
//  Created by DMR on 2021/10/29.
//

#import "NOPerson.h"
#import "NOAnimal.h"

@implementation NOPerson

//- (void)run {
//    NSLog(@"%s", __func__);
//}
//
- (void)sleep {
    NSLog(@"%s", __func__);
}


// 转给改方法实现的对象
- (id)forwardingTargetForSelector:(SEL)aSelector {
//    if (aSelector == @selector(run)) {
//        return [NOAnimal new];
//    }
    return [super forwardingTargetForSelector:aSelector];
}



- (NSMethodSignature *)methodSignatureForSelector:(SEL)aSelector {
    if (aSelector == @selector(run)) {
        return [NSMethodSignature signatureWithObjCTypes:"v@:"];
    }
    return [super methodSignatureForSelector:aSelector];
}

- (void)forwardInvocation:(NSInvocation *)anInvocation {
    //
    
    //转发其他对象处理
//    [anInvocation invokeWithTarget:[NOAnimal new]];
    
    // 转发任何对象去处理 调用sel
    anInvocation.selector = @selector(sleep);
    [anInvocation invoke];
    
}

- (void)doesNotRecognizeSelector:(SEL)aSelector {
    [super doesNotRecognizeSelector:aSelector];
}

- (void)dealloc {
    NSLog(@"%s", __func__);
}


@end
