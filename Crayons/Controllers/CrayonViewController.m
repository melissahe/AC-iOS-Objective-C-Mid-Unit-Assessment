//
//  ViewController.m
//  Crayons
//
//  Created by Alex Paul on 5/17/18.
//  Copyright © 2018 Alex Paul. All rights reserved.
//

#import "CrayonViewController.h"
#import "Crayon.h"
#define CELLID "crayonCell"

@interface CrayonViewController ()
//do we want these properties to be accessible??
@property (strong, nonatomic) UITableView *crayonTableView;
@property (strong, nonatomic) NSArray *crayonArray;

@end

@implementation CrayonViewController

#pragma mark - Setup UI

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = UIColor.grayColor;
    [self allocInitSubviews];
    [self configureSubviews];
    [self addSubviews];
    [self addConstraints];
}

- (void)allocInitSubviews {
    if (!_crayonTableView) {
        _crayonTableView = [[UITableView alloc] initWithFrame: CGRectZero];
    }
};

- (void)configureSubviews {
    self.crayonTableView.delegate = self;
    self.crayonTableView.dataSource = self;
    self.crayonArray = Crayon.allTheCrayons;
    self.crayonTableView.rowHeight = UITableViewAutomaticDimension;
    self.crayonTableView.estimatedRowHeight = 200;
    //TODO: register class after creating custom tableview class
//    [self.crayonTableView registerClass:<#(nullable Class)#> forCellReuseIdentifier:@crayonCell];
}

- (void)addSubviews {
    [self.view addSubview: self.crayonTableView];
}

- (void)addConstraints {
    self.crayonTableView.translatesAutoresizingMaskIntoConstraints = NO;
    [NSLayoutConstraint activateConstraints:@[
                                              [self.crayonTableView.topAnchor constraintEqualToAnchor:self.view.safeAreaLayoutGuide.topAnchor],
                                              [self.crayonTableView.leadingAnchor constraintEqualToAnchor:self.view.safeAreaLayoutGuide.leadingAnchor],
                                              [self.crayonTableView.trailingAnchor constraintEqualToAnchor:self.view.safeAreaLayoutGuide.trailingAnchor],
                                              [self.crayonTableView.bottomAnchor constraintEqualToAnchor:self.view.safeAreaLayoutGuide.bottomAnchor]
                                              ]];
}

#pragma mark - Table View Delegate Methods

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    //TODO: setup didselect and segue to detailed view controller
}

#pragma mark - Table View Data Source Methods

- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.crayonArray.count;
}

- (nonnull UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    //TODO: add custom tableview cell
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@CELLID];
    return cell;
}

//called when iOS interface environment changes, like when rotating from landscape to portrait orientation
//implement this in viewcontrollers and views to respond to changes in orientation
//make sure to call the super method first to allow layout to adjust
//- (void)traitCollectionDidChange:(nullable UITraitCollection *)previousTraitCollection {
//    //use this for changing font size, etc. when rotation occurs
//}

//if a child view controller's preferred content size changes, the parent (container) or presentation view controller can adjust its layout to accommodate for that
//- (void)preferredContentSizeDidChangeForChildContentContainer:(nonnull id<UIContentContainer>)container {
//
//}

//returns size for child view controller, gets called once for each child
//- (CGSize)sizeForChildContentContainer:(nonnull id<UIContentContainer>)container withParentContainerSize:(CGSize)parentSize {}

//this method is called when View Controller's present view size changes
//- (void)viewWillTransitionToSize:(CGSize)size withTransitionCoordinator:(nonnull id<UIViewControllerTransitionCoordinator>)coordinator {}

//before trait collections change
//- (void)willTransitionToTraitCollection:(nonnull UITraitCollection *)newCollection withTransitionCoordinator:(nonnull id<UIViewControllerTransitionCoordinator>)coordinator {
//}

//for tvOS

//configures focusing and unfocusing in your app
//- (void)didUpdateFocusInContext:(nonnull UIFocusUpdateContext *)context withAnimationCoordinator:(nonnull UIFocusAnimationCoordinator *)coordinator {}

//submits a focus request to focus engine to update; invalidates current focus if focus has changed
//- (void)setNeedsFocusUpdate {}

//whether focus should update or not
//- (BOOL)shouldUpdateFocusInContext:(nonnull UIFocusUpdateContext *)context {}

//causes focus to be immediately updated, if focus environment is pending an update (after calling setNeedsFocusUpdate
//- (void)updateFocusIfNeeded {}

@end
