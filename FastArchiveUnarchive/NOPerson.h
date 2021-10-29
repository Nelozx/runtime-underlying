//
//  NOPerson.h
//  FastArchive
//
//  Created by DMR on 2021/10/29.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NOPerson : NSObject<NSCoding> 

@property (nonatomic, strong) NSString* name;
@property (nonatomic, assign) int age;
@property (nonatomic, strong) NSString* nick;


@end

NS_ASSUME_NONNULL_END
