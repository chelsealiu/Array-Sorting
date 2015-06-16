//
//  main.m
//  Array Sorting
//
//  Created by Chelsea Liu on 6/16/15.
//  Copyright (c) 2015 Chelsea Liu. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        NSMutableArray *myArray = [[NSMutableArray alloc] initWithArray: @[@"eeeeeAAbfdf", @"Everything", @"news to me", @"timepiece", @"egg", @"eggs", @"paper", @"e", @"facebook", @"painting", @"231 thurlow st", @"99 bottles"]];
        
        NSMutableArray *sortedArray = [[NSMutableArray alloc] initWithArray:myArray];
        
        //the block name is the comparator!!!!!!
        
        //Task 1: sort by alphabetical order
        NSComparator sortByAlphabet = ^(id obj1, id obj2) {
            NSComparisonResult result = [obj1 caseInsensitiveCompare: obj2];
            return result;
        };
        NSLog(@"%@", [sortedArray sortedArrayUsingComparator:sortByAlphabet]);
        
        //Task 2: sort by length
        NSComparator sortByLength = ^(id obj1, id obj2) {
            NSComparisonResult result;
            
            NSString *str1=obj1;
            NSString *str2=obj2;
            NSUInteger str1length = str1.length;
            NSUInteger str2length = str2.length;
            
            if (str1length > str2length) {
                return (NSComparisonResult)NSOrderedDescending;
            } else if (str1length < str2length) {
                return (NSComparisonResult)NSOrderedAscending;
            } else {
                return (NSComparisonResult)NSOrderedSame;
            }
            return result;
        };
        NSLog(@"%@", [sortedArray sortedArrayUsingComparator:sortByLength]);
        
        //Task 3: sort by alphabetical last character
        NSComparator sortByLastCharAlphabet = ^(id obj1, id obj2) {
            NSString *str1=obj1;
            NSString *str2=obj2;
            
            NSString *lastchar1 = [str1 substringFromIndex:str1.length -1];
            NSString *lastchar2 = [str2 substringFromIndex:str2.length -1];
            
            NSComparisonResult result = [lastchar1 caseInsensitiveCompare:lastchar2];
            return result;
        };
        NSLog(@"%@", [sortedArray sortedArrayUsingComparator:sortByLastCharAlphabet]);
        
        //Task 4: sort by occurrences of e
        NSComparator sortByOccurrencesOfE = ^(id obj1, id obj2) {
            NSComparisonResult result;
            
            NSString *str1=obj1;
            NSString *str2=obj2;
            
            NSUInteger numberOfOccurrences1 = [[str1 componentsSeparatedByString:@"e"] count] - 1 + [[str1 componentsSeparatedByString:@"E"] count] - 1;
            NSUInteger numberOfOccurrences2 = [[str2 componentsSeparatedByString:@"e"] count] - 1 + [[str2 componentsSeparatedByString:@"E"] count] - 1;
            
            if (numberOfOccurrences1 > numberOfOccurrences2) {
                return (NSComparisonResult)NSOrderedAscending;
            } else if (numberOfOccurrences1 < numberOfOccurrences2) {
                return (NSComparisonResult)NSOrderedDescending;
            } else {
                return (NSComparisonResult)NSOrderedSame;
            }
            return result;
        };
        NSLog(@"%@", [sortedArray sortedArrayUsingComparator:sortByOccurrencesOfE]);
        
    }
    return 0;
}








//        
//        
//        
//        
//        
//        
//        
//        NSMutableArray* (^sortAlphabetical)(NSString *) = ^NSMutableArray* (NSString *stringInArray){
//            [sortedArray sortUsingSelector:@selector(caseInsensitiveCompare:)];
//            NSLog(@"%@", sortedArray);
//            return sortedArray;
//        };
//        
//        
//        
//        //Task 2: sort by length
//        NSMutableArray *arrayToSort = [[NSMutableArray alloc] initWithArray:myArray];
//        int i, j;
//        NSMutableArray* (^sortBlock)(NSUInteger, NSUInteger) = [sortedArray sortedArrayUsingComparator: ^([myArray[i] length], [myArray[j] length]) {
//                    for (int i = 0; i < myArray.count; i ++) {
//                        for (int j = 0; j < myArray.count; j ++) {
//                    
//                    if ([myArray[i] length] > [myArray[j] length]) {
//                        return (NSComparisonResult)NSOrderedDescending;
//                    }
//                    if ([myArray[i] length] < [myArray[j] length]) {
//                        return (NSComparisonResult)NSOrderedAscending;
//                    }
//                    return (NSComparisonResult)NSOrderedSame;
//                        }}} ];
//            
//            
//   
//        
//        //                        [myArray exchangeObjectAtIndex:i withObjectAtIndex:j];
//
//        
//    
//        
////        
////        NSArray *sorted = [myArray sortedArrayUsingComparator:^(id obj1, id obj2){
////            if ([obj1 isKindOfClass:[NSString class]] && [obj2 isKindOfClass:[NSString class]]) {
////                NSString *s1 = obj1;
////                NSString *s2 = obj2;
////                if (s1.length > s2.length) {
////                    //                    return (NSComparisonResult)NSOrderedAscending;
////                    [myArray exchangeObjectAtIndex:[myArray indexOfObject:s1] withObjectAtIndex:[myArray indexOfObject:s2]];
////                    //
////                }
////            }
////        }
////                           
////                           ];
////        return sorted;
////        
//        
//        
//        //                } else if (s1.length < s2.length) {
//        ////                    return (NSComparisonResult)NSOrderedDescending;
//        ////                }
//        ////            } return (NSComparisonResult)NSOrderedSame;
//        //                }
//        //            }];
//        //        }
//        //        
//        //        return sortedArray;
//        
//        
//        
//        
//        
//        
//        //
//        //        NSMutableArray* (^sortAlphabetical)(NSString *) = ^NSMutableArray* (NSString *stringInArray)
//        //        {
//        //            for (int i = 0; i < sortedArray.count; i ++ ) {
//        //                for (int j = 0; j < sortedArray.count; j ++) {
//        //                    NSComparisonResult comparisonResult = [myArray[i] caseInsensitiveCompare:myArray[j]];
//        //                    if (comparisonResult == NSOrderedDescending) {
//        //                        [myArray exchangeObjectAtIndex:i withObjectAtIndex:j];
