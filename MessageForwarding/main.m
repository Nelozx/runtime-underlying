//
//  main.m
//  MessageForwarding
//
//  Created by DMR on 2021/10/29.
//

#import <Foundation/Foundation.h>
#import "NOPerson.h"
extern void instrumentObjcMessageSends(BOOL);

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        // runtime消息打印 /private/tmp 创建一个msgSends函数
        instrumentObjcMessageSends(YES);
        [[NOPerson new] run];
        instrumentObjcMessageSends(NO);
        
    }
    return 0;
}
