//
//  ITS_BookTableViewCell.m
//  GoogleBooksWithCoreData
//
//  Created by Bernardo Ribeiro on 24/03/2020.
//  Copyright © 2020 Bernardo Ribeiro. All rights reserved.
//

#import "ITS_BookTableViewCell.h"

@implementation ITS_BookTableViewCell
- (IBAction)didTapFavorite:(id)sender {
    
    id<ITS_BookTableViewCellDelegate> strongDelegate = self.delegate;
    
    if([strongDelegate respondsToSelector:@selector(didTapFavoriteOnCell:)]){
        [strongDelegate didTapFavoriteOnCell:self];
    }
    
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
