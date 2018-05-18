//
//  CrayonCell.h
//  Crayons
//
//  Created by C4Q on 5/18/18.
//  Copyright © 2018 Alex Paul. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Crayon.h"

@interface CrayonCell : UITableViewCell

@property (strong, nonatomic) UIImageView *crayonImageView;
@property (strong, nonatomic) UILabel *crayonNameLabel;
@property (strong, nonatomic) UILabel *hexLabel;
@property (strong, nonatomic, readonly) Crayon *crayon;

- (void)configureCellWithCrayon:(Crayon *)crayon;
- (void)changeTextColorToWhite;

@end
