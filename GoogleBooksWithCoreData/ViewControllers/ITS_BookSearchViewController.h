//
//  ITS_BookSearchViewController.h
//  GoogleBooksWithCoreData
//
//  Created by Bernardo Ribeiro on 24/03/2020.
//  Copyright © 2020 Bernardo Ribeiro. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ITS_BookSearchViewModel.h"
#import "Book+CoreDataClass.h"
#import "ITS_BookTableViewCell.h"
#import <AFNetworking/UIImageView+AFNetworking.h>
NS_ASSUME_NONNULL_BEGIN

@interface ITS_BookSearchViewController : UIViewController  <UITableViewDelegate,UITableViewDataSource,UITextFieldDelegate,ITS_BookTableViewCellDelegate>

@property (nonatomic) NSArray *bookArray;
@property (nonatomic) ITS_BookSearchViewModel *viewModel;
@property (nonatomic) UIActivityIndicatorView * spinner;
@property (nonatomic) int currentPage;

@property (nonatomic) BOOL didFinishFetch; //for the last cell pagination call

@property (weak, nonatomic) IBOutlet UITextField *searchbar;
@property (weak, nonatomic) IBOutlet UITableView *bookTableView;


- (void)fetchDataWithQuery: (NSString*) query;
- (void)showAlert: (NSString *) alertMsg;
- (void)spinnerAnimate;
- (void)dismissKeyboard;
@end

NS_ASSUME_NONNULL_END
