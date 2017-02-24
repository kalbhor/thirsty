#!/bin/sh

# Override default water time
WATER_TIME=5
DRINK_WATER_CONF=$PWD/test.water

rm -f $DRINK_WATER_CONF

. ./thirsty.sh

echo "Running tests..."

# Test that drink_water returns nothing
out="$(drink_water)"
if [ -n "$out" ]; then
    echo "drink_water error. Expected '', got '$out'"
    exit 1
fi

sleep $(($WATER_TIME + 1))

# Test that drink_water tells us it's time for a drink
out="$(drink_water)"
expected="💧 You're thirsty"
if [ "$out" != "$expected" ]; then
    echo "drink_water error. Expected '$expected', got '$out'"
    exit 1
fi

# Test that not_thirsty sets a new time
before="$(cat $DRINK_WATER_CONF)"
out="$(not_thirsty)"
expected="Water is essential"
if [ "$out" != "$expected" ]; then
    echo "not_thirsty error. Expected '$expected', got '$out'"
    exit 1
fi
if [ "$before" = "$(cat $DRINK_WATER_CONF)" ]; then
    echo "not_thirsty error. Last drink time was not updated"
    exit 1
fi

# Test that next_drink outputs correctly
out="$(next_drink)"
expected="Next drink at $(date --date="@$(($(cat $DRINK_WATER_CONF) + $WATER_TIME))")"
if [ "$out" != "$expected" ]; then
    echo "next_drink error. Expected '$expected', got '$out'"
    exit 1
fi

rm -f $DRINK_WATER_CONF
echo "All tests passed"