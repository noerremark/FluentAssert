/*
 * Copyright (c) 2020, salesforce.com, inc.
 * All rights reserved.
 * SPDX-License-Identifier: BSD-3-Clause
 * For full license text, see the LICENSE file in the repo root or https://opensource.org/licenses/BSD-3-Clause
 */
@IsTest
@SuppressWarnings('PMD.ApexUnitTestClassShouldHaveAsserts')
public class FASetHasSameSizeAsTest {
    @IsTest
    static void testPositiveScenarios() {
        FluentAssert.that(new Set<Object>{'X'}).hasSameSizeAs(new List<Object>{'Y'});
        FluentAssert.that(new Set<Object>{'X'}).hasSameSizeAs(new Set<Object>{'Y'});
    }

    @IsTest
    static void testNegativeScenarios() {
        try {
            FluentAssert.that((Set<Object>) new Set<Object>{'X'}).hasSameSizeAs(new List<Object>{'X', 'Y'});
            System.assert(false, 'No assert exception thrown');
        } catch(FluentAssert.AssertException ae) {
            // Success! Correct exception being thrown
            System.debug(LoggingLevel.INTERNAL, ae);
        } catch(Exception e) {
            System.assert(false, 'Wrong exception thrown, got: ' + e.getTypeName() + ', message: \\n' + e.getMessage());
            System.debug(LoggingLevel.ERROR, e);
        }

        try {
            FluentAssert.that((Set<Object>) new Set<Object>{'X'}).hasSameSizeAs(new Set<Object>{'X', 'Y'});
            System.assert(false, 'No assert exception thrown');
        } catch(FluentAssert.AssertException ae) {
            // Success! Correct exception being thrown
            System.debug(LoggingLevel.INTERNAL, ae);
        } catch(Exception e) {
            System.assert(false, 'Wrong exception thrown, got: ' + e.getTypeName() + ', message: \\n' + e.getMessage());
            System.debug(LoggingLevel.ERROR, e);
        }

    }

    @IsTest
    static void testValidations() {
        validationScenario(null, new Set<Object>());
        validationScenario(new Set<Object>(), (List<Object>) null);
        validationScenario(null, new Set<Object>());
        validationScenario(new Set<Object>(), (Set<Object>) null);
    }

    @SuppressWarnings('PMD.ApexUnitTestMethodShouldHaveIsTestAnnotation')
    private static void validationScenario(Set<Object> actual, List<Object> expected) {
        try {
            FluentAssert.that(actual).hasSameSizeAs(expected);
            System.assert(false, 'No assert exception thrown');
        } catch(NullPointerException npe) {
            // Success! Correct exception being thrown
            System.debug(LoggingLevel.INTERNAL, npe);
        } catch(Exception e) {
            System.assert(false, 'Wrong exception thrown, got: ' + e.getTypeName() + ', message: \\n' + e.getMessage());
            System.debug(LoggingLevel.ERROR, e);
        }
    }

    @SuppressWarnings('PMD.ApexUnitTestMethodShouldHaveIsTestAnnotation')
    private static void validationScenario(Set<Object> actual, Set<Object> expected) {
        try {
            FluentAssert.that(actual).hasSameSizeAs(expected);
            System.assert(false, 'No assert exception thrown');
        } catch(NullPointerException npe) {
            // Success! Correct exception being thrown
            System.debug(LoggingLevel.INTERNAL, npe);
        } catch(Exception e) {
            System.assert(false, 'Wrong exception thrown, got: ' + e.getTypeName() + ', message: \\n' + e.getMessage());
            System.debug(LoggingLevel.ERROR, e);
        }
    }
}