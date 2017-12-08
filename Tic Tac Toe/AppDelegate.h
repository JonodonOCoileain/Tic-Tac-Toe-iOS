//
//  AppDelegate.h
//  Tic Tac Toe
//
//  Created by Jonathan Collins on 12/8/17.
//  Copyright © 2017 JC. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (readonly, strong) NSPersistentContainer *persistentContainer;

- (void)saveContext;


@end

