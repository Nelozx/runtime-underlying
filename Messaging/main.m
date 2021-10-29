//
//  main.m
//  Messaging
//
//  Created by DMR on 2021/10/29.
//  消息机制

#import <Foundation/Foundation.h>
#import <objc/message.h>
#import "NOPerson.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        NOPerson *person = [NOPerson new];
    // msg enable-> no
        
        NSLog(@"%p %p", @selector(run), sel_registerName("run"));
        
        objc_msgSend(person, @selector(run));
        objc_msgSend(person, sel_registerName("run"));
        
    }
    return 0;
}
