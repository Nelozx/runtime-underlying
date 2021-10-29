//
//  NOAnimal.m
//  MessageForwarding
//
//  Created by DMR on 2021/10/29.
//

#import "NOAnimal.h"

@implementation NOAnimal

- (void)run {
    NSLog(@"%s", __func__);
}

- (void)sleep {
    NSLog(@"%s", __func__);
}

- (void)dealloc {
    NSLog(@"%s", __func__);
}

@end
