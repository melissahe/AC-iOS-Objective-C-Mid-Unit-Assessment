//
//  Crayon.h
//  Crayons
//
//  Created by Alex Paul on 5/15/18.
//  Copyright © 2018 Alex Paul. All rights reserved.
//

@interface Crayon: NSObject

@property (copy, nonatomic) NSString *name;
@property (assign) double red;
@property (assign) double green;
@property (assign) double blue;
@property (copy, nonatomic) NSString *hex;

+ (NSArray *)allTheCrayons;

- (instancetype)initWithName:(NSString *)name
                         red:(double)red
                       green:(double)green
                        blue:(double)blue
                         hex:(NSString *)hex;

@end
