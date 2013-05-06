//
//  CardMatchingGameLogic.h
//  Matchismo
//
//  Created by Hamdan Javeed on 2013-05-05.
//  Copyright (c) 2013 Hamdan Javeed. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Deck.h"

@interface CardMatchingGameLogic : NSObject

/*
 * Designated Initializer for CardMatchingGameLogic.
 * Initialize a card matching game with a given card count and
 * a given deck to use.
 */
- (id)initWithCardCount:(NSUInteger)cardCount
              usingDeck:(Deck *)deck;

/*
 * Called when the user flips a card at the given index.
 */
- (void)flipCardAtIndex:(NSUInteger)index;

/*
 * Get the card at a given index.
 */
- (Card *)getCardAtIndex:(NSUInteger)index;

// a property to hold the user's score, is readonly
@property (nonatomic, readonly) int score;

// a property to hold the lastAction, is readonly
@property (nonatomic, readonly) NSString *lastAction;

@end
