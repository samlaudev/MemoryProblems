//
//  ProblemsListViewController.m
//  MemoryProblems
//
//  Created by Sam Lau on 11/11/15.
//  Copyright © 2015 Sam Lau. All rights reserved.
//

#import "ProblemsListViewController.h"
#import "ReferenceCycleViewController.h"

static NSString *const kProblemCellIdentifier = @"ProblemCell";

@interface ProblemsListViewController ()

/*
 @brief 问题列表
 */
@property (strong, nonatomic) NSArray *problemsList;

@end

@implementation ProblemsListViewController

#pragma mark - Lifecycle
- (void)viewDidLoad {
    [super viewDidLoad];
}

#pragma mark - Lazy initialization
- (NSArray *)problemsList
{
    if (!_problemsList) {
        _problemsList = @[@"引用循环"];
    }
    return _problemsList;
}

#pragma mark - Table view data source
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.problemsList.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:kProblemCellIdentifier forIndexPath:indexPath];
    cell.textLabel.text = self.problemsList[indexPath.row];

    return cell;
}



@end
