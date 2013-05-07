//
//  CardMatchingGameViewController.m
//  Matchismo
//
//  Created by Hamdan Javeed on 2013-05-06.
//  Copyright (c) 2013 Hamdan Javeed. All rights reserved.
//

#import "CardMatchingGameViewController.h"
#import "CardMatchingGameLogic.h"
#import "PlayingCardDeck.h"

@interface CardMatchingGameViewController ()

@end

@implementation CardMatchingGameViewController

@synthesize game = _game;

// ---------- Instance Methods ---------- //

/*
 * Update's the UI for a card matching game. Sets the UI elements' state
 * to represent the game logic's state.
 */
- (void)updateUI {
    // update the score and last action labels
    [super updateUI];
    // get the image for the card's back
    UIImage *cardBackImage = [UIImage imageNamed:@"Card Back.jpeg"];
    // for each cardButton in cardButtons
    for (UIButton *cardButton in self.cardButtons) {
        // get the corresponding card object from the game logic
        Card *card = [self.game getCardAtIndex:[self.cardButtons indexOfObject:cardButton]];
        // set the title of the cardButton
        [cardButton setTitle:card.contents forState:UIControlStateSelected];
        // set the title of the cardButton for the disabled state as well
        [cardButton setTitle:card.contents forState:UIControlStateSelected|UIControlStateDisabled];
        // if the card is face down and in play
        if (!card.isFaceUp && card.isPlayable) {
            // set the image of the cardButton for the normal state
            [cardButton setImage:cardBackImage forState:UIControlStateNormal];
            cardButton.imageEdgeInsets = UIEdgeInsetsMake(5, 5, 5, 5);
        } else {
            [cardButton setImage:nil forState:UIControlStateNormal];
        }
        // if the card is faceUp, then set the cardButton to be selected
        cardButton.selected = card.isFaceUp;
        // if the card is un-playable, then set the cardButton to be disabled
        cardButton.enabled = card.playable;
        // set the card's alpha accordingly
        cardButton.alpha = card.playable ? 1.0 : 0.3;
    }
}

// ---------- Getters and Setters ---------- //

/*
 * Override the getter for the game logic from the CardGameViewController
 * to instead use a PlayingCardDeck and the logic from the CardMatchingGameLogic
 * class.
 */
- (CardGameLogic *)game {
    if (!_game) {
        _game = [[CardMatchingGameLogic alloc] initWithCardCount:self.cardButtons.count usingDeck:[[PlayingCardDeck alloc] init]];
    }
    return _game;
}

@end
