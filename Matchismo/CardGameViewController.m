//
//  CardGameViewController.m
//  Matchismo
//
//  Created by Hamdan Javeed on 2013-04-27.
//  Copyright (c) 2013 Hamdan Javeed. All rights reserved.
//

#import "CardGameViewController.h"

@interface CardGameViewController ()
// a label to display the number of times the user has fliped a card
@property (weak, nonatomic) IBOutlet UILabel *flipCountLabel;
// a label to display the last action
@property (weak, nonatomic) IBOutlet UILabel *lastActionLabel;
// a label that displays the user's current score
@property (weak, nonatomic) IBOutlet UILabel *scoreLabel;

// a variable to hold the flip count (a flip is defined as both a flip up and down)
@property (nonatomic) int flipCount;
@end

@implementation CardGameViewController

// ---------- Instance Methods ---------- //

/*
 * This method gets called when the user flips a card. It delegates the responsibility
 * of handling a card flip to the game logic, then inreases the flip count and updates
 * the UI.
 */
- (IBAction)flipCard:(UIButton *)sender {
    // tell the game logic that a card has been flipped
    [self.game flipCardAtIndex:[self.cardButtons indexOfObject:sender]];
    // increase the flip count
    self.flipCount++;
    // update the UI to reflect the outcome of the flip
    [self updateUI];
}

/*
 * Updates the state of the button elements to correspond with the game logic's
 * state.
 */
- (void)updateUI {
    // update the score label
    self.scoreLabel.text = [NSString stringWithFormat:@"Score: %d", self.game.score];
    // update the lastAction label
    self.lastActionLabel.text = self.game.lastAction;
}

/*
 * User requested to re-deal, so reset the game logic.
 */
- (IBAction)deal {
    // set game logic to nil, so that it gets initialized again
    self.game = nil;
    // set the flip count to 0
    self.flipCount = 0;
    // reset the ui (this will re-initialize the game logic)
    [self updateUI];
}

// ---------- Getters and Setters ---------- //

/*
 * The setter for the cardButtons outlet collection. Updates the UI.
 */
- (void)setCardButtons:(NSArray *)cardButtons {
    // set the cardButtons
    _cardButtons = cardButtons;
    // update the UI to correspond to the logic
    [self updateUI];
}

/*
 * The setter for the flip count. Sets the flip count, and then updates the flip
 * count label.
 */
- (void)setFlipCount:(int)flipCount {
    _flipCount = flipCount;
    self.flipCountLabel.text = [NSString stringWithFormat:@"Flips: %d", self.flipCount];
}

/*
 * The getter for the CardMatchingGameLogic. Lazily instantiates the game logic with
 * a card count corresponding to the number of elements in the outlet collection
 * that contains the card buttons, and a new PlayingCardDeck.
 */
- (CardGameLogic *)game {
    // if _game has not been initialized
    if (!_game) {
        // initialize the game with self.cardButtons.count many cards and a PlayingCardDeck
        _game = [[CardGameLogic alloc] initWithCardCount:self.cardButtons.count usingDeck:[[Deck alloc] init]];
    }
    // return _game
    return _game;
}

@end
