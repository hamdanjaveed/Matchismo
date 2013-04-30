//
//  PlayingCard.h
//  Matchismo
//
//  Created by Hamdan Javeed on 2013-04-27.
//  Copyright (c) 2013 Hamdan Javeed. All rights reserved.
//

#import "Card.h"

@interface PlayingCard : Card

// a string to hold the suit of the card
@property (strong, nonatomic) NSString *suit;

// an integer to hold the rank of the card
@property (nonatomic) NSUInteger rank;

// a class method that returns an array of valid suits as strings
+ (NSArray *)validSuits;

// a class method that returns an integer that is the maximum rank that a PlayingCard can be
+ (NSUInteger)maxRank;

@end
