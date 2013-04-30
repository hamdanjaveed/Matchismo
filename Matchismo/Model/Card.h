//
//  Card.h
//  Matchismo
//
//  Created by Hamdan Javeed on 2013-04-27.
//  Copyright (c) 2013 Hamdan Javeed. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Card : NSObject

// a string to hold the contents of the card
@property (strong, nonatomic) NSString *contents;

// a BOOL to tell if the card is facing up or down
@property (nonatomic, getter = isFaceUp) BOOL faceUp;

// a BOOL to tell if the card can still be flipped
@property (nonatomic, getter = isPlayable) BOOL playable;

// a method to match this card with other cards
- (int)match:(NSArray *)cardsToBeMatched;

@end
