//
//  CardGameViewController.h
//  Matchismo
//
//  Created by Hamdan Javeed on 2013-04-27.
//  Copyright (c) 2013 Hamdan Javeed. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CardGameLogic.h"

@interface CardGameViewController : UIViewController
// a CardMatchingGameLogic property, to hold the logic for the game
@property (strong, nonatomic) CardGameLogic *game;
// an outlet collection array that contains all the card buttons
@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *cardButtons;

- (void)updateUI;
@end
