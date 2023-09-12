local merge = require('utils').merge
local cursor = require('cursor')
local font = require('font')
local gui = require('gui')
local mouse_binds = require('mouse_binds')
local shell = require('shell')
local keybinds = require('keybinds')
local others = require('others')

require("eventhandlers")

local config = merge(cursor, font, gui, mouse_binds, shell, keybinds, others) 
local wayland_gnome = require 'wayland_gnome'
wayland_gnome.apply_to_config(config)
return config
