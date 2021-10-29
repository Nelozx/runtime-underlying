//
//  NOPerson.m
//  FastArchive
//
//  Created by DMR on 2021/10/29.
//

#import "NOPerson.h"
#import <objc/runtime.h>

@implementation NOPerson


/// 解档
- (instancetype)initWithCoder:(NSCoder *)coder {
    if (self = [super init]) {
        unsigned int count = 0;
        Ivar *ivars = class_copyIvarList([self class], &count);
        for (int i = 0; i < count; i++) {
            Ivar var = ivars[i];
            const char *name = ivar_getName(var);
            NSString *key = [NSString stringWithUTF8String:name];
            id value = [coder decodeObjectForKey:key];
            [self setValue:value forKey:key];
        }
        free(ivars);
        
    }
    return self;
}


/// 归档
- (void)encodeWithCoder:(NSCoder *)coder {
    unsigned int count = 0;
    Ivar *ivars = class_copyIvarList([self class], &count);
    for (int i = 0; i < count; i++) {
        Ivar var = ivars[i];
        const char *name = ivar_getName(var);
        NSString *key = [NSString stringWithUTF8String:name];
        id value = [self valueForKey:key];
        [coder encodeObject:value forKey:key];
    }
    free(ivars);
}

- (NSString *)description {
    
    return [NSString stringWithFormat:@"name: %@\tage: %d\tnick: %@", _name, _age, _nick];
}

@end
