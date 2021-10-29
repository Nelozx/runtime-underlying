//
//  ViewController.m
//  ViewControllerHook
//
//  Created by DMR on 2021/10/29.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}


- (void)viewWillAppear:(BOOL)animated {
    NSLog(@"%s", __func__);
    
    [super viewWillAppear:animated];
}


@end
