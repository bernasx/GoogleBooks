//
//  ITS_BookSearchViewController.m
//  GoogleBooksWithCoreData
//
//  Created by Bernardo Ribeiro on 24/03/2020.
//  Copyright © 2020 Bernardo Ribeiro. All rights reserved.
//

#import "ITS_BookSearchViewController.h"

@interface ITS_BookSearchViewController ()

@end

@implementation ITS_BookSearchViewController
int const currentPageConst = 10;

- (void)viewDidLoad {
    [super viewDidLoad];
    self.viewModel = [[ITS_BookSearchViewModel alloc] init];
    self.currentPage -= currentPageConst;
    
    
    //Spinner methods
    self.spinner = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleLarge];
    self.spinner.center = [self.view center];
    [self.view addSubview:self.spinner];
    
    [self setDidFinishFetch:NO];
    
    //tableview config
    [self.bookTableView setTableFooterView:[UIView new]];
    [self.bookTableView setBounces:NO];
   
    //keyboard dismiss
    UITapGestureRecognizer *gestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(dismissKeyboard)];
    [self.view addGestureRecognizer:gestureRecognizer];
    gestureRecognizer.cancelsTouchesInView = NO;
}

- (void)didTapFavoriteOnCell:(ITS_BookTableViewCell *)cell{
    //insert to parent context because the tempcontext won't get saved
    [self.viewModel.repository.coreDataManager.parentContext insertObject:cell.book];
    [self.viewModel saveFavoriteBook];
}

- (void)dismissKeyboard
{
     [self.view endEditing:YES];
}

-(void)spinnerAnimate{
    if([self.spinner isAnimating]){
        [self.spinner stopAnimating];
        [self.spinner setHidden:YES];
    }else{
        [self.spinner setHidden:NO];
        [self.spinner startAnimating];
    }
}

- (void)fetchDataWithQuery:(NSString *)query{
    
    [self setDidFinishFetch:NO];
    [self spinnerAnimate];
    self.currentPage +=currentPageConst;
    [self.viewModel fetchBooksWithQuery:query WithPage:self.currentPage withPerPage:currentPageConst completion:^(NSArray * _Nonnull bookArray, NSString * _Nonnull alertMsg) {
          if(bookArray){
                  self.bookArray = [[NSArray alloc] initWithArray:bookArray];
              }
              //if there is an error
              if(alertMsg){
                  self.currentPage -=currentPageConst; //if something goes wrong you need to pretend it didn't happen
                  [self showAlert:alertMsg];
              }else{
                  [self.bookTableView reloadData];
              }
        [self spinnerAnimate];
        
    }];
}

- (void)showAlert:(NSString *)alertMsg{
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Network problem" message:alertMsg preferredStyle:UIAlertControllerStyleAlert];

    UIAlertAction *ok = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
                            
                        }];
    [alert addAction:ok];
    [self presentViewController:alert animated:YES completion:nil];
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


- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath{
        int lastElement = (int) [self.bookArray count]-1;
        if(indexPath.row == lastElement){
            //this second condition makes it so the view getting updated will not trigger a second call for data
            if(self.didFinishFetch){
                [self fetchDataWithQuery:self.searchbar.text];
            }else{
                [self setDidFinishFetch:YES];
            }
        }
}

#pragma mark - UITextfield Delegate
- (void)textFieldDidEndEditing:(UITextField *)textField{
    self.viewModel.bookArray = [[NSMutableArray alloc] init]; // do it here so you can still have infinite scrolling
    self.currentPage = -currentPageConst;
    [self fetchDataWithQuery:textField.text];
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    return YES;
}


@end
