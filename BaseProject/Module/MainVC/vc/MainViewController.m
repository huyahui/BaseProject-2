//
//  MainViewController.m
//  BaseProject
//
//  Created by amateur on 9/1/15.
//  Copyright © 2015 XA. All rights reserved.
//

#import "MainViewController.h"
#import "Stars+CoreDataProperties.h"
#import "CoreData+MagicalRecord.h"

@interface MainViewController ()<UITableViewDataSource,UITableViewDelegate,BaseAPIManagerCallBackDelegate>
@property (weak, nonatomic) IBOutlet UITableView *listTable;
@property (nonatomic, strong) MovieListManager *movieListManager;
@property (nonatomic, strong) NSMutableArray *dataArray;
@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
 
    self.listTable.delegate = self;
    self.listTable.dataSource = self;
    [self.movieListManager getMovieList];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (MovieListManager *)movieListManager
{
    if (!_movieListManager) {
        _movieListManager = [[MovieListManager alloc]init];
        _movieListManager.delegate = self;
    }
    
    return _movieListManager;
}

- (void)managerDidSuccess :(BaseAPIManager *)manager
{
    if ([manager isKindOfClass:[MovieListManager class]])
    {
        NSArray *array = [Stars MR_findAll];
        self.dataArray = [NSMutableArray arrayWithArray:array];
        [self.listTable reloadData];
    }
}
- (void)managerDidFailed :(BaseAPIManager *)manager
{
    
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.dataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identifier = @"identifier";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    Stars *star = [self.dataArray objectAtIndex:indexPath.row];
    cell.textLabel.text = star.name;
    return cell;
}
@end
