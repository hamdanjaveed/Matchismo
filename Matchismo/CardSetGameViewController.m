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
    for (UIButton *cardButton in [self cardButtons]) {
        Card *unknownCard = [[self game] getCardAtIndex:[[self cardButtons] indexOfObject:cardButton]];
        if ([unknownCard isKindOfClass:[SetCard class]]) {
            SetCard *card = (SetCard *)unknownCard;
            NSString *title = [[NSString alloc] init];
            for (int i = 0; i < [card number]; i++) {
                title = [title stringByAppendingString:[card symbol]];
            }
            UIColor *colorStroke = [[UIColor alloc] initWithRed:[[[card color] objectForKey:@"R"] floatValue] green:[[[card color] objectForKey:@"G"] floatValue] blue:[[[card color] objectForKey:@"B"] floatValue] alpha:1.0];
            UIColor *colorForeground = [[UIColor alloc] initWithRed:[[[card color] objectForKey:@"R"] floatValue] green:[[[card color] objectForKey:@"G"] floatValue] blue:[[[card color] objectForKey:@"B"] floatValue] alpha:[[card shading] isEqualToString:@"open"] ? 0.0 : [[card shading] isEqualToString:@"half"] ? 0.2 : 1.0];
            float strokeWidth = [[card shading] isEqualToString:@"open"] ? 5.0 : -5.0;
            NSDictionary *attributes = @{NSForegroundColorAttributeName: colorForeground, NSStrokeColorAttributeName: colorStroke, NSStrokeWidthAttributeName: [NSNumber numberWithFloat:strokeWidth]};
            NSAttributedString *attributedTitle = [[NSAttributedString alloc] initWithString:title attributes:attributes];
            [cardButton setAttributedTitle:attributedTitle forState:UIControlStateNormal];
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
