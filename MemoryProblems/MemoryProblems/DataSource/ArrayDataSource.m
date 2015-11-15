//
//  ArrayDataSource.h
//
//
//  Created by Sam Lau on 6/16/15.
//
//

#import "ArrayDataSource.h"

@interface ArrayDataSource ()

@end

@implementation ArrayDataSource

#pragma mark - Initializer
- (id)init
{
    return nil;
}

- (id)initWithItems:(NSArray*)items
     cellIdentifier:(NSString*)cellIdentifier
 configureCellBlock:(TableViewCellConfigureBlock)configureCellBlock;
{
    self = [super init];
    
    if (!self) {
        return nil;
    }
    
    return [self initWithItems:items cellIdentifier:cellIdentifier tableViewStyle:UITableViewCellStyleDefault configureCellBlock:configureCellBlock];
}

- (id)initWithItems:(NSArray *)items
     cellIdentifier:(NSString *)cellIdentifier
     tableViewStyle:(UITableViewCellStyle)tableViewStyle
 configureCellBlock:(TableViewCellConfigureBlock)configureCellBlock
{
    self = [super init];
    
    if (!self) {
        return nil;
    }
    
    _items = items;
    _cellIdentifier = cellIdentifier;
    _configureCellBlock = [configureCellBlock copy];
    _tableViewStyle = tableViewStyle;
    
    return self;
}

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView*)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.items.count;
}

- (UITableViewCell*)tableView:(UITableView*)tableView cellForRowAtIndexPath:(NSIndexPath*)indexPath
{
    UITableViewCell *cell = nil;
    if (self.tableViewStyle != UITableViewCellStyleDefault) {
        cell = [[UITableViewCell alloc] initWithStyle:self.tableViewStyle reuseIdentifier:self.cellIdentifier];
    }else {
        cell = [tableView dequeueReusableCellWithIdentifier:self.cellIdentifier
                                                            forIndexPath:indexPath];
    }
    
    id item = [self itemAtIndexPath:indexPath];
    self.configureCellBlock(cell, item, indexPath);
    return cell;
}

#pragma mark - UITableViewDataSource Helper
- (id)itemAtIndexPath:(NSIndexPath*)indexPath
{
    return self.items[(NSUInteger)indexPath.row];
}

@end
