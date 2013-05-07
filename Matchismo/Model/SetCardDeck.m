//
//  SetCardDeck.m
//  Matchismo
//
//  Created by Hamdan Javeed on 2013-05-06.
//  Copyright (c) 2013 Hamdan Javeed. All rights reserved.
//

#import "SetCardDeck.h"
#import "SetCard.h"

@implementation SetCardDeck

- (id)init {
    self = [super init];
    if (self) {
        for (int i = 1; i <= [SetCard maxNumber]; i++) {
            for (NSString *symbol in [SetCard symbols]) {
                for (NSString *shading in [SetCard shading]) {
                    for (NSDictionary *color in [SetCard colors]) {
                        SetCard *card = [[SetCard alloc] init];
                        card.playable = YES;
                        card.faceUp = NO;
                        [card setNumber:i];
                        [card setSymbol:symbol];
                        [card setShading:shading];
                        [card setColor:color];
                        [self addCard:card atTop:YES];
                    }
                }
            }
        }
    }
    return self;
}

@end
