#import "TwoDimensionalArraySorter.h"

@implementation TwoDimensionalArraySorter

- (NSArray *)twoDimensionalSort:(NSArray<NSArray *> *)array {
    BOOL result2 = [self isOneDimensionalArray:array];
    if (result2 == YES) {
        return @[];
    }
    NSMutableArray *arrayOfNumbers = [NSMutableArray new];
    NSMutableArray *arrayOfStrings = [NSMutableArray new];
    NSMutableArray *result = [NSMutableArray new];
    for (int i = 0; i < array.count; i += 1) {
        if ([array[i].firstObject isKindOfClass:[NSString class]]) {
            [arrayOfStrings addObjectsFromArray:array[i]];
        } else if ([array[i].firstObject isKindOfClass:[NSNumber class]]) {
            [arrayOfNumbers addObjectsFromArray:array[i]];
            
            
        }
        
    }
    
    
    NSSortDescriptor *sortNumbers = [NSSortDescriptor sortDescriptorWithKey:@"integerValue" ascending:YES];
    NSArray *sortDescriptorsForNumbers = [NSArray arrayWithObject:sortNumbers];
    [arrayOfNumbers sortUsingDescriptors: sortDescriptorsForNumbers];
    
    NSArray *sortStrings = [arrayOfStrings sortedArrayUsingSelector:@selector(localizedCaseInsensitiveCompare:)];
    if (arrayOfNumbers.count == 0) {
        [result addObjectsFromArray:sortStrings];
        return result;
    } else if (sortStrings.count == 0) {
        [result addObjectsFromArray:arrayOfNumbers];
        return  result;
    } else {
        NSArray* reversedArray = [[sortStrings reverseObjectEnumerator] allObjects];
        
        [result addObjectsFromArray:arrayOfStrings];
        [result addObject:reversedArray];
    }
    
    return result;
}




- (BOOL)isOneDimensionalArrayContainsString:(NSArray *)array {
    for (int i = 0; i < array.count; i += 1) {
        if ([array[i] isKindOfClass:[NSString class]]) {
            return YES;
        } else if ([array[i] isKindOfClass:[NSNumber class]]) {
            return NO;
        }
    }
    return NO;
}

- (BOOL)isOneDimensionalArray:(NSArray *)array {
    if ([array.firstObject isKindOfClass:[NSArray class]]) {
        return NO;
    } else {
        return YES;
    }
}







@end
