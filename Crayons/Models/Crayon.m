//
//  Crayon.m
//  Crayons
//
//  Created by Alex Paul on 5/15/18.
//  Copyright © 2018 Alex Paul. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Crayon.h"

@implementation Crayon

+ (NSArray *)allTheCrayons {
    Crayon *almond = [[Crayon alloc] initWithName:@"Almond" red:239 green:222 blue:205 hex:@"EFDECD"];
    Crayon *antiqueBrass = [[Crayon alloc] initWithName: @"Antique Brass" red: 205 green:149 blue: 117 hex: @"#CD9575"];
    Crayon *apricot = [[Crayon alloc] initWithName: @"Apricot" red: 253 green: 217 blue: 181 hex: @"#FDD9B5"];
    Crayon *aquamarine = [[Crayon alloc] initWithName: @"Aquamarine" red: 120 green: 219 blue: 226 hex: @"#78DBE2"];
    Crayon *asparagus = [[Crayon alloc] initWithName: @"Asparagus" red: 135 green:  169 blue: 107 hex: @"#87A96B"];
    Crayon *atomicTangerine = [[Crayon alloc] initWithName: @"Atomic Tangerine" red: 255 green: 164 blue: 116 hex: @"#FFA474"];
    Crayon *bananaMania = [[Crayon alloc] initWithName: @"Banana Mania" red: 250 green: 231 blue: 181 hex: @"#FAE7B5"];
    Crayon *beaver = [[Crayon alloc] initWithName: @"Beaver" red: 159 green: 129 blue: 112 hex: @"#9F8170"];
    Crayon *bittersweet = [[Crayon alloc] initWithName: @"Bittersweet" red: 253 green: 124 blue: 110 hex: @"#FD7C6E"];
    Crayon *black = [[Crayon alloc] initWithName: @"Black" red: 0 green: 0 blue: 0 hex: @"#000000"];
    Crayon *blizzardBlue = [[Crayon alloc] initWithName: @"Blizzard Blue" red: 172 green: 229 blue: 238 hex: @"#ACE5EE"];
    Crayon *blue = [[Crayon alloc] initWithName: @"Blue" red: 31 green: 117 blue: 254 hex: @"#1F75FE"];
    Crayon *blueBell = [[Crayon alloc] initWithName: @"Blue Bell" red: 162 green: 162 blue: 208 hex: @"#A2A2D0"];
    Crayon *blueGray = [[Crayon alloc] initWithName: @"Blue Gray" red: 102 green: 153 blue: 204 hex: @"#6699CC"];
    Crayon *blueGreen = [[Crayon alloc] initWithName: @"Blue Green" red: 13 green: 152 blue: 186 hex: @"#0D98BA"];
    Crayon *blueViolet = [[Crayon alloc] initWithName: @"Blue Violet" red: 115 green: 102 blue: 189 hex: @"#7366BD"];
    return @[almond, antiqueBrass, apricot, aquamarine, asparagus, atomicTangerine, bananaMania, beaver,
             bittersweet, black, blizzardBlue, blue, blueBell, blueGray, blueGreen, blueViolet];
}

- (instancetype)initWithName:(NSString *)name red:(double)red green:(double)green blue:(double)blue hex:(NSString *)hex {
    self = [super init];
    if (self) {
        _name = name;
        _red = red;
        _green = green;
        _blue = blue;
        _hex = hex;
    }
    return self;
}

- (UIColor *)color {
    return [[UIColor alloc] initWithRed:self.red/255 green:self.green/255 blue:self.blue/255 alpha:1];
}

@end
