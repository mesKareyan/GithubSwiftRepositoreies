//
//  AppDelegate.h
//  GitHubApp
//
//  Created by Mesrop Kareyan on 29/03/2019.
//  Copyright © 2019 Mesrop Kareyan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (readonly, strong) NSPersistentContainer *persistentContainer;

- (void)saveContext;


@end

