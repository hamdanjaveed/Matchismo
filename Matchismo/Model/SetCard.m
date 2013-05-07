//
//  SetCard.m
//  Matchismo
//
//  Created by Hamdan Javeed on 2013-05-06.
//  Copyright (c) 2013 Hamdan Javeed. All rights reserved.
//

#import "SetCard.h"

@implementation SetCard

@synthesize contents = _contents;

// ----------  Instance Methods   ---------- //

// ----------    Class Methods    ---------- //

+ (NSUInteger)maxNumber {
    return 3;
}

+ (NSArray *)symbols {
    NSString *triangle = @"▲";
    NSString *circle = @"●";
    NSString *square = @"■";
    NSArray *symbolArray = [NSArray arrayWithObjects: triangle, circle, square, nil];
    return symbolArray;
}

+ (NSArray *)shading {
    return [NSArray arrayWithObjects:@"solid", @"half", @"open", nil];
}

+ (NSArray *)colors {
    NSDictionary *red = [[NSDictionary alloc] initWithObjects:@[@1.0, @0.0, @0.0] forKeys:@[@"R", @"G", @"B"]];
    NSDictionary *green = [[NSDictionary alloc] initWithObjects:@[@0.0, @1.0, @0.0] forKeys:@[@"R", @"G", @"B"]];
    NSDictionary *purple = [[NSDictionary alloc] initWithObjects:@[@0.75, @0.0, @1.0] forKeys:@[@"R", @"G", @"B"]];
    NSArray *colors = [NSArray arrayWithObjects: red, green, purple, nil];
    return colors;
}

// ---------- Getters and Setters ---------- //

- (NSString *)contents {
    return [NSString stringWithFormat:@"%d:%@:%@:%@", [self number], [self symbol], [self shading], [self color]];
}

@end
