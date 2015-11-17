//
//  StaticAnalysisViewController.m
//  MemoryProblems
//
//  Created by Sam Lau on 11/17/15.
//  Copyright (c) 2015 Sam Lau. All rights reserved.
//

#import "StaticAnalysisViewController.h"

@implementation StaticAnalysisViewController

#pragma mark - Lifecycle
- (void)viewDidLoad
{
    [super viewDidLoad];

    [self memoryLeakBug];
    [self resoureLeakBug];
    [self parameterNotNullCheckedBlockBug:nil];
    [self npeInArrayLiteralBug];
    [self prematureNilTerminationArgumentBug];
}

#pragma mark - Test methods from facebook infer iOS Hello examples
- (void)memoryLeakBug
{
     CGPathRef shadowPath = CGPathCreateWithRect(self.inputView.bounds, NULL);
}

- (void)resoureLeakBug
{
    FILE *fp;
    fp=fopen("info.plist", "r");
}

-(void) parameterNotNullCheckedBlockBug:(void (^)())callback {
    callback();
}

-(NSArray*) npeInArrayLiteralBug {
    NSString *str = nil;
    return @[@"horse", str, @"dolphin"];
}

-(NSArray*) prematureNilTerminationArgumentBug {
    NSString *str = nil;
    return [NSArray arrayWithObjects: @"horse", str, @"dolphin", nil];
}

@end
