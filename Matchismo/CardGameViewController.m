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
// an outlet collection array that contains all the card buttons
@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *cardButtons;
@end

@implementation CardGameViewController

// ---------- Instance Methods ---------- //

/*
 * This method gets called when the user flips a card. It sets the card's selected
 * state appropriately, and also inreases the flip count.
 */
- (IBAction)flipCard:(UIButton *)sender {
    // flip the selected state of the button
    sender.selected = !sender.isSelected;
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
 * The setter for the cardButtons outlet collection.
 */
- (void)setCardButtons:(NSArray *)cardButtons {
    _cardButtons = cardButtons;
    for (UIButton *cardButton in cardButtons) {
        Card *card = [self.deck drawRandomCard];
        [cardButton setTitle:card.contents forState:UIControlStateSelected];
    }
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
