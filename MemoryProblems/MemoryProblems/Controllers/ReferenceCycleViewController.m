//
//  ReferenceCycleViewController.m
//  MemoryProblems
//
//  Created by Sam Lau on 11/11/15.
//  Copyright (c) 2015 Sam Lau. All rights reserved.
//

#import "ReferenceCycleViewController.h"
#import "Test.h"

@implementation ReferenceCycleViewController

#pragma mark - Lifecycle
- (void)viewDidLoad
{
    [super viewDidLoad];

    // 创建两个对象test1和test2
    Test *test1 = [Test new];
    Test *test2 = [Test new];

    // 互相引用对方
    test1.objc = test2;
    test2.objc = test1;
}

@end
