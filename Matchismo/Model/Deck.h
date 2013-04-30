//
//  Deck.h
//  Matchismo
//
//  Created by Hamdan Javeed on 2013-04-27.
//  Copyright (c) 2013 Hamdan Javeed. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Card.h"

@interface Deck : NSObject

// adds a card to the deck
- (void)addCard:(Card *)card atTop:(BOOL)atTop;

// draws a random card from the deck
- (Card *)drawRandomCard;

@end
