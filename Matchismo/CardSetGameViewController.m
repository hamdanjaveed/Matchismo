//
//  CardSetGameViewController.m
//  Matchismo
//
//  Created by Hamdan Javeed on 2013-05-06.
//  Copyright (c) 2013 Hamdan Javeed. All rights reserved.
//

#import "CardSetGameViewController.h"
#import "CardSetGameLogic.h"
#import "SetCardDeck.h"

@interface CardSetGameViewController ()

@end

@implementation CardSetGameViewController

@synthesize game = _game;

// ---------- Instance Methods ---------- //

/*
 * Update the UI according to the CardSetGameLogic.
 */
- (void)updateUI {
    // update the score and last action labels
    [super updateUI];
}

// ---------- Getters and Setters ---------- //

- (CardGameLogic *)game {
    if (!_game) {
        _game = [[CardSetGameLogic alloc] initWithCardCount:self.cardButtons.count usingDeck:[[SetCardDeck alloc] init]];
    }
    return _game;
}

@end
