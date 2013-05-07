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
#import "SetCard.h"

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
    // for each cardButton
    for (UIButton *cardButton in [self cardButtons]) {
        // get the corresponding card in the game logic
        Card *unknownCard = [[self game] getCardAtIndex:[[self cardButtons] indexOfObject:cardButton]];
        // if the card is a SetCard
        if ([unknownCard isKindOfClass:[SetCard class]]) {
            // cast card to SetCard
            SetCard *card = (SetCard *)unknownCard;
            
            // set the title of the card
            NSString *title = [[NSString alloc] init];
            for (int i = 0; i < [card number]; i++) {
                title = [title stringByAppendingString:[card symbol]];
            }
            // get all color values
            float red = [[[card color] objectForKey:@"R"] floatValue];
            float green = [[[card color] objectForKey:@"G"] floatValue];
            float blue = [[[card color] objectForKey:@"B"] floatValue];
            float strokeAlpha = 1.0;
            float foregroundAlpha = [[card shading] isEqualToString:@"open"] ? 0.0 : [[card shading] isEqualToString:@"half"] ? 0.2 : 1.0;
            // create the stroke and foreground colors
            UIColor *colorStroke = [[UIColor alloc] initWithRed:red green:green blue:blue alpha:strokeAlpha];
            UIColor *colorForeground = [[UIColor alloc] initWithRed:red green:green blue:blue alpha:foregroundAlpha];
            float strokeWidth = [[card shading] isEqualToString:@"open"] ? 5.0 : -5.0;
            // create the dictionary of attributes
            NSDictionary *attributes = @{NSForegroundColorAttributeName: colorForeground,
                                             NSStrokeColorAttributeName: colorStroke,
                                             NSStrokeWidthAttributeName: [NSNumber numberWithFloat:strokeWidth]};
            // create the attributed title
            NSAttributedString *attributedTitle = [[NSAttributedString alloc] initWithString:title attributes:attributes];
            // set the title of the card button
            [cardButton setAttributedTitle:attributedTitle forState:UIControlStateNormal];
            
            // set the alpha of the card
            [cardButton setAlpha:[card isPlayable] ? 1.0 : 0.3];
            
            // set the playability of the card
            [cardButton setEnabled:[card isPlayable]];
            
            // set the background of the card
            [cardButton setBackgroundColor:[card isFaceUp] ? [UIColor blueColor] : [UIColor lightGrayColor]];
        }
    }
}

// ---------- Getters and Setters ---------- //

- (CardGameLogic *)game {
    if (!_game) {
        _game = [[CardSetGameLogic alloc] initWithCardCount:self.cardButtons.count usingDeck:[[SetCardDeck alloc] init]];
    }
    return _game;
}

@end
