//
//  Deck.m
//  Matchismo
//
//  Created by Hamdan Javeed on 2013-04-27.
//  Copyright (c) 2013 Hamdan Javeed. All rights reserved.
//

#import "Deck.h"

@interface Deck ()

// an array to hold the cards
@property (strong, nonatomic) NSMutableArray *cards;

@end

@implementation Deck

// ---------- Instance Methods ---------- //

/*
 * Adds a card to the deck. If atTop is true, then the card
 * is inserted at the 0th index of the array. If atTop is
 * false, then the card is appended to the end of the array.
 */
- (void)addCard:(Card *)card atTop:(BOOL)atTop {
    // if the card needs to be added to the top of the array
    if (atTop) {
        // insert the card at index 0
        [self.cards insertObject:card atIndex:0];
    } else {
        // else, append the card to the end of the array
        [self.cards addObject:card];
    }
}

/*
 * This method draws a random card from the deck. It returns
 * nil if the deck has no cards in it. It picks a random
 * number and then mods the number of cards in the deck
 * to ensure that a number within the domain of the card array
 * is selected. Once an index is selected, then the card is
 * removed from the deck and returned.
 */
- (Card *)drawRandomCard {
    // create a card object and initialize it to nil
    Card *randomCard = nil;
    // if the cards array contains cards
    if (self.cards.count) {
        // get a random index
        unsigned index = arc4random() % self.cards.count;
        // get the card in the array of cards at that index
        randomCard = self.cards[index];
        // remove the chosen card from the array of cards
        [self.cards removeObjectAtIndex:index];
    }
    // return the chosen card
    return randomCard;
}

// ---------- Getters and Setters ---------- //

/*
 * Getter for the array of cards. Lazily instantiates the card array
 * if needed.
 */
- (NSMutableArray *)cards {
    // if _cards is not instantiated
    if (!_cards) {
        // instantiate _cards
        _cards = [[NSMutableArray alloc] init];
    }
    // return _cards
    return _cards;
}

@end