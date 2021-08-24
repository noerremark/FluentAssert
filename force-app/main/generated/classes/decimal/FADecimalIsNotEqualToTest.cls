/*
 * Copyright (c) 2020, salesforce.com, inc.
 * All rights reserved.
 * SPDX-License-Identifier: BSD-3-Clause
 * For full license text, see the LICENSE file in the repo root or https://opensource.org/licenses/BSD-3-Clause
 */
@IsTest
@SuppressWarnings('PMD.ApexUnitTestClassShouldHaveAsserts')
public class FADecimalIsNotEqualToTest {
    @IsTest
    static void testPassingScenarios() {
        FluentAssert.that(-1000).isNotEqualTo(0);
        FluentAssert.that(    0).isNotEqualTo(1000);
        FluentAssert.that(-1000).isNotEqualTo(1000);
    }

    @IsTest
    static void testFailureScenarios() {
        failureScenario(0, 0);
    }

    @SuppressWarnings('PMD.ApexUnitTestMethodShouldHaveIsTestAnnotation')
    private static void failureScenario(Decimal actual, Decimal expected) {
        try {
            FluentAssert.that(actual).isNotEqualTo(expected);
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
        validationScenario(null, 0);
        validationScenario(0, null);
    }

    @SuppressWarnings('PMD.ApexUnitTestMethodShouldHaveIsTestAnnotation')
    private static void validationScenario(Decimal actual, Decimal expected) {
        try {
            FluentAssert.that(actual).isNotEqualTo(expected);
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