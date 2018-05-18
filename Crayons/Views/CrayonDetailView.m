//
//  CrayonDetailView.m
//  Crayons
//
//  Created by C4Q on 5/18/18.
//  Copyright © 2018 Alex Paul. All rights reserved.
//

#import "CrayonDetailView.h"

@interface CrayonDetailView ()

@property (strong, nonatomic, readwrite) Crayon *crayon;

@end

@implementation CrayonDetailView

//dependency injection
- (instancetype)initWithCrayon:(Crayon *)crayon {
    self = [super initWithFrame: CGRectZero];
    if (self) {
        if (!_crayon) {
            _crayon = crayon;
        }
        self.backgroundColor = [self.crayon color];
    }
    [self commonInit];
    return self;
}

- (void)commonInit {
    [self setupViews];
}

- (void)setupViews {
    [self setupRedValueLabel];
    [self setupRedSlider];
    [self setupGreenValueLabel];
    [self setupGreenSlider];
    [self setupBlueValueLabel];
    [self setupBlueSlider];
    [self setupAlphaValueLabel];
    [self setupAlphaStepper];
    [self setupResetButton];
}

//red
- (void)setupRedValueLabel {
    if (!_redValueLabel) {
        _redValueLabel = [[UILabel alloc] initWithFrame:CGRectZero];
    }
    self.redValueLabel.text = [[NSString alloc] initWithFormat:@"Red: %f", self.crayon.red/255];
    self.redValueLabel.textAlignment = NSTextAlignmentCenter;
    self.redValueLabel.font = [UIFont systemFontOfSize:20];
    [self.redValueLabel setContentCompressionResistancePriority:1000 forAxis:UILayoutConstraintAxisVertical];
    
    [self addSubview:self.redValueLabel];
    
    self.redValueLabel.translatesAutoresizingMaskIntoConstraints = NO;
    
    [NSLayoutConstraint activateConstraints: @[
                                               [self.redValueLabel.topAnchor constraintEqualToAnchor:self.safeAreaLayoutGuide.topAnchor constant:20],
                                               [self.redValueLabel.leadingAnchor constraintEqualToAnchor:self.safeAreaLayoutGuide.leadingAnchor constant:10],
                                               [self.redValueLabel.trailingAnchor constraintEqualToAnchor:self.safeAreaLayoutGuide.trailingAnchor constant:-10],
                                               [self.redValueLabel.centerXAnchor constraintEqualToAnchor:self.safeAreaLayoutGuide.centerXAnchor]
                                               ]];
}

- (void)setupRedSlider {
    if (!_redSlider) {
        _redSlider = [[UISlider alloc] initWithFrame:CGRectZero];
    }
    self.redSlider.minimumValue = 0;
    self.redSlider.maximumValue = 1;
    self.redSlider.value = self.crayon.red/255;
    [self.redSlider setContentCompressionResistancePriority:1000 forAxis:UILayoutConstraintAxisVertical];
    
    [self addSubview:self.redSlider];
    
    self.redSlider.translatesAutoresizingMaskIntoConstraints = NO;
    [NSLayoutConstraint activateConstraints: @[
                                               [self.redSlider.topAnchor constraintEqualToAnchor:self.redValueLabel.bottomAnchor constant:10],
                                               [self.redSlider.leadingAnchor constraintEqualToAnchor:self.safeAreaLayoutGuide.leadingAnchor constant:30],
                                               [self.redSlider.trailingAnchor constraintEqualToAnchor:self.safeAreaLayoutGuide.trailingAnchor constant:-30]
                                               ]];
}

//green
- (void)setupGreenValueLabel {
    if (!_greenValueLabel) {
        _greenValueLabel = [[UILabel alloc] initWithFrame:CGRectZero];
    }
    self.greenValueLabel.text = [[NSString alloc] initWithFormat:@"Green: %f", self.crayon.green/255];
    self.greenValueLabel.textAlignment = NSTextAlignmentCenter;
    self.greenValueLabel.font = [UIFont systemFontOfSize:20];
    [self.greenValueLabel setContentCompressionResistancePriority:1000 forAxis:UILayoutConstraintAxisVertical];
    
    [self addSubview:self.greenValueLabel];
    
    self.greenValueLabel.translatesAutoresizingMaskIntoConstraints = NO;
    
    [NSLayoutConstraint activateConstraints: @[
                                               [self.greenValueLabel.topAnchor constraintEqualToAnchor:self.redSlider.bottomAnchor constant:20],
                                               [self.greenValueLabel.leadingAnchor constraintEqualToAnchor:self.safeAreaLayoutGuide.leadingAnchor constant:10],
                                               [self.greenValueLabel.trailingAnchor constraintEqualToAnchor:self.safeAreaLayoutGuide.trailingAnchor constant:-10],
                                               [self.greenValueLabel.centerXAnchor constraintEqualToAnchor:self.safeAreaLayoutGuide.centerXAnchor]
                                               ]];
}

- (void)setupGreenSlider {
    if (!_greenSlider) {
        _greenSlider = [[UISlider alloc] initWithFrame:CGRectZero];
    }
    self.greenSlider.minimumValue = 0;
    self.greenSlider.maximumValue = 1;
    self.greenSlider.value = self.crayon.green/255;
    [self.greenSlider setContentCompressionResistancePriority:1000 forAxis:UILayoutConstraintAxisVertical];
    
    [self addSubview:self.greenSlider];
    
    self.greenSlider.translatesAutoresizingMaskIntoConstraints = NO;
    [NSLayoutConstraint activateConstraints: @[
                                               [self.greenSlider.topAnchor constraintEqualToAnchor:self.greenValueLabel.bottomAnchor constant:10],
                                               [self.greenSlider.leadingAnchor constraintEqualToAnchor:self.safeAreaLayoutGuide.leadingAnchor constant:30],
                                               [self.greenSlider.trailingAnchor constraintEqualToAnchor:self.safeAreaLayoutGuide.trailingAnchor constant:-30]
                                               ]];
}

//blue
- (void)setupBlueValueLabel {
    if (!_blueValueLabel) {
        _blueValueLabel = [[UILabel alloc] initWithFrame:CGRectZero];
    }
    self.blueValueLabel.text = [[NSString alloc] initWithFormat:@"Blue: %f", self.crayon.blue/255];
    self.blueValueLabel.textAlignment = NSTextAlignmentCenter;
    self.blueValueLabel.font = [UIFont systemFontOfSize:20];
    [self.blueValueLabel setContentCompressionResistancePriority:1000 forAxis:UILayoutConstraintAxisVertical];
    
    [self addSubview:self.blueValueLabel];
    
    self.blueValueLabel.translatesAutoresizingMaskIntoConstraints = NO;
    
    [NSLayoutConstraint activateConstraints: @[
                                               [self.blueValueLabel.topAnchor constraintEqualToAnchor:self.greenSlider.bottomAnchor constant:20],
                                               [self.blueValueLabel.leadingAnchor constraintEqualToAnchor:self.safeAreaLayoutGuide.leadingAnchor constant:10],
                                               [self.blueValueLabel.trailingAnchor constraintEqualToAnchor:self.safeAreaLayoutGuide.trailingAnchor constant:-10],
                                               [self.blueValueLabel.centerXAnchor constraintEqualToAnchor:self.safeAreaLayoutGuide.centerXAnchor]
                                               ]];
}

- (void)setupBlueSlider {
    if (!_blueSlider) {
        _blueSlider = [[UISlider alloc] initWithFrame:CGRectZero];
    }
    self.blueSlider.minimumValue = 0;
    self.blueSlider.maximumValue = 1;
    self.blueSlider.value = self.crayon.green/255;
    [self.blueSlider setContentCompressionResistancePriority:1000 forAxis:UILayoutConstraintAxisVertical];
    
    [self addSubview:self.blueSlider];
    
    self.blueSlider.translatesAutoresizingMaskIntoConstraints = NO;
    [NSLayoutConstraint activateConstraints: @[
                                               [self.blueSlider.topAnchor constraintEqualToAnchor:self.blueValueLabel.bottomAnchor constant:10],
                                               [self.blueSlider.leadingAnchor constraintEqualToAnchor:self.safeAreaLayoutGuide.leadingAnchor constant:30],
                                               [self.blueSlider.trailingAnchor constraintEqualToAnchor:self.safeAreaLayoutGuide.trailingAnchor constant:-30]
                                               ]];
}

//alpha
- (void)setupAlphaValueLabel {
    if (!_alphaValueLabel) {
        _alphaValueLabel = [[UILabel alloc] initWithFrame:CGRectZero];
    }
    self.alphaValueLabel.text = [[NSString alloc] initWithFormat:@"Alpha: %f", 1.0];
    self.alphaValueLabel.textAlignment = NSTextAlignmentCenter;
    self.alphaValueLabel.font = [UIFont systemFontOfSize:20];
    [self.alphaValueLabel setContentCompressionResistancePriority:1000 forAxis:UILayoutConstraintAxisVertical];
    
    [self addSubview:self.alphaValueLabel];
    
    self.alphaValueLabel.translatesAutoresizingMaskIntoConstraints = NO;
    
    [NSLayoutConstraint activateConstraints: @[
                                               [self.alphaValueLabel.topAnchor constraintEqualToAnchor:self.blueSlider.bottomAnchor constant:20],
                                               [self.alphaValueLabel.leadingAnchor constraintEqualToAnchor:self.safeAreaLayoutGuide.leadingAnchor constant:10],
                                               [self.alphaValueLabel.trailingAnchor constraintEqualToAnchor:self.safeAreaLayoutGuide.trailingAnchor constant:-10],
                                               [self.alphaValueLabel.centerXAnchor constraintEqualToAnchor:self.safeAreaLayoutGuide.centerXAnchor]
                                               ]];
    
}

- (void)setupAlphaStepper {
    if (!_alphaStepper) {
        _alphaStepper = [[UIStepper alloc] initWithFrame:CGRectZero];
    }
    self.alphaStepper.minimumValue = 0;
    self.alphaStepper.maximumValue = 1;
    self.alphaStepper.value = 1.0;
    self.alphaStepper.stepValue = 0.1;
    [self.alphaStepper setContentCompressionResistancePriority:1000 forAxis:UILayoutConstraintAxisVertical];
    
    [self addSubview:self.alphaStepper];
    
    self.alphaStepper.translatesAutoresizingMaskIntoConstraints = NO;
    [NSLayoutConstraint activateConstraints: @[
                                               [self.alphaStepper.topAnchor constraintEqualToAnchor:self.alphaValueLabel.bottomAnchor constant:10],
                                               [self.alphaStepper.centerXAnchor constraintEqualToAnchor:self.safeAreaLayoutGuide.centerXAnchor]
                                               ]];
}

//reset
- (void)setupResetButton {
    if (!_resetButton) {
        _resetButton = [[UIButton alloc] initWithFrame:CGRectZero];
    }
    [self.resetButton setTitle:@"Reset Color" forState:UIControlStateNormal];
    [self.resetButton setTitleColor:UIColor.redColor forState:UIControlStateNormal];
    
    [self addSubview:self.resetButton];
    
    self.resetButton.translatesAutoresizingMaskIntoConstraints = NO;
    [NSLayoutConstraint activateConstraints: @[
                                               [self.resetButton.bottomAnchor constraintEqualToAnchor:self.safeAreaLayoutGuide.bottomAnchor constant:-20],
                                               [self.resetButton.centerXAnchor constraintEqualToAnchor:self.safeAreaLayoutGuide.centerXAnchor]
                                               ]];
}

@end
