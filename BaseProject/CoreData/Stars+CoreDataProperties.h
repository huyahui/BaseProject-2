//
//  Stars+CoreDataProperties.h
//  BaseProject
//
//  Created by amateur on 9/8/15.
//  Copyright © 2015 XA. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "Stars.h"

NS_ASSUME_NONNULL_BEGIN

@interface Stars (CoreDataProperties)

@property (nullable, nonatomic, retain) NSString *name;
@property (nullable, nonatomic, retain) NSString *image;

@end

NS_ASSUME_NONNULL_END
