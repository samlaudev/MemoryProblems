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
static NSString *const kReferenceCycleViewControllerSegue = @"ReferenceCycleViewControllerSegue";
static NSString *const kNameListViewControllerSegue = @"NameListViewControllerSegue";
static NSString *const kBlockLeakViewControllerSegue = @"BlockLeakViewControllerSegue";
static NSString *const kStaticAnalysisViewControllerSegue = @"StaticAnalysisViewControllerSegue";

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
        _problemsList = @[@"引用循环", @"悬挂指针", @"Block内存泄露", @"静态分析"];
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

#pragma mark - Table view delegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 0) {
        [self performSegueWithIdentifier:kReferenceCycleViewControllerSegue sender:self];
    }else if (indexPath.row == 1) {
        [self performSegueWithIdentifier:kNameListViewControllerSegue sender:self];
    }else if(indexPath.row == 2) {
        [self performSegueWithIdentifier:kBlockLeakViewControllerSegue sender:self];
    }else if (indexPath.row == 3) {
        [self performSegueWithIdentifier:kStaticAnalysisViewControllerSegue sender:self];
    }
}

@end
