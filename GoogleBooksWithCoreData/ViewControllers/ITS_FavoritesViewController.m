//
//  ITS_FavoritesViewController.m
//  GoogleBooksWithCoreData
//
//  Created by Bernardo Ribeiro on 24/03/2020.
//  Copyright © 2020 Bernardo Ribeiro. All rights reserved.
//

#import "ITS_FavoritesViewController.h"

@interface ITS_FavoritesViewController ()

@end

@implementation ITS_FavoritesViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.viewModel = [[ITS_FavoritesViewModel alloc] init];
    //tableview config
    [self.bookTableView setTableFooterView:[UIView new]];
    [self.bookTableView setBounces:NO];
}

- (void)didTapFavoriteOnCell:(ITS_BookTableViewCell *)cell{
    [self.viewModel deleteCell:cell fromTableView:self.bookTableView];
    [self.bookTableView reloadData];
}

- (void)viewWillAppear:(BOOL)animated{
    [self fetchData];
}

- (void)fetchData{
    self.bookArray = [self.viewModel fetchFavoriteBooks];
    [self.bookTableView reloadData];
}

#pragma mark - UITableview delegate/datasource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [self.bookArray count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    NSString *cellID = @"bookCell";
    NSString *nibID = @"ITS_BookTableViewCell";
    [self.bookTableView registerNib:[UINib nibWithNibName:nibID bundle:nil] forCellReuseIdentifier:cellID];
    ITS_BookTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];

    
    cell.book = [self.bookArray objectAtIndex:indexPath.row];
    cell.nameLabel.text = cell.book.title;
   
    NSString *urlString = cell.book.smallThumbnail;
    if(urlString){
        [cell.bookImageView setImageWithURL:[[NSURL alloc] initWithString:urlString]];
    }
    //set the delegate of the cell to this viewcontroller
    cell.delegate = self;
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 128.0;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
