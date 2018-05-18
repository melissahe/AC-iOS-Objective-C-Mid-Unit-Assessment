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
        _crayonDetailView = [[CrayonDetailView alloc] initWithCrayon:self.crayon];
    }
}

- (void)configureSubviews {
    if ([self.crayon.name isEqualToString:@"Black"]) {
        //change everything to white background
        [self.crayonDetailView changeTextColorToWhite];
    }
    
    //sliders
    [self.crayonDetailView.redSlider addTarget:self action:@selector(sliderValueChanged:) forControlEvents:UIControlEventValueChanged];
    [self.crayonDetailView.greenSlider addTarget:self action:@selector(sliderValueChanged:) forControlEvents:UIControlEventValueChanged];
    [self.crayonDetailView.blueSlider addTarget:self action:@selector(sliderValueChanged:) forControlEvents:UIControlEventValueChanged];
    
    //stepper
    [self.crayonDetailView.alphaStepper addTarget:self action:@selector(stepperValueChanged:) forControlEvents:UIControlEventValueChanged];
    
    //reset button
    [self.crayonDetailView.resetButton addTarget:self action:@selector(resetButtonTapped) forControlEvents:UIControlEventTouchUpInside];
}

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

//targets
- (void)sliderValueChanged:(UISlider *)slider {
    UIColor *newColor;
    switch (slider.tag) {
        case 0: //red
            newColor = [[UIColor alloc] initWithRed:slider.value green:self.crayon.green/255 blue:self.crayon.blue/255 alpha:1];
            self.crayon.red = slider.value*255;
            self.crayonDetailView.redValueLabel.text = [[NSString alloc] initWithFormat:@"Red: %f", slider.value];
            break;
        case 1: //green
            newColor = [[UIColor alloc] initWithRed:self.crayon.red/255 green:slider.value blue:self.crayon.blue/255 alpha:1];
            self.crayon.green = slider.value*255;
            self.crayonDetailView.greenValueLabel.text = [[NSString alloc] initWithFormat:@"Green: %f", slider.value];
            break;
        case 2: //blue
            newColor = [[UIColor alloc] initWithRed:self.crayon.red/255 green:self.crayon.green/255 blue:slider.value alpha:1];
            self.crayon.blue = slider.value*255;
            self.crayonDetailView.blueValueLabel.text = [[NSString alloc] initWithFormat:@"Blue: %f", slider.value];
            break;
        default:
            NSLog(@"Invalid slider changed");
            return;
    }
    self.crayonDetailView.backgroundColor = newColor;
}

- (void)stepperValueChanged:(UIStepper *)stepper {
    //alpha value
    UIColor *newColor = [self.crayon colorWithAlpha:stepper.value];
    self.crayonDetailView.alphaValueLabel.text = [[NSString alloc] initWithFormat:@"Alpha: %f", stepper.value];
    self.crayonDetailView.backgroundColor = newColor;
}

- (void)resetButtonTapped {
    self.crayon.red = [self.crayon.originalColors[0] doubleValue];
    self.crayon.green = [self.crayon.originalColors[1] doubleValue];
    self.crayon.blue = [self.crayon.originalColors[2] doubleValue];
    self.crayonDetailView.backgroundColor = self.crayon.color;
    
    //red
    self.crayonDetailView.redValueLabel.text = [[NSString alloc] initWithFormat:@"Red: %f", self.crayon.red/255];
    self.crayonDetailView.redSlider.value = self.crayon.red/255;
    
    //green
    self.crayonDetailView.greenValueLabel.text = [[NSString alloc] initWithFormat:@"Green: %f", self.crayon.green/255];
    self.crayonDetailView.greenSlider.value = self.crayon.green/255;
    
    //blue
    self.crayonDetailView.blueValueLabel.text = [[NSString alloc] initWithFormat:@"Blue: %f", self.crayon.blue/255];
    self.crayonDetailView.blueSlider.value = self.crayon.blue/255;
    
    //alpha
    self.crayonDetailView.alphaValueLabel.text = [[NSString alloc] initWithFormat:@"Alpha: %f", 1.0];
    self.crayonDetailView.alphaStepper.value = 1.0;
}

@end
