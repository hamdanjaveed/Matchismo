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

- (int)match:(NSArray *)cardsToBeMatched {
    int score = 0;
    if ([cardsToBeMatched count] == 2) {
        NSMutableArray *colors = [[NSMutableArray alloc] init];
        NSMutableArray *symbols = [[NSMutableArray alloc] init];
        NSMutableArray *shadings = [[NSMutableArray alloc] init];
        NSMutableArray *numbers = [[NSMutableArray alloc] init];
        [colors addObject:self.color];
        [symbols addObject:self.symbol];
        [shadings addObject:self.shading];
        [numbers addObject:@(self.number)];
        for (id otherCard in cardsToBeMatched) {
            if ([otherCard isKindOfClass:[SetCard class]]) {
                SetCard *card = (SetCard *)otherCard;
                if (![colors containsObject:card.color]) {
                    [colors addObject:card.color];
                }
                if (![colors containsObject:card.symbol]) {
                    [colors addObject:card.symbol];
                }
                if (![colors containsObject:card.shading]) {
                    [colors addObject:card.shading];
                }
                if (![colors containsObject:@(card.number)]) {
                    [colors addObject:@(card.number)];
                }
                if ((colors.count == 1 || colors.count == 3) && (symbols.count == 1 || symbols.count == 3) && (shadings.count == 1 || shadings.count == 3) &&
                    (numbers.count == 1 || numbers.count == 3)) {
                    score += 4;
                }
            }
        }
    }
    return score;
}

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
