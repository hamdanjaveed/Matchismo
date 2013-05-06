//
//  CardMatchingGameLogic.m
//  Matchismo
//
//  Created by Hamdan Javeed on 2013-05-05.
//  Copyright (c) 2013 Hamdan Javeed. All rights reserved.
//

#import "CardMatchingGameLogic.h"

@interface CardMatchingGameLogic()
// TODO
@property (strong, nonatomic) NSMutableArray *cards;
// the property to hold the score, is not readonly in this class
@property (nonatomic) int score;
@end

@implementation CardMatchingGameLogic

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
                        // increment the score by match score multiplied by MATCH_BONUS
                        self.score += matchScore * MATCH_BONUS;
                    // if a match was not found
                    } else {
                        // flip the other card so it's face down
                        otherCard.faceUp = NO;
                        self.score -= NO_MATCH_PENALTY;
                    }
                    break;
                }
            }
            // add a cost for flipping a card
            self.score -= FLIP_COST;
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

@end
