//
//  CardGameViewController.m
//  Matchismo
//
//  Created by Hamdan Javeed on 2013-04-27.
//  Copyright (c) 2013 Hamdan Javeed. All rights reserved.
//

#import "CardGameViewController.h"
#import "PlayingCardDeck.h"

@interface CardGameViewController ()
// a label to display the number of times the user has fliped a card
@property (weak, nonatomic) IBOutlet UILabel *flipCountLabel;
// a label to display the last action
@property (weak, nonatomic) IBOutlet UILabel *lastActionLabel;

// a variable to hold the flip count (a flip is defined as both a flip up and down)
@property (nonatomic) int flipCount;
// a deck to pull cards from
@property (strong, nonatomic) PlayingCardDeck *deck;
@end

@implementation CardGameViewController

// ---------- Instance Methods ---------- //

/*
 * This method gets called when the user flips a card. It sets the card's selected
 * state appropriately, and then if needed, draws a card from the deck and sets that
 * card's contents to the button's selected state title. It also inreases the flip count.
 */
- (IBAction)flipCard:(UIButton *)sender {
    // flip the selected state of the button
    sender.selected = !sender.isSelected;
    // if the button is face up
    if (sender.isSelected) {
        // set the button's title by drawing a random card from the deck
        [sender setTitle:[self.deck drawRandomCard].contents forState:UIControlStateSelected];
    }
    // increase the flip count
    self.flipCount++;
}

// ---------- Getters and Setters ---------- //

/*
 * The getter for the deck. Lazily instantiates the deck and returns it.
 */
- (PlayingCardDeck *)deck {
    if (!_deck) {
        _deck = [[PlayingCardDeck alloc] init];
    }
    return _deck;
}

/*
 * The setter for the flip count. Sets the flip count, and then updates the flip
 * count label.
 */
- (void)setFlipCount:(int)flipCount {
    _flipCount = flipCount;
    self.flipCountLabel.text = [NSString stringWithFormat:@"Flips: %d", self.flipCount];
}

@end
