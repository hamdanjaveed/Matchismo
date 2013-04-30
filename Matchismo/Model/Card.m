//
//  Card.m
//  Matchismo
//
//  Created by Hamdan Javeed on 2013-04-27.
//  Copyright (c) 2013 Hamdan Javeed. All rights reserved.
//

#import "Card.h"

@implementation Card

// ---------- Instance Methods ---------- //

/*
 * This is just a placeholder method that is expected to be
 * overridden by the subclasses of Card. The subclasses are
 * expected to provide a more meaningful implementation of
 * the scorring algorithm. In this case, if the contents of
 * the cards in the array of cardsToBeMatched match the
 * contents of this card, the score is incremented.
 */
- (int)match:(NSArray *)cardsToBeMatched {
    // an int to hold the score
    int score = 0;
    
    // go through the array of cardsToBeMatched
    for (Card *card in cardsToBeMatched) {
        // if the card's contents is equal to this card's contents
        if ([card.contents isEqualToString:self.contents]) {
            // increment the score
            score++;
        }
    }
    
    // return the score
    return score;
}

@end
