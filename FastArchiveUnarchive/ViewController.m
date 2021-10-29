//
//  ViewController.m
//  FastArchiveUnarchive
//
//  Created by DMR on 2021/10/30.
//

#import "ViewController.h"
#import "NOPerson.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NOPerson *p = [NOPerson new];
    p.name = @"张益达";
    p.age = 18;
    p.nick = @"Nero";
    
    NSString *path = [NSString stringWithFormat:@"%@/archiver.plist", NSHomeDirectory()];
    
    NSLog(@"Path:%@", path);
    
    [NSKeyedArchiver archiveRootObject:p toFile:path];
    NOPerson *p1 = [NSKeyedUnarchiver unarchiveObjectWithFile:path];
    NSLog(@"%@", p1);
}


@end
