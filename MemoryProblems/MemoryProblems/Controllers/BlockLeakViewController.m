//
//  BlockLeakViewController.m
//  MemoryProblems
//
//  Created by Sam Lau on 11/15/15.
//  Copyright © 2015 Sam Lau. All rights reserved.
//

#import "BlockLeakViewController.h"
#import "ArrayDataSource.h"

static NSString *const kNameCellIdentifier = @"NameCell";

@interface BlockLeakViewController ()

#pragma mark - Model
@property (strong, nonatomic) NSArray *nameList;

#pragma mark - Data source
@property (strong, nonatomic) ArrayDataSource *dataSource;


@end

@implementation BlockLeakViewController

#pragma mark - Lifecycle
- (void)viewDidLoad {
    [super viewDidLoad];

    self.tableView.dataSource = self.dataSource;
}

#pragma mark - Lazy initialization
- (NSArray *)nameList
{
    if (!_nameList) {
        _nameList = @[@"Sam", @"Mike", @"John", @"Paul", @"Jason"];
    }
    return _nameList;
}

- (ArrayDataSource *)dataSource
{
    if (!_dataSource) {
        _dataSource = [[ArrayDataSource alloc] initWithItems:self.nameList
                                              cellIdentifier:kNameCellIdentifier
                                              tableViewStyle:UITableViewCellStyleDefault
                                          configureCellBlock:^(UITableViewCell *cell, NSString *item, NSIndexPath *indexPath) {
                                              cell.textLabel.text = item;

                                              [self configureCell];
                                          }];
    }
    return _dataSource;
}

- (void)configureCell
{
    NSLog(@"Just for test");
}

- (void)dealloc
{
    NSLog(@"release BlockLeakViewController");
}

@end
