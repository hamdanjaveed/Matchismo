//
//  PlayingCard.m
//  Matchismo
//
//  Created by Hamdan Javeed on 2013-04-27.
//  Copyright (c) 2013 Hamdan Javeed. All rights reserved.
//

#import "PlayingCard.h"

@implementation PlayingCard

@synthesize suit = _suit;

// ---------- Instance Methods ---------- //

/*
 * Returns the contents of this PlayingCard as a string in a more
 * read-able format. This method appends the suit of the card
 * to its rank. The rank gets formatted to a string by a helper
 * method.
 */
- (NSString *)contents {
    // return a string representation of this PlayingCard
    return [[PlayingCard rankStrings][self.rank] stringByAppendingString:self.suit];
}

// ---------- Class Methods ---------- //

/*
 * A class method that returns a string representation of all the ranks.
 */
+ (NSArray *)rankStrings {
    return @[@"?", @"A", @"2", @"3", @"4", @"5", @"6", @"7", @"8", @"9", @"10", @"J", @"Q", @"K"];
}

/*
 * A class method that returns an array of strings that contains
 * the four suits of a PlayingCard. This method is used to check
 * if a suit is valid or not.
 */
+ (NSArray *)validSuits {
    return @[@"♠", @"♣", @"♥", @"♦"];
}

/*
 * A class method that returns the maximum number a PlayingCard can be.
 */
+ (NSUInteger)maxRank {
    return [self rankStrings].count - 1;
}

// ---------- Getters and Setters ---------- //

/*
 * The getter for the suit. Returns "?" unless the suit is initialized.
 */
- (NSString *)suit {
    return _suit ? _suit : @"?";
}

/*
 * The setter of the suit property. This method does some checking
 * to see if the passed in suit is a valid suit. It only sets the
 * PlayingCard's suit if the passed in suit is contained in the
 * array that is returned by validSuits.
 */
- (void)setSuit:(NSString *)suit {
    // if the suit is valid
    if ([[PlayingCard validSuits] containsObject:suit]) {
        _suit = suit;
    }
}

/*
 * Setter for rank. Checks to see if the rank passed in is less than the
 * maximum allowed rank, if so, it sets the rank. Otherwise it does not.
 */
- (void)setRank:(NSUInteger)rank {
    if (rank <= [PlayingCard maxRank]) {
        _rank = rank;
    }
}

@end
