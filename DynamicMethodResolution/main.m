//
//  main.m
//  DynamicMethodResolution
//
//  Created by DMR on 2021/10/29.
//

#import <Foundation/Foundation.h>
#import "NOPerson.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        NOPerson *person = [NOPerson new];
        [person run];
        [NOPerson run];
    }
    return 0;
}
