//
//  CardGameViewController.m
//  Matchismo
//
//  Created by Hamdan Javeed on 2013-04-27.
//  Copyright (c) 2013 Hamdan Javeed. All rights reserved.
//

#import "CardGameViewController.h"
#import "PlayingCardDeck.h"
#import "CardMatchingGameLogic.h"

@interface CardGameViewController ()
// a label to display the number of times the user has fliped a card
@property (weak, nonatomic) IBOutlet UILabel *flipCountLabel;
// a label to display the last action
@property (weak, nonatomic) IBOutlet UILabel *lastActionLabel;

// a variable to hold the flip count (a flip is defined as both a flip up and down)
@property (nonatomic) int flipCount;
// an outlet collection array that contains all the card buttons
@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *cardButtons;
// a CardMatchingGameLogic property, to hold the logic for the game
@property (strong, nonatomic) CardMatchingGameLogic *game;
// a label that displays the user's current score
@property (weak, nonatomic) IBOutlet UILabel *scoreLabel;
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
            UIImage *cardBackImage = [UIImage imageNamed:@"Card Back.jpeg"];
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
- (CardMatchingGameLogic *)game {
    // if _game has not been initialized
    if (!_game) {
        // initialize the game with self.cardButtons.count many cards and a PlayingCardDeck
        _game = [[CardMatchingGameLogic alloc] initWithCardCount:self.cardButtons.count usingDeck:[[PlayingCardDeck alloc] init]];
    }
    // return _game
    return _game;
}

@end
