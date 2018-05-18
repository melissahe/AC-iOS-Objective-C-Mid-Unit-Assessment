//
//  Crayon.h
//  Crayons
//
//  Created by Alex Paul on 5/15/18.
//  Copyright © 2018 Alex Paul. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Crayon: NSObject

@property (copy, nonatomic) NSString *name;
@property (assign) double red;
@property (assign) double green;
@property (assign) double blue;
@property (copy, nonatomic) NSArray *originalColors;
@property (copy, nonatomic) NSString *hex;

+ (NSArray *)allTheCrayons;

- (instancetype)initWithName:(NSString *)name
                         red:(double)red
                       green:(double)green
                        blue:(double)blue
                         hex:(NSString *)hex;
- (UIColor *)colorWithAlpha:(double)alpha;
- (UIColor *)color;

@end
