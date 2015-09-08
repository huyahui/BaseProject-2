//
//  MainViewController.m
//  BaseProject
//
//  Created by amateur on 9/1/15.
//  Copyright © 2015 XA. All rights reserved.
//

#import "MainViewController.h"

@interface MainViewController ()<UITableViewDataSource,UITableViewDelegate,BaseAPIManagerCallBackDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic, strong) MovieListManager *movieListManager;
@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
 
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
    
}
- (void)managerDidFailed :(BaseAPIManager *)manager
{
    
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identifier = @"identifier";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    
    return cell;
}
@end
