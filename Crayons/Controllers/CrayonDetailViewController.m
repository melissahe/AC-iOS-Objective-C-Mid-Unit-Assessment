//
//  CrayonDetailViewController.m
//  Crayons
//
//  Created by C4Q on 5/18/18.
//  Copyright © 2018 Alex Paul. All rights reserved.
//

#import "CrayonDetailViewController.h"
#import "CrayonDetailView.h"

@interface CrayonDetailViewController ()

@property (strong, nonatomic) Crayon *crayon;
@property (strong, nonatomic) CrayonDetailView *crayonDetailView;

@end

@implementation CrayonDetailViewController

- (instancetype)initWithCrayon:(Crayon *)crayon {
    self = [super initWithNibName:nil bundle:nil];
    if (self) {
        if (!_crayon) {
            _crayon = crayon;
        }
    }
    return self;
}

#pragma mark - Setup UI

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [self.crayon color];
    self.navigationItem.title = self.crayon.name;
    [self allocInitSubviews];
    [self configureSubviews];
    [self addSubviews];
    [self addConstraints];
}

- (void)allocInitSubviews {
    if (!_crayonDetailView) {
        //TODO: update init
        _crayonDetailView = [[CrayonDetailView alloc] initWithCrayon:self.crayon];
    }
}

- (void)configureSubviews {}

- (void)addSubviews {
    [self.view addSubview:self.crayonDetailView];
}

- (void)addConstraints {
    self.crayonDetailView.translatesAutoresizingMaskIntoConstraints = NO;
    
    [NSLayoutConstraint activateConstraints: @[
                                               [self.crayonDetailView.topAnchor constraintEqualToAnchor:self.view.safeAreaLayoutGuide.topAnchor],
                                              [self.crayonDetailView.leadingAnchor constraintEqualToAnchor:self.view.safeAreaLayoutGuide.leadingAnchor],
                                               [self.crayonDetailView.trailingAnchor constraintEqualToAnchor:self.view.safeAreaLayoutGuide.trailingAnchor],
                                               [self.crayonDetailView.bottomAnchor constraintEqualToAnchor:self.view.safeAreaLayoutGuide.bottomAnchor]
                                               ]];
}

@end
