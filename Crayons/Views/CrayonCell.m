//
//  CrayonCell.m
//  Crayons
//
//  Created by C4Q on 5/18/18.
//  Copyright © 2018 Alex Paul. All rights reserved.
//

#import "CrayonCell.h"

@interface CrayonCell ()

//encapsulation
@property (strong, nonatomic, readwrite) Crayon *crayon;

@end

@implementation CrayonCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:@"crayonCell"];
    return self;
}

- (void)configureCellWithCrayon:(Crayon *)crayon {
    _crayon = crayon;
    [self commonInit];
}

- (void)commonInit {
    [self setupViews];
    UIColor *crayonColor = [self.crayon color];
    self.contentView.backgroundColor = crayonColor;
}

- (void)changeTextColorToWhite {
    self.crayonNameLabel.textColor = UIColor.whiteColor;
    self.hexLabel.textColor = UIColor.whiteColor;
    self.crayonImageView.backgroundColor = UIColor.whiteColor;
}

//constraints
- (void)setupViews {
    [self setupCrayonImageView];
    [self setupCrayonNameLabel];
    [self setupHexLabel];
}

- (void)setupCrayonImageView {
    if (!_crayonImageView) {
        _crayonImageView = [[UIImageView alloc] initWithImage: [UIImage imageNamed:@"crayon"]];
    }
    self.crayonImageView.backgroundColor = UIColor.clearColor;
    self.crayonImageView.contentMode = UIViewContentModeScaleAspectFit;
    
    [self.contentView addSubview: self.crayonImageView];
    
    self.crayonImageView.translatesAutoresizingMaskIntoConstraints = NO;
    [NSLayoutConstraint activateConstraints: @[
                            [self.crayonImageView.topAnchor constraintEqualToAnchor:self.contentView.safeAreaLayoutGuide.topAnchor constant:10],
                            [self.crayonImageView.leadingAnchor constraintEqualToAnchor:self.contentView.safeAreaLayoutGuide.leadingAnchor constant:10],
                            [self.crayonImageView.trailingAnchor constraintEqualToAnchor:self.contentView.safeAreaLayoutGuide.trailingAnchor constant:-10],
                            [self.crayonImageView.heightAnchor constraintEqualToAnchor:self.contentView.safeAreaLayoutGuide.widthAnchor multiplier:0.30]
                                               ]];
}

- (void)setupCrayonNameLabel {
    if (!_crayonNameLabel) {
        _crayonNameLabel = [[UILabel alloc] initWithFrame:CGRectZero];
    }
    
    self.crayonNameLabel.text = self.crayon.name;
    self.crayonNameLabel.textAlignment = NSTextAlignmentCenter;
    self.crayonNameLabel.font = [UIFont boldSystemFontOfSize: 20];
    //TODO: setup font color later
    self.crayonNameLabel.textColor = UIColor.blackColor;
    [self.crayonNameLabel setContentCompressionResistancePriority:1000 forAxis:UILayoutConstraintAxisVertical];
    
    [self.contentView addSubview:self.crayonNameLabel];
    
    self.crayonNameLabel.translatesAutoresizingMaskIntoConstraints = NO;
    
    [NSLayoutConstraint activateConstraints: @[
                                               [self.crayonNameLabel.topAnchor constraintEqualToAnchor:self.crayonImageView.bottomAnchor constant:5],
                                               [self.crayonNameLabel.leadingAnchor constraintEqualToAnchor:self.contentView.safeAreaLayoutGuide.leadingAnchor constant:10],
                                               [self.crayonNameLabel.trailingAnchor constraintEqualToAnchor:self.contentView.safeAreaLayoutGuide.trailingAnchor constant:-10]
                                               ]];
}

- (void)setupHexLabel {
    if (!_hexLabel) {
        _hexLabel = [[UILabel alloc] initWithFrame:CGRectZero];
    }
    
    self.hexLabel.text = self.crayon.hex;
    self.hexLabel.textAlignment = NSTextAlignmentCenter;
    self.hexLabel.font = [UIFont systemFontOfSize:15];
    //TODO: setup textcolor later
    self.hexLabel.textColor = UIColor.blackColor;
    [self.hexLabel setContentCompressionResistancePriority:1000 forAxis:UILayoutConstraintAxisVertical];
    
    [self.contentView addSubview:self.hexLabel];
    
    self.hexLabel.translatesAutoresizingMaskIntoConstraints = NO;
    
    [NSLayoutConstraint activateConstraints: @[
                                               [self.hexLabel.topAnchor constraintEqualToAnchor:self.crayonNameLabel.bottomAnchor constant:5],
                                               [self.hexLabel.leadingAnchor constraintEqualToAnchor:self.contentView.safeAreaLayoutGuide.leadingAnchor constant:10],
                                               [self.hexLabel.trailingAnchor constraintEqualToAnchor:self.contentView.safeAreaLayoutGuide.trailingAnchor constant:-10],
                                               [self.hexLabel.bottomAnchor constraintEqualToAnchor:self.contentView.safeAreaLayoutGuide.bottomAnchor constant:-10]
                                               ]];
}

@end
