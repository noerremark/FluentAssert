/*
 * Copyright (c) 2020, salesforce.com, inc.
 * All rights reserved.
 * SPDX-License-Identifier: BSD-3-Clause
 * For full license text, see the LICENSE file in the repo root or https://opensource.org/licenses/BSD-3-Clause
 */
@IsTest
@SuppressWarnings('PMD.ApexUnitTestClassShouldHaveAsserts')
public class FAIdIsInListTest {
    @IsTest
    static void testPassingScenarios() {
        FluentAssert.that((Id) UserInfo.getOrganizationId()).isIn((List<Object>) new List<Object>{(Id) UserInfo.getOrganizationId()});
    }

    @IsTest
    static void testFailureScenarios() {
        failureScenario((Id) UserInfo.getOrganizationId(), new List<Object>());
    }

    @SuppressWarnings('PMD.ApexUnitTestMethodShouldHaveIsTestAnnotation')
    private static void failureScenario(Id actual, List<Object> expected) {
        try {
            FluentAssert.that(actual).isIn(expected);
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
        validationScenario((Id) null, (List<Object>) new List<Object>{UserInfo.getOrganizationId()});
        validationScenario((Id) UserInfo.getOrganizationId(), (List<Object>) null);
    }

    @SuppressWarnings('PMD.ApexUnitTestMethodShouldHaveIsTestAnnotation')
    private static void validationScenario(Id actual, List<Object> expected) {
        try {
            FluentAssert.that(actual).isIn(expected);
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