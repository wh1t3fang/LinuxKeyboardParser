#!/usr/bin/ruby
# Read keyboard presses / release / holds on Linux
# Released under the MIT License
# add binary_struct using the following command "sudo gem install binary_struct".
# Use binary_struct to process blobs
require 'binary_struct'

##################!!!!######################
#!!!!CHANGE ME TO YOUR KEYBOARD DEVICE!!!!!#
############################################
# Device to READ
DEVICE = '/dev/input/event0'

# Keymappings, more can be found at
# https://github.com/torvalds/linux/blob/master/include/uapi/linux/input-event-codes.h
KEYS = {
  1  => "ESC",
  2  => "1",
  3  => "2",
  4  => "3",
  5  => "4",
  6  => "5",
  7  => "6",
  8  => "7",
  9  => "8",
  10 => "9",
  11 => "0",
  16 => "Q",
  17 => "W",
  18 => "E",
  19 => "R",
  20 => "T",
  21 => "Y",
  22 => "U",
  23 => "I",
  24 => "O",
  25 => "P",
  30 => "A",
  31 => "S",
  32 => "D",
  33 => "F",
  34 => "G",
  35 => "H",
  36 => "J",
  37 => "K",
  38 => "L",
  44 => "Z",
  45 => "X",
  46 => "C",
  47 => "V",
  48 => "B",
  49 => "N",
  50 => "M",
  12 => "Minus",
  13 => "Equal",
  14 => "Backspace",
  15 => "TAB",
  26 => "Leftbrace",
  27 => "Rightbrace",
  28 => "Enter",
  29 => "LeftControl",
  39 => "semicolon",
  40 => "apostrophy",
  41 => "grave",
  42 => "leftshift",
  43 => "backslash",
  51 => "comma",
  52 => "dot",
  53 => "slash",
  54 => "rightshift",
  55 => "kpasterix",
  56 => "leftalt",
  57 => "space",
  58 => "capslock",
  59 => "f1",
  60 => "f2",
  61 => "f3",
  62 => "f4",
  63 => "f5",
  64 => "f6",
  65 => "f7",
  66 => "f8",
  67 => "f9",
  68 => "f10"
}

# Define struct input_event
# https://www.kernel.org/doc/Documentation/input/input.txt
#
# Note!!!: make sure the byte lengths here are aligned with your system architecture:
# https://apidock.com/ruby/String/unpack
InputEvent = BinaryStruct.new(['Q', :sec,
                               'Q', :usec,
                               'S', :type,
                               'S', :code,
                               'l', :value])


dev = File.open(DEVICE, 'rb')

# Read input events from stream, decode, and output to stdout
while bin = dev.read(InputEvent.size)
  evnt = InputEvent.decode(bin)
  if evnt[:type] == 1
       key = evnt[:code]
       if KEYS.key?(key)
            key = KEYS[key]
         action = case evnt[:value]
                  when 0 then
                    "released"
                  when 1 then
                    "pressed"
                  when 2 then
                    "held"
                  else
                      "?"
                  end
         puts "Key: #{key} #{action}"
       end
  end
end

# fin!
