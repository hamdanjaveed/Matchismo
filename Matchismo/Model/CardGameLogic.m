//
//  CardGameLogic.m
//  Matchismo
//
//  Created by Hamdan Javeed on 2013-05-06.
//  Copyright (c) 2013 Hamdan Javeed. All rights reserved.
//

#import "CardGameLogic.h"

@interface CardGameLogic()
@property (strong, nonatomic) NSMutableArray *cards;
// the property to hold the score, is not readonly in this class
@property (nonatomic) int score;
// a property to hold the last action, is not readonly in this class
@property (strong, nonatomic) NSString *lastAction;
@end

@implementation CardGameLogic

// ---------- Instance Methods ---------- //

/*
 * Designated Initializer.
 * Initialize the cards property using the deck.
 */
- (id)initWithCardCount:(NSUInteger)cardCount usingDeck:(Deck *)deck {
    // initialize super class
    self = [super init];
    // if super class initialized
    if (self) {
        // loop through the specified number of cards
        for (int i = 0; i < cardCount; i++) {
            // draw a random card from the deck
            Card *card = [deck drawRandomCard];
            // if card does not exist
            if (!card) {
                // set ourselves to nil (adding nil to an NSMutableArray will crash)
                self = nil;
                // if card does exist
            } else {
                // add it to the i'th index of cards
                self.cards[i] = card;
            }
        }
    }
    // return self
    return self;
}

/*
 * Check to see if the index passed is ok, then return the card at that
 * index.
 */
- (Card *)getCardAtIndex:(NSUInteger)index {
    // if the index is less that the count of the cards array
    if (index < self.cards.count) {
        // return the card at that array
        return self.cards[index];
        // if the index is out of bounds
    } else {
        // return nil
        return nil;
    }
}

#define MATCH_BONUS 4
#define NO_MATCH_PENALTY 1
#define FLIP_COST 1

/*
 * Flip a card at a given index only if it is playable.
 */
- (void)flipCardAtIndex:(NSUInteger)index {
    // get the card at the given index, the bounds do not need to be checked since
    // getCardAtIndex: will check for us
    Card *card = [self getCardAtIndex:index];
    // if the card is still in play
    if (card.isPlayable) {
        // if the card is face down, and about to be flipped to face up
        if (!card.isFaceUp) {
            // a BOOL to check if other cards are face up
            BOOL otherCardsAreFaceUp = false;
            // for each card in the game
            for (Card *otherCard in self.cards) {
                // if the card is face up and is in play
                if (otherCard.isFaceUp && otherCard.isPlayable) {
                    // get the match score by matching the card about to be flipped
                    // with another face up playable card
                    int matchScore = [card match:@[otherCard]];
                    // if a match was found
                    if (matchScore) {
                        // set both cards to be un-playable
                        otherCard.playable = NO;
                        card.playable = NO;
                        // calculate the score this flip
                        int scoreThisFlip = matchScore * MATCH_BONUS;
                        // increment the score by scoreThisFlip
                        self.score += scoreThisFlip;
                        // set the lastAction message
                        self.lastAction = [NSString stringWithFormat:@"Matched %@ with %@ for %d points!", card.contents, otherCard.contents, scoreThisFlip];
                        
                        // if a match was not found
                    } else {
                        // flip the other card so it's face down
                        otherCard.faceUp = NO;
                        // calculate the scoreThisFlip
                        int scoreThisFlip = -NO_MATCH_PENALTY;
                        // decrement the score accordingly
                        self.score += scoreThisFlip;
                        // set the lastAction message
                        self.lastAction = [NSString stringWithFormat:@"%@ and %@ don't match! %d point penalty!", card.contents, otherCard.contents, -scoreThisFlip];
                    }
                    // set otherCardsAreFaceUp to true
                    otherCardsAreFaceUp = true;
                    // break from the loop
                    break;
                }
            }
            // add a cost for flipping a card
            self.score -= FLIP_COST;
            // if no action happened
            if (!otherCardsAreFaceUp) {
                // set the lastAction message
                self.lastAction = [NSString stringWithFormat:@"Flipped up %@", card.contents];
            }
        }
        // flip the card
        card.faceUp = !card.faceUp;
    }
}

// ---------- Getters and Setters ---------- //

/*
 * Lazily instantiate cards.
 */
- (NSMutableArray *)cards {
    // if _cards has not been initialized
    if (!_cards) {
        // initialize _cards
        _cards = [[NSMutableArray alloc] init];
    }
    // return _cards
    return _cards;
}

/*
 * Lazily instantiate lastAction.
 */
- (NSString *)lastAction {
    // if _lastAction has not been initialized
    if (!_lastAction) {
        // initialize _lastAction
        _lastAction = [[NSString alloc] init];
    }
    // return _lastAction
    return _lastAction;
}

@end
