//
//  MovieListManager.m
//  BaseProject
//
//  Created by amateur on 9/8/15.
//  Copyright © 2015 XA. All rights reserved.
//

#import "MovieListManager.h"
#import "MovieListApi.h"
#import "Stars+CoreDataProperties.h"
#import "CoreData+MagicalRecord.h"

@implementation MovieListManager

- (void)getMovieList
{
    MovieListApi *movieApi = [[MovieListApi alloc]init];
    
    [self sendRequestWithAPI:movieApi];
}

- (void)didSuccessParseDataWithResponseObject :(id)responseObj
{
    if ([Stars MR_findAll].count>0)
    {
        for (Stars *item in [Stars MR_findAll])
        {
            [item MR_deleteEntity];
        }
    }

    
    NSArray *array = [responseObj objectForKey:@"subjects"];
    
    for (int i=0;i<array.count;i++)
    {
        NSDictionary *dic = array[i];
        
        NSArray *pictures =  [dic objectForKey:@"casts"] ;
        
        for (int j=0; j<pictures.count; j++) {
            NSDictionary *dict = pictures[j];
            
            Stars *stars = [Stars MR_createEntity];
            stars.name = [dict objectForKey:@"name"];
            stars.image = [[dict objectForKey:@"avatars"] objectForKey:@"medium"];
        }
        [[NSManagedObjectContext MR_defaultContext] MR_saveToPersistentStoreAndWait];

    }
    NSLog(@"%@",NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)[0]);
}
- (void)didFailedParseDataWithResponseObject :(NSError *)error
{
    
}


@end
