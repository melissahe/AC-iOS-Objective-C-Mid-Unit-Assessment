//
//  CrayonDetailView.h
//  Crayons
//
//  Created by C4Q on 5/18/18.
//  Copyright © 2018 Alex Paul. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Crayon.h"

@interface CrayonDetailView : UIView

@property (strong, nonatomic, readonly) Crayon *crayon;
//red
@property (strong, nonatomic) UISlider *redSlider;
@property (strong, nonatomic) UILabel *redValueLabel;

//green
@property (strong, nonatomic) UISlider *greenSlider;
@property (strong, nonatomic) UILabel *greenValueLabel;

//blue
@property (strong, nonatomic) UISlider *blueSlider;
@property (strong, nonatomic) UILabel *blueValueLabel;

//alpha
@property (strong, nonatomic) UIStepper *alphaStepper;
@property (strong, nonatomic) UILabel *alphaValueLabel;

//reset
@property (strong, nonatomic) UIButton *resetButton;

- (instancetype)initWithCrayon:(Crayon *)crayon;

@end
