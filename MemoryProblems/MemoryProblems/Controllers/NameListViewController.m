//
//  NameListViewController.m
//  MemoryProblems
//
//  Created by Sam Lau on 11/15/15.
//  Copyright © 2015 Sam Lau. All rights reserved.
//

#import "NameListViewController.h"
#import "ArrayDataSource.h"

static NSString *const kNameCellIdentifier = @"NameCell";

@interface NameListViewController ()

#pragma mark - Model
@property (strong, nonatomic) NSArray *nameList;

#pragma mark - Data source
@property (assign, nonatomic) ArrayDataSource *dataSource;

@end

@implementation NameListViewController

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
        }];
    }
    return _dataSource;
}


@end
