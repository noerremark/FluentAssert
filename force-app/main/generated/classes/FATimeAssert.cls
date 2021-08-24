/*
 * Copyright (c) 2020, salesforce.com, inc.
 * All rights reserved.
 * SPDX-License-Identifier: BSD-3-Clause
 * For full license text, see the LICENSE file in the repo root or https://opensource.org/licenses/BSD-3-Clause
 */
/**
 * @description Holds asserts for `Time`s
 */
public class FATimeAssert extends FAAssertBase {
    private Time actual;

    /**
     * @description Constructs an instance with an actual `Time` value.
     * @param actual The actual value to assert against.
     */
    public FATimeAssert(Time actual) {
        this.actual = actual;
    }

    /**
     * @description Verifies that the actual value is after expected
     * @param expected value to assert against
     * @return this to allow further assert in a fluent manner
     * @throws NullPointerException if actual or expected is null
     * @throws FluentAssert.AssertException if actual is not after or equal to expected
     */
    public FATimeAssert isAfter(Time expected) {
        notNull(actual, 'actual');
        notNull(expected, 'expected');
        if(FATimeUtil.toMillisecondsOfDay(actual) > FATimeUtil.toMillisecondsOfDay(expected)) {
            return this;
        }
        throw new FluentAssert.AssertException(String.format('Expecting {1} to be after {0}', new List<Object> {expected, actual}));
    }

    /**
     * @description Verifies that the actual value is after or equal to expected
     * @param expected value to assert against
     * @return this to allow further assert in a fluent manner
     * @throws NullPointerException if actual or expected is null
     * @throws FluentAssert.AssertException if actual is not after or equal to expected
     */
    public FATimeAssert isAfterOrEqualTo(Time expected) {
        notNull(actual, 'actual');
        notNull(expected, 'expected');
        if(FATimeUtil.toMillisecondsOfDay(actual) >= FATimeUtil.toMillisecondsOfDay(expected)) {
            return this;
        }
        throw new FluentAssert.AssertException(String.format('Expecting {1} to be after or equal to {0}', new List<Object> {expected, actual}));
    }

    /**
     * @description Verifies that the actual value is before expected
     * @param expected value to assert against
     * @return this to allow further assert in a fluent manner
     * @throws NullPointerException if actual or expected is null
     * @throws FluentAssert.AssertException if actual is not after or equal to expected
     */
    public FATimeAssert isBefore(Time expected) {
        notNull(actual, 'actual');
        notNull(expected, 'expected');
        if(FATimeUtil.toMillisecondsOfDay(actual) < FATimeUtil.toMillisecondsOfDay(expected)) {
            return this;
        }
        throw new FluentAssert.AssertException(String.format('Expecting {1} to be before {0}', new List<Object> {expected, actual}));
    }

    /**
     * @description Verifies that the actual value is before or equal to expected
     * @param expected value to assert against
     * @return this to allow further assert in a fluent manner
     * @throws NullPointerException if actual or expected is null
     * @throws FluentAssert.AssertException if actual is not after or equal to expected
     */
    public FATimeAssert isBeforeOrEqualTo(Time expected) {
        notNull(actual, 'actual');
        notNull(expected, 'expected');
        if(FATimeUtil.toMillisecondsOfDay(actual) <= FATimeUtil.toMillisecondsOfDay(expected)) {
            return this;
        }
        throw new FluentAssert.AssertException(String.format('Expecting {1} to be before or equal to {0}', new List<Object> {expected, actual}));
    }

    /**
     * @description Verifies that the actual value is in [start, end] range (start included, end included).
     * @param fromInclusive start (included) of range to assert against
     * @param toInclusive end (included) of range to assert against
     * @return this to allow further assert in a fluent manner
     * @throws NullPointerException if actual, fromInclusive and/or toInclusive is null
     * @throws FluentAssert.AssertException if actual is not between [start, end]
     */
    public FATimeAssert isBetween(Time fromInclusive, Time toInclusive) {
        notNull(actual, 'actual');
        notNull(fromInclusive, 'fromInclusive');
        notNull(toInclusive, 'toInclusive');
        if(FATimeUtil.toMillisecondsOfDay(actual) >= FATimeUtil.toMillisecondsOfDay(fromInclusive) && FATimeUtil.toMillisecondsOfDay(actual) <= FATimeUtil.toMillisecondsOfDay(toInclusive)) {
            return this;
        }

        throw new FluentAssert.AssertException(String.format('Expecting {2} to be within range [{0}:{1}] both included', new List<Object> {fromInclusive, toInclusive, actual}));
    }

    /**
     * @description Asserts that `actual` is equal to `expected`.
     * @param expected expected value to assert against
     * @return this to allow further assert in a fluent manner
     * @throws NullPointerException if actual or expected is null.
     * @throws FluentAssert.AssertException if actual is not equal to `expected`.
     */
    public FATimeAssert isEqualTo(Object expected) {
        notNull(actual, 'actual');
        notNull(expected, 'expected');

        if(actual != expected) {
            throw new FluentAssert.AssertException(String.format('Expecting {0} and {1} to be equal', new List<Object> {expected, actual}));
        }
        return this;
    }

    /**
     * @description Verifies that the actual is contained in expectedIn.
     * @param expectedIn collection that must contain actual
     * @return this to allow further assert in a fluent manner
     * @throws NullPointerException if actual or expectedIn is null
     * @throws FluentAssert.AssertException if actual is not in expectedIn
     */
    public FATimeAssert isIn(Set<Object> expectedIn) {
        notNull(actual, 'actual');

        if(!expectedIn.contains(actual)) {
            throw new FluentAssert.AssertException(String.format('Was expecting {0} to be in {1}', new List<Object> {actual, expectedIn}));
        }
        return this;
    }
    /**
     * @description Verifies that the actual is contained in expectedIn.
     * @param expectedIn collection that must contain actual
     * @return this to allow further assert in a fluent manner
     * @throws NullPointerException if actual or expectedIn is null
     * @throws FluentAssert.AssertException if actual is not in expectedIn
     */
    public FATimeAssert isIn(List<Object> expectedIn) {
        notNull(actual, 'actual');

        if(!expectedIn.contains(actual)) {
            throw new FluentAssert.AssertException(String.format('Was expecting {0} to be in {1}', new List<Object> {actual, expectedIn}));
        }
        return this;
    }

    /**
     * @description Asserts that `actual` is not equal to `expected`.
     * @param expected expected value to assert against
     * @return this to allow further assert in a fluent manner
     * @throws NullPointerException if actual or expected is null.
     * @throws FluentAssert.AssertException if actual is equal to `expected`.
     */
    public FATimeAssert isNotEqualTo(Object expected) {
        notNull(actual, 'actual');
        notNull(expected, 'expected');
        
        if(actual == expected) {
            throw new FluentAssert.AssertException(String.format('Expecting {0} and {1} not to be equal', new List<Object> {expected, actual}));
        }
        return this;
    }

    /**
     * @description Asserts that `actual` is not null.
     * @return this to allow further assert in a fluent manner
     * @throws FluentAssert.AssertException if actual is null.
     */
    public FATimeAssert isNotNull() {
        if(actual == null) {
            throw new FluentAssert.AssertException(String.format('Expecting {0} not to be null', new List<Object> {actual}));
        }
        return this;
    }

    /**
     * @description Asserts that `actual` is not same (part of memory) as `expected`.
     * @param expected expected value to assert against
     * @return this to allow further assert in a fluent manner
     * @throws NullPointerException if actual or expected is null.
     * @throws FluentAssert.AssertException if actual is not same (part of memory) as `expected`.
     */
    public FATimeAssert isNotSame(Object expected) {
        notNull(actual, 'actual');
        notNull(expected, 'expected');
        
        if(actual === expected) {
            throw new FluentAssert.AssertException(String.format('Expecting {0} and {1} not to be same', new List<Object> {expected, actual}));
        }
        return this;
    }

    /**
     * @description Asserts that `actual` is null.
     * @return this to allow further assert in a fluent manner
     * @throws FluentAssert.AssertException if actual is not null.
     */
    public FATimeAssert isNull() {
        if(actual != null) {
            throw new FluentAssert.AssertException(String.format('Expecting {0} to be null', new List<Object> {actual}));
        }
        return this;
    }

    /**
     * @description Asserts that `actual` is same (part of memory) as `expected`.
     * @param expected expected value to assert against
     * @return this to allow further assert in a fluent manner
     * @throws NullPointerException if actual or expected is null.
     * @throws FluentAssert.AssertException if actual is not is same (part of memory) as `expected`.
     */
    public FATimeAssert isSame(Object expected) {
        notNull(actual, 'actual');
        notNull(expected, 'expected');
        
        if(actual !== expected) {
            throw new FluentAssert.AssertException(String.format('Expecting {0} and {1} to be same', new List<Object> {expected, actual}));
        }
        return this;
    }

    /**
     * @description Verifies that the actual value is in ]start, end[ range (start excluded, end excluded).
     * @param fromExclusive start (excluded) of range to assert against
     * @param toExclusive end (excluded) of range to assert against
     * @return this to allow further assert in a fluent manner
     * @throws NullPointerException if actual, fromExclusive and/or toExclusive is null
     * @throws FluentAssert.AssertException if actual is not between [start, end]
     */
    public FATimeAssert isStrictlyBetween(Time fromExclusive, Time toExclusive) {
        notNull(actual, 'actual');
        notNull(fromExclusive, 'fromExclusive');
        notNull(toExclusive, 'toExclusive');
        if(FATimeUtil.toMillisecondsOfDay(actual) > FATimeUtil.toMillisecondsOfDay(fromExclusive) && FATimeUtil.toMillisecondsOfDay(actual) < FATimeUtil.toMillisecondsOfDay(toExclusive)) {
            return this;
        }
        throw new FluentAssert.AssertException(String.format('Expecting {2} to be within range ]{0}:{1}[ both excluded', new List<Object> {fromExclusive, toExclusive, actual}));
    }
}